import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:classipod/core/constants/constants.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/providers/filtered_audio_files_provider.dart';
import 'package:classipod/core/repositories/metadata_reader_repository.dart';
import 'package:classipod/features/music/album/models/album_model.dart';
import 'package:classipod/features/music/album/providers/album_details_provider.dart';
import 'package:classipod/features/music/artists/providers/artist_names_provider.dart';
import 'package:classipod/features/music/search/model/search_model.dart';
import 'package:classipod/features/music/search/provider/search_provider.dart';
import 'package:classipod/features/music/songs/provider/songs_provider.dart';
import 'package:classipod/hive/hive_registrar.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive.dart';

Map<String, dynamic> _readJson(String path) =>
    jsonDecode(File(path).readAsStringSync()) as Map<String, dynamic>;

String _join(String parent, String relative) =>
    [parent, ...relative.split('/')].join(Platform.pathSeparator);

int _bytes(Directory directory) => directory
    .listSync(recursive: true, followLinks: false)
    .whereType<File>()
    .fold(0, (size, file) => size + file.lengthSync());

void _verify(
  List<MusicMetadata> records,
  Map<String, dynamic> manifest,
  String music,
  String root,
) {
  final entries = (manifest['entries'] as List).cast<Map<String, dynamic>>();
  final expected = {
    for (final entry in entries)
      if (entry['outcome'] == 'import') _join(music, entry['path']): entry,
  };
  expect(records.length, manifest['validTracks']);
  final actualPaths = records.map((record) => record.filePath).toSet();
  final expectedPaths = expected.keys.toSet();
  // Deep matcher equality on sets scans pairs of elements. Hash-set differences
  // keep these checks linear at 50,000 tracks and give bounded failure output.
  expect(
    actualPaths.length,
    records.length,
    reason: 'Duplicate imported paths',
  );
  expect(
    expectedPaths.difference(actualPaths).take(10),
    isEmpty,
    reason: 'Missing paths (first 10)',
  );
  expect(
    actualPaths.difference(expectedPaths).take(10),
    isEmpty,
    reason: 'Unexpected paths (first 10)',
  );
  final indices = records.map((record) => record.originalSongIndex).toSet();
  expect(indices.length, records.length);
  expect(
    indices.where((index) => index < 0 || index >= records.length).take(10),
    isEmpty,
    reason: 'Indices must cover the imported list',
  );
  final checkedArtwork = <String>{};
  for (final record in records) {
    final entry = expected[record.filePath]!;
    final fields = entry['expected'] as Map<String, dynamic>;
    final actual = record.toMap();
    for (final field in fields.entries) {
      expect(
        actual[field.key],
        field.value,
        reason: '${entry['path']}: ${field.key}',
      );
    }
    expect(
      record.trackDuration,
      closeTo(entry['durationMs'] as num, entry['durationToleranceMs'] as num),
      reason: '${entry['path']}: duration',
    );
    expect(record.bitrate, greaterThan(0), reason: entry['path'] as String);
    final artwork = entry['artwork'] as String?;
    if (artwork == null) {
      expect(record.thumbnailPath, isNull);
    } else {
      expect(record.thumbnailPath, isNotNull);
      // Check each cache path against each expected source once. The same album
      // can legitimately share artwork across thousands of volume copies.
      if (checkedArtwork.add('${record.thumbnailPath}:$artwork')) {
        expect(
          File(record.thumbnailPath!).readAsBytesSync(),
          File(_join(root, artwork)).readAsBytesSync(),
          reason: '${entry['path']}: artwork',
        );
      }
    }
  }
}

Future<Map<String, dynamic>> _importOrReopen(
  Map<String, dynamic> config,
) async {
  final manifestPath = config['manifest'] as String;
  final manifest = _readJson(manifestPath);
  final music = _join(File(manifestPath).parent.path, 'music');
  final output = config['output'] as String;
  final database = Directory(_join(output, 'hive'));
  final thumbnails = Directory(_join(output, 'thumbnails'));
  final snapshot = File(_join(output, 'snapshot.json'));
  final metrics = <String, dynamic>{};
  Hive.init(database.path);
  Hive.registerAdapters();
  addTearDown(Hive.close);
  final timer = Stopwatch();

  if (config['mode'] == 'import') {
    database.createSync();
    thumbnails.createSync();
    final repository = MetadataReaderRepository(thumbnails.path);
    final paths = (manifest['entries'] as List)
        .map((entry) => _join(music, entry['path'] as String))
        .toList();
    timer.start();
    final records = config['method'] == 'directory'
        ? await compute(repository.extractMetadataFromDirectory, music)
        : await compute(repository.extractMetadataFromFiles, paths);
    metrics['parseMs'] = timer.elapsedMicroseconds / 1000;
    _verify(records, manifest, music, config['root'] as String);
    // Full field snapshot is only the persistence oracle. Parsing expectations
    // above always come from the independently generated manifest.
    snapshot.writeAsStringSync(
      jsonEncode(records.map((record) => record.toMap()).toList()),
    );
    timer
      ..reset()
      ..start();
    final box = await Hive.openBox<MusicMetadata>(Constants.metadataBoxName);
    await box.addAll(records);
    await box.flush();
    await Hive.close();
    metrics['hiveWriteMs'] = timer.elapsedMicroseconds / 1000;
  } else {
    timer.start();
    final box = await Hive.openBox<MusicMetadata>(Constants.metadataBoxName);
    final records = box.values.toList();
    metrics['hiveReopenMs'] = timer.elapsedMicroseconds / 1000;
    _verify(records, manifest, music, config['root'] as String);
    final saved = (jsonDecode(snapshot.readAsStringSync()) as List)
        .cast<Map<String, dynamic>>();
    expect(records.length, saved.length);
    for (var index = 0; index < records.length; index++) {
      expect(
        records[index].toMap(),
        saved[index],
        reason: 'Persisted row $index',
      );
    }
    await Hive.close();
  }
  metrics.addAll({
    'validTracks': manifest['validTracks'],
    'profile': manifest['profile'],
    'method': config['method'],
    'thumbnailBytes': _bytes(thumbnails),
    'databaseBytes': _bytes(database),
  });
  return metrics;
}

