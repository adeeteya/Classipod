import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/subsonic/subsonic_client.dart';
import 'package:classipod/core/subsonic/subsonic_repository.dart';
import 'package:classipod/hive/hive_adapters.dart';
import 'package:classipod/hive/hive_registrar.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

http.Response ok(Map<String, dynamic> body) => http.Response(
  jsonEncode({
    'subsonic-response': {'status': 'ok', ...body},
  }),
  200,
);

const config = SubsonicConfig(
  'https://example.test/music',
  'user & name',
  enabled: true,
);

class LegacyMetadataReader extends Fake implements BinaryReader {
  final bytes = [3, 0, 12, 18].iterator;
  final values = ['Old song', '/music/old.mp3', 'local-id'].iterator;
  @override
  int readByte() {
    bytes.moveNext();
    return bytes.current;
  }

  @override
  dynamic read([int? typeId]) {
    values.moveNext();
    return values.current;
  }
}

void main() {
  test('existing metadata without remote Hive fields remains local', () {
    final song = MusicMetadataAdapter().read(LegacyMetadataReader());
    expect(song.trackName, 'Old song');
    expect(song.identity, 'local-id');
    expect(song.isOnDevice, isTrue);
    expect(song.serverId, isNull);
    expect(song.remoteSongId, isNull);
  });

  group('Subsonic client', () {
    test('normalizes base paths and encodes token authentication', () {
      expect(
        SubsonicConfig.normalizeUrl(' https://example.test/music/// '),
        config.url,
      );
      final client = SubsonicClient(config, 'sesame', salt: () => 'c19b2d');
      addTearDown(client.close);
      final uri = client.uri('stream', {'id': 'song & /?#'});
      expect(uri.path, '/music/rest/stream.view');
      expect(uri.queryParameters['t'], '26719a1196d2a940705a59634eb18eab');
      expect(uri.queryParameters['id'], 'song & /?#');
      expect(uri.queryParameters['u'], config.username);
      expect(uri.queryParameters['p'], isNull);
      expect(uri.toString(), isNot(contains('sesame')));
      for (final url in [
        'ftp://host',
        'https://u:p@host',
        'host',
        'https://host?q=x',
        'https://host#fragment',
      ]) {
        expect(
          () => SubsonicConfig.normalizeUrl(url),
          throwsA(isA<SubsonicException>()),
        );
      }
    });

    test('HTTP, JSON, and protocol errors are sanitized', () async {
      for (final response in [
        http.Response('private', 401),
        http.Response('<html>login</html>', 200),
        http.Response(
          jsonEncode({
            'subsonic-response': {
              'status': 'failed',
              'error': {'code': 40, 'message': 'secret'},
            },
          }),
          200,
        ),
      ]) {
        final client = SubsonicClient(
          config,
          'secret',
          client: MockClient((_) async => response),
        );
        addTearDown(client.close);
        await expectLater(
          client.ping(),
          throwsA(
            isA<SubsonicException>().having(
              (e) => e.toString(),
              'safe error',
              isNot(contains('secret')),
            ),
          ),
        );
      }
    });

    test('parses metadata without downloading the audio', () {
      final song = SubsonicRepository.parseSong(
        {
          'id': 'a',
          'title': 'Title',
          'duration': 2.5,
          'track': '2',
          'discNumber': 3,
          'artists': [
            {'name': 'One'},
            {'name': 'Two'},
          ],
          'genres': [
            {'name': 'Jazz'},
          ],
        },
        {
          'id': 'album',
          'name': 'Album',
          'artist': 'Artist',
          'coverArt': 'art / id',
        },
        config.id,
      );
      expect(song.trackDuration, 2500);
      expect(song.trackArtistNames, ['One', 'Two']);
      expect(song.genres, ['Jazz']);
      expect(song.remoteAlbumId, 'album');
      expect(song.filePath, isNull);
      expect(song.identity, startsWith('subsonic:${config.id}:'));
      expect(Uri.parse(song.thumbnailPath!).pathSegments.single, 'art / id');
      expect(song.parentDirectoryPath, isNull);
      expect(song.toAudioSource, throwsStateError);
    });
  });

  group('Subsonic catalog', () {
    late Directory directory;
    late SubsonicRepository repository;
    setUp(() async {
      directory = await Directory.systemTemp.createTemp('subsonic-test-');
      Hive.init(directory.path);
      if (!Hive.isAdapterRegistered(2)) Hive.registerAdapters();
      repository = SubsonicRepository(await Hive.openBox<dynamic>('remote'));
    });
    tearDown(() async {
      await Hive.close();
      await directory.delete(recursive: true);
    });

    SubsonicClient fixture({bool repeat = false, bool fail = false}) =>
        SubsonicClient(
          config,
          'secret',
          client: MockClient((request) async {
            final q = request.url.queryParameters;
            if (request.url.path.endsWith('getAlbumList2.view')) {
              return ok({
                'albumList2': {
                  'album': q['offset'] == '0' || repeat
                      ? [
                          {'id': 'album'},
                        ]
                      : [],
                },
              });
            }
            if (fail) return http.Response('server failed', 500);
            return ok({
              'album': {
                'id': 'album',
                'name': 'Album',
                'song': [
                  {'id': 'song', 'title': 'Original', 'duration': 3},
                  {'id': 'song', 'title': 'Original', 'duration': 3},
                ],
              },
            });
          }),
        );

    test(
      'deduplicates, commits a full catalog and preserves overrides',
      () async {
        final client = fixture();
        addTearDown(client.close);
        final songs = await repository.scan(client);
        expect(songs, hasLength(1));
        await repository.update(
          songs.single.copyWith(rating: 4, trackName: 'My title'),
        );
        final refreshed = await repository.scan(client);
        expect(refreshed.single.rating, 4);
        expect(refreshed.single.trackName, 'My title');
        expect(repository.cached(config.id).single.remoteSongId, 'song');
        expect(repository.cached('another server'), isEmpty);
      },
    );

    test(
      'failed or repeated-page scans preserve the previous snapshot',
      () async {
        final client = fixture();
        addTearDown(client.close);
        await repository.scan(client);
        for (final broken in [fixture(fail: true), fixture(repeat: true)]) {
          addTearDown(broken.close);
          await expectLater(
            repository.scan(broken),
            throwsA(isA<SubsonicException>()),
          );
          expect(repository.cached(config.id), hasLength(1));
        }
      },
    );

    test('cancelled in-flight scan cannot publish a catalog', () async {
      final response = Completer<http.Response>();
      final started = Completer<void>();
      final client = SubsonicClient(
        config,
        'secret',
        client: MockClient((_) {
          started.complete();
          return response.future;
        }),
      );
      addTearDown(client.close);
      final scan = repository.scan(client);
      final expectation = expectLater(scan, throwsA(isA<SubsonicException>()));
      await started.future;
      repository.cancel();
      response.complete(
        ok({
          'albumList2': {'album': []},
        }),
      );
      await expectation;
      expect(repository.cached(config.id), isEmpty);
    });

    test('album requests are bounded to four and all pages are read', () async {
      var active = 0;
      var maximum = 0;
      final client = SubsonicClient(
        config,
        'secret',
        client: MockClient((r) async {
          final q = r.url.queryParameters;
          if (r.url.path.endsWith('getAlbumList2.view')) {
            return ok({
              'albumList2': {
                'album': q['offset'] == '0'
                    ? List.generate(9, (i) => {'id': '$i'})
                    : [],
              },
            });
          }
          active++;
          if (active > maximum) maximum = active;
          await Future<void>.delayed(const Duration(milliseconds: 1));
          active--;
          return ok({
            'album': {
              'id': q['id'],
              'song': [
                {'id': q['id']},
              ],
            },
          });
        }),
      );
      addTearDown(client.close);
      expect(await repository.scan(client), hasLength(9));
      expect(maximum, 4);
    });

    test(
      'artwork caches by server/id and coalesces simultaneous requests',
      () async {
        var requests = 0;
        final client = SubsonicClient(
          config,
          'secret',
          client: MockClient((_) async {
            requests++;
            return http.Response.bytes(
              [1, 2, 3],
              200,
              headers: {'content-type': 'image/png'},
            );
          }),
        );
        addTearDown(client.close);
        final images = await Future.wait([
          repository.artwork(client, 'art'),
          repository.artwork(client, 'art'),
        ]);
        expect(images.first, Uint8List.fromList([1, 2, 3]));
        await repository.artwork(client, 'art');
        expect(requests, 1);
        await repository.clearArtwork(config.id);
        await repository.artwork(client, 'art');
        expect(requests, 2);
      },
    );

    test('metadata survives Hive round trip with remote fields', () async {
      final song = MusicMetadata(
        serverId: config.id,
        remoteSongId: 'song',
        remoteAlbumId: 'album',
        remoteArtworkId: 'art',
        isOnDevice: false,
      );
      await repository.box.put('song', song);
      await repository.box.close();
      final reopened = await Hive.openBox<dynamic>('remote');
      final saved = reopened.get('song') as MusicMetadata;
      expect(saved.remoteArtworkId, 'art');
      expect(saved.serverId, config.id);
    });
  });
}
