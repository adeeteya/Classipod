import 'dart:io';

import 'package:classipod/core/constants/constants.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/repositories/library/library_metadata.dart';
import 'package:classipod/core/repositories/library/library_progress.dart';
import 'package:classipod/core/repositories/library/library_repository.dart';
import 'package:classipod/core/repositories/library/library_source.dart';
import 'package:classipod/features/music/album/providers/album_details_provider.dart';
import 'package:classipod/features/music/playlist/models/playlist_model.dart';
import 'package:classipod/hive/hive_registrar.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive.dart';

LibrarySong record(int id, {String volume = 'primary', int modified = 1}) =>
    LibrarySong(
      uri: 'content://media/$volume/audio/media/$id',
      volume: volume,
      path: '/$volume/$id.mp3',
      size: 100,
      modified: modified,
      metadata: {'title': 'Fallback $id', 'duration': 1234},
    );

LibrarySnapshot snapshot(
  List<LibrarySong> songs, {
  List<String> volumes = const ['primary'],
}) => LibrarySnapshot(songs: songs, volumes: volumes);

void main() {
  late Directory directory;
  late LibrarySnapshot discovered;
  late LibraryRepository repository;
  late List<String> reads;
  late List<LibraryProgress> progress;
  var artwork = false;
  var fail = false;
  var failArtwork = false;

  setUp(() async {
    directory = await Directory.systemTemp.createTemp('classipod-library-test');
    Hive.init(directory.path);
    Hive.registerAdapters();
    await Hive.openBox<PlaylistModel>(Constants.playlistBoxName);
    discovered = snapshot([record(1), record(2)]);
    reads = [];
    progress = [];
    artwork = false;
    fail = false;
    failArtwork = false;
    repository = LibraryRepository(
      artworkDirectory: '${directory.path}/art',
      discover: () async => discovered,
      readTags: (uri, {artworkDirectory}) async {
        reads.add(artworkDirectory == null ? uri : 'art:$uri');
        if (fail) return {'error': 'bad file'};
        if (artworkDirectory != null) {
          if (failArtwork) return {'error': 'disk unavailable'};
          final image = File('$artworkDirectory/shared');
          await image.parent.create(recursive: true);
          await image.writeAsBytes([1, 2, 3]);
          return {'artworkPath': image.path};
        }
        return {
          'properties': {
            'TITLE': ['Track'],
            'ARTIST': ['AC/DC'],
            'ALBUM': ['Compilation'],
            'ALBUMARTIST': ['Various Artists'],
            'TRACKNUMBER': ['2/12'],
            'DISCNUMBER': ['1/2'],
          },
          'hasCover': artwork,
          'duration': 12345,
          'bitrate': 320,
        };
      },
    );
  });

  tearDown(() async {
    await Hive.close();
    Hive.resetAdapters();
    await directory.delete(recursive: true);
  });

  test(
    'progress can be published from an initializing library provider',
    () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final library = FutureProvider(
        (ref) =>
            repository.load(ref.read(libraryProgressProvider.notifier).report),
      );
      expect(await container.read(library.future), hasLength(2));
      expect(
        container.read(libraryProgressProvider).phase,
        LibraryPhase.complete,
      );
    },
  );

  test('warm startup reuses tags and counts cache hits', () async {
    await repository.load(progress.add);
    reads.clear();
    final result = await repository.load(progress.add);
    expect(result, hasLength(2));
    expect(reads, isEmpty);
    expect(progress.last.songsCached, 2);
    expect(progress.last.phase, LibraryPhase.complete);
  });

  test(
    'changes, additions and deletions preserve remaining song identity',
    () async {
      final first = await repository.load(progress.add);
      reads.clear();
      discovered = snapshot([record(2, modified: 2), record(3)]);
      final next = await repository.load(progress.add);
      expect(reads, hasLength(2));
      expect(next.first.identity, first.last.identity);
      expect(next.first.originalSongIndex, first.last.originalSongIndex);
      expect(
        next.last.originalSongIndex,
        greaterThan(first.last.originalSongIndex),
      );
      final stored =
          Hive.box<dynamic>(LibraryRepository.boxName).get('snapshot') as Map;
      expect(stored['records'], hasLength(2));
    },
  );

  test(
    'disconnected volume is retained and restored without tag reads',
    () async {
      discovered = snapshot(
        [record(1), record(2, volume: 'sd')],
        volumes: ['primary', 'sd'],
      );
      await repository.load(progress.add);
      discovered = snapshot([record(1)]);
      expect(await repository.load(progress.add), hasLength(1));
      final stored =
          Hive.box<dynamic>(LibraryRepository.boxName).get('snapshot') as Map;
      expect(stored['records'], hasLength(2));
      reads.clear();
      discovered = snapshot(
        [record(1), record(2, volume: 'sd')],
        volumes: ['primary', 'sd'],
      );
      expect(await repository.load(progress.add), hasLength(2));
      expect(reads, isEmpty);
    },
  );

  test('legacy cache is deleted and ratings are not imported', () async {
    final legacyBox = await Hive.openBox<MusicMetadata>(
      Constants.metadataBoxName,
    );
    await legacyBox.add(
      MusicMetadata(
        filePath: '/primary/2.mp3',
        rating: 4,
        originalSongIndex: 8,
      ),
    );
    await legacyBox.close();
    await LibraryRepository.deleteLegacyMetadata();
    expect(await Hive.boxExists(Constants.metadataBoxName), isFalse);
    expect(Hive.isBoxOpen(Constants.metadataBoxName), isFalse);
    final songs = await repository.load(progress.add);
    expect(songs.last.rating, 0);
    expect(songs.last.originalSongIndex, 1);
    expect(songs.last.songId, record(2).uri);
    expect(reads, hasLength(2));
  });

  test('cleanup preserves the new cache, ratings and playlist order', () async {
    final songs = await repository.load(progress.add);
    final playlists = Hive.box<PlaylistModel>(Constants.playlistBoxName);
    await playlists.add(
      PlaylistModel(name: 'Favorites', songs: [songs.last, songs.first]),
    );
    await LibraryRepository.updateRating(songs.last.copyWith(rating: 5));
    final legacyBox = await Hive.openBox<MusicMetadata>(
      Constants.metadataBoxName,
    );
    await legacyBox.add(MusicMetadata(filePath: '/unused.mp3'));
    await LibraryRepository.deleteLegacyMetadata();
    await LibraryRepository.deleteLegacyMetadata();
    reads.clear();
    final refreshed = await repository.load(progress.add);
    expect(reads, isEmpty);
    expect(refreshed.last.rating, 5);
    expect(playlists.values.single.name, 'Favorites');
    expect(playlists.values.single.songs.map((song) => song.identity), [
      songs.last.identity,
      songs.first.identity,
    ]);
    expect(playlists.values.single.songs.first.rating, 5);
    expect(await Hive.boxExists(Constants.metadataBoxName), isFalse);
  });

  test('query failure preserves last snapshot', () async {
    await repository.load(progress.add);
    final box = Hive.box<dynamic>(LibraryRepository.boxName);
    final before = box.get('snapshot');
    final broken = LibraryRepository(
      artworkDirectory: directory.path,
      discover: () async => throw StateError('permission revoked'),
      readTags: (_, {artworkDirectory}) async => {},
    );
    await expectLater(broken.load(progress.add), throwsStateError);
    expect(box.get('snapshot'), before);
  });

  test('extraction interruption does not commit a partial index', () async {
    await repository.load(progress.add);
    final box = Hive.box<dynamic>(LibraryRepository.boxName);
    final before = box.get('snapshot');
    final interrupted = LibraryRepository(
      artworkDirectory: directory.path,
      discover: () async => snapshot([record(1, modified: 3)]),
      readTags: (_, {artworkDirectory}) async =>
          throw StateError('worker exited'),
    );
    await expectLater(interrupted.load(progress.add), throwsStateError);
    expect(box.get('snapshot'), before);
  });

  test('artwork cache hits and repair use accurate per-song totals', () async {
    artwork = true;
    final songs = await repository.load(progress.add);
    expect(progress.last.artworkTotal, 2);
    expect(progress.last.artworkCached, 2);
    reads.clear();
    await repository.load(progress.add);
    expect(reads, isEmpty);
    await File(songs.first.thumbnailPath!).delete();
    await repository.load(progress.add);
    expect(reads, ['art:${record(1).path}']);
    expect(progress.last.artworkCached, 2);
  });

  test(
    'failed reads retain fallback metadata and retry next startup',
    () async {
      fail = true;
      final songs = await repository.load(progress.add);
      expect(songs.first.trackName, 'Fallback 1');
      expect(progress.last.failures, 2);
      expect(progress.last.artworkCached, 0);
      reads.clear();
      await repository.load(progress.add);
      expect(reads, hasLength(2));
    },
  );

  test('force scan rereads songs without deleting playlists', () async {
    await repository.load(progress.add);
    reads.clear();
    repository.forceNextScan = true;
    await repository.load(progress.add);
    expect(reads, hasLength(2));
    expect(repository.forceNextScan, isFalse);
  });

  test('artwork failures do not count as cached and are retried', () async {
    artwork = true;
    failArtwork = true;
    await repository.load(progress.add);
    expect(progress.last.artworkTotal, 2);
    expect(progress.last.artworkCached, 0);
    expect(progress.last.failures, 2);
    reads.clear();
    failArtwork = false;
    await repository.load(progress.add);
    expect(reads.every((value) => value.startsWith('art:')), isTrue);
    expect(progress.last.artworkCached, 2);
  });

  test('concurrent consumers share one discovery and extraction run', () async {
    final results = await Future.wait([
      repository.load(progress.add),
      repository.load(progress.add),
    ]);
    expect(results.first, results.last);
    expect(reads, hasLength(2));
  });

  test('empty library completes with zero totals', () async {
    discovered = snapshot([]);
    expect(await repository.load(progress.add), isEmpty);
    expect(progress.last.songsTotal, 0);
    expect(progress.last.artworkTotal, 0);
  });

  test('conservative artists and compilation album grouping', () async {
    expect(conservativeNames(['AC/DC', 'Earth, Wind & Fire', 'A; B']), [
      'AC/DC',
      'Earth, Wind & Fire',
      'A',
      'B',
    ]);
    final songs = await repository.load(progress.add);
    expect(songs.first.albumArtistName, 'Various Artists');
    expect(songs.first.albumLength, 12);
    expect(buildAlbumDetails(songs), hasLength(1));
    expect(
      buildAlbumDetails([
        songs.first,
        songs.last.copyWith(albumArtistNames: ['Another artist']),
      ]),
      hasLength(2),
    );
  });
}