Future<Map<String, dynamic>> _synthetic(int count) async {
  String padded(int value) => value.toString().padLeft(6, '0');
  String artist(int value) => 'Artist ${padded(value)}';
  final records = List.generate(count, (index) {
    final album = index ~/ 10;
    return MusicMetadata(
      trackName: 'Track ${padded(index)}',
      trackArtistNames: [artist(album % 100)],
      albumArtistName: artist(album % 100),
      albumName: 'Album ${padded(album)}',
      discNumber: (index % 10) ~/ 5 + 1,
      trackNumber: index % 5 + 1,
      originalSongIndex: index,
      filePath: '/synthetic/$index.mp3',
    );
  });
  final container = ProviderContainer(
    overrides: [
      filteredAudioFilesProvider.overrideWith(
        (_) async => UnmodifiableListView(records.reversed),
      ),
    ],
  );
  addTearDown(container.dispose);
  await container.read(filteredAudioFilesProvider.future);
  final timer = Stopwatch()..start();
  final songs = container.read(songsProvider);
  final sortMs = timer.elapsedMicroseconds / 1000;
  expect(
    songs.map((song) => song.originalSongIndex),
    orderedEquals(List.generate(count, (index) => index)),
  );

  timer.reset();
  final albums = container.read(albumDetailsProvider);
  final groupingMs = timer.elapsedMicroseconds / 1000;
  expect(albums.length, count ~/ 10);
  final expectedAlbums = List.generate(count ~/ 10, (index) => index)
    ..sort((a, b) {
      final byArtist = (a % 100).compareTo(b % 100);
      return byArtist == 0 ? a.compareTo(b) : byArtist;
    });
  expect(
    albums.map((album) => album.albumName),
    expectedAlbums.map((album) => 'Album ${padded(album)}'),
  );
  for (final album in albums) {
    final number = int.parse(album.albumName.split(' ').last);
    expect(
      album.albumSongs.map((song) => song.originalSongIndex),
      List.generate(10, (track) => number * 10 + track),
    );
  }
  expect(container.read(artistNamesProvider), List.generate(100, artist));

  final searchTimes = <String, double>{};
  for (final query in [
    '',
    'not-present',
    'Track 000123',
    'tRaCk ',
    'Artist 000003',
    'Album 000004',
  ]) {
    timer.reset();
    final results = container.read(searchProvider(query));
    searchTimes[query] = timer.elapsedMicroseconds / 1000;
    final lower = query.toLowerCase();
    final expected = <String>[];
    if (query.isNotEmpty) {
      expected.addAll(
        records
            .where((song) => song.trackName!.toLowerCase().contains(lower))
            .map((song) => 'track:${song.trackName}'),
      );
      expected.addAll(
        List.generate(100, artist)
            .where((name) => name.toLowerCase().contains(lower))
            .map((name) => 'artist:$name'),
      );
      expected.addAll(
        expectedAlbums
            .map((album) => 'Album ${padded(album)}')
            .where((name) => name.toLowerCase().contains(lower))
            .map((name) => 'album:$name'),
      );
    }
    final actual = results.map((result) {
      switch (result.searchResultType) {
        case SearchResultType.track:
          return 'track:${(result.result as MusicMetadata).trackName}';
        case SearchResultType.artist:
          expect(result.count, count ~/ 1000);
          return 'artist:${result.result}';
        case SearchResultType.album:
          expect(result.count, 10);
          return 'album:${(result.result as AlbumModel).albumName}';
        case SearchResultType.defaultSearch:
          fail('Unexpected default search result');
      }
    }).toList();
    expect(actual, expected, reason: 'Search "$query"');
  }
  return {
    'sortMs': sortMs,
    'groupingMs': groupingMs,
    'searchMs': searchTimes,
    'validTracks': count,
  };
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('large library worker', () async {
    final configPath = Platform.environment['CLASSIPOD_LARGE_LIBRARY_CONFIG'];
    expect(configPath, isNotNull, reason: 'Run scripts/large_library.py');
    final config = _readJson(configPath!);
    final metrics = config['mode'] == 'synthetic'
        ? await _synthetic(config['count'] as int)
        : await _importOrReopen(config);
    metrics['peakWorkerRssBytes'] = ProcessInfo.maxRss;
    File(config['result'] as String).writeAsStringSync(jsonEncode(metrics));
  });
}
