import 'dart:io';

import 'package:classipod/core/constants/constants.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/repositories/library/library_metadata.dart';
import 'package:classipod/core/repositories/library/library_progress.dart';
import 'package:classipod/core/repositories/library/library_source.dart';
import 'package:classipod/features/music/playlist/models/playlist_model.dart';
import 'package:hive_ce/hive.dart';

typedef ReadTags = Future<Map<String, dynamic>> Function(
  String uri, {
  String? artworkDirectory,
});

class LibraryRepository {
  static const boxName = Constants.libraryBoxName;
  static const cacheVersion = 1;
  final String artworkDirectory;
  final Future<LibrarySnapshot> Function() discover;
  final ReadTags readTags;
  final Future<void> Function()? closeReader;
  final void Function()? selectSource;
  bool forceNextScan = false;
  Future<List<MusicMetadata>>? _pending;

  LibraryRepository({
    required this.artworkDirectory,
    required this.discover,
    required this.readTags,
    this.closeReader,
    this.selectSource,
  });

  void requestRescan() {
    forceNextScan = true;
    selectSource?.call();
  }

  Future<List<MusicMetadata>> load(void Function(LibraryProgress) report) {
    return _pending ??= _load(report).whenComplete(() => _pending = null);
  }

  /// Used by MediaStore discovery for the Android 2.0 cache reset.
  /// Other Hive boxes (playlists and preferences) are not library caches.
  static Future<void> deleteLegacyMetadata() async {
    if (await Hive.boxExists(Constants.legacyMetadataBoxName)) {
      await Hive.deleteBoxFromDisk(Constants.legacyMetadataBoxName);
    }
  }

  static Future<void> updateRating(MusicMetadata song) async {
    final box = await Hive.openBox<dynamic>(boxName);
    final snapshot = Map<dynamic, dynamic>.from(box.get('snapshot') as Map);
    final records = [
      for (final dynamic value in snapshot['records'] as List)
        Map<dynamic, dynamic>.from(value as Map),
    ];
    for (final record in records) {
      if ((record['music'] as MusicMetadata).identity == song.identity) {
        record['music'] = song;
      }
    }
    snapshot['records'] = records;
    await box.put('snapshot', snapshot);
    await box.flush();
  }

  Future<List<MusicMetadata>> _load(
    void Function(LibraryProgress) report,
  ) async {
    await Future<void>.value();
    report(const LibraryProgress());
    final snapshot = await discover();
    final box = await Hive.openBox<dynamic>(boxName);
    final saved = box.get('snapshot') as Map?;
    final oldRecords = [
      for (final dynamic value in saved?['records'] as List? ?? [])
        Map<String, dynamic>.from(value as Map),
    ];
    final oldByUri = {for (final row in oldRecords) row['uri']: row};
    final oldByPath = {
      for (final row in oldRecords)
        (row['music'] as MusicMetadata).filePath: row,
    };
    var nextIndex = 0;
    for (final row in oldRecords) {
      final song = row['music'] as MusicMetadata;
      if (song.originalSongIndex >= nextIndex) {
        nextIndex = song.originalSongIndex + 1;
      }
    }
    final force = forceNextScan;
    final records = <Map<String, dynamic>>[];
    final seen = <String>{};
    final songs = snapshot.songs.where((song) => seen.add(song.uri)).toList();
    var loaded = 0;
    var cached = 0;
    var failures = 0;
    var artworkCached = 0;
    int? artworkTotal;
    void emit(LibraryPhase phase) => report(
      LibraryProgress(
        phase: phase,
        songsTotal: songs.length,
        songsLoaded: loaded,
        songsCached: cached,
        artworkTotal: artworkTotal,
        artworkCached: artworkCached,
        failures: failures,
      ),
    );

    try {
      emit(LibraryPhase.metadata);
      for (final song in songs) {
        final old = oldByUri[song.uri] ?? oldByPath[song.path];
        final previous = old?['music'] as MusicMetadata?;
        final unchanged =
            !force &&
            saved?['version'] == cacheVersion &&
            old != null &&
            old['size'] == song.size &&
            old['modified'] == song.modified &&
            old['readSuccess'] == true;
        late Map<String, dynamic> row;
        if (unchanged) {
          row = {
            ...old,
            'uri': song.uri,
            'music': previous!.copyWith(
              contentUri: song.uri,
              sourceVolume: song.volume,
            ),
          };
          cached++;
        } else {
          final tags = await readTags(song.path ?? song.uri);
          final success = !tags.containsKey('error');
          if (!success) failures++;
          row = {
            'uri': song.uri,
            'size': song.size,
            'modified': song.modified,
            'readSuccess': success,
            'hasCover': tags['hasCover'] == true,
            'music': libraryMetadata(
              song,
              tags,
              index: previous?.originalSongIndex ?? nextIndex++,
              previous: previous,
            ),
          };
        }
        records.add(row);
        loaded++;
        emit(LibraryPhase.metadata);
      }
      artworkTotal = records.where((row) => row['hasCover'] == true).length;
      emit(LibraryPhase.artwork);
      final verifiedArtwork = <String>{};
      for (final row in records) {
        if (row['hasCover'] != true) continue;
        final song = row['music'] as MusicMetadata;
        final path = song.thumbnailPath;
        if (path != null &&
            (verifiedArtwork.contains(path) ||
                (await File(path).exists() && await File(path).length() > 0))) {
          verifiedArtwork.add(path);
          artworkCached++;
        } else {
          final result = await readTags(
            song.filePath ?? row['uri'] as String,
            artworkDirectory: artworkDirectory,
          );
          if (result['artworkPath'] != null) {
            row['music'] = song.copyWith(
              thumbnailPath: result['artworkPath'] as String,
            );
            verifiedArtwork.add(result['artworkPath'] as String);
            artworkCached++;
          } else {
            failures++;
          }
        }
        emit(LibraryPhase.artwork);
      }
      final active = records
          .map((row) => row['music'] as MusicMetadata)
          .toList();
      final activeIds = active.map((song) => song.identity).toSet();
      for (final old in oldRecords) {
        final song = old['music'] as MusicMetadata;
        if (!activeIds.contains(song.identity) &&
            !snapshot.volumes.contains(song.sourceVolume)) {
          records.add(old);
        }
      }
      emit(LibraryPhase.saving);
      await box.put('snapshot', {'version': cacheVersion, 'records': records});
      await box.flush();
      final allSongs = records.map((row) => row['music'] as MusicMetadata);
      final byId = {for (final song in allSongs) song.identity: song};
      final byPath = {for (final song in allSongs) song.filePath: song};
      final playlists = Hive.box<PlaylistModel>(Constants.playlistBoxName);
      for (final key in playlists.keys.toList()) {
        final playlist = playlists.get(key)!;
        await playlists.put(
          key,
          playlist.copyWith(
            songs: [
              for (final song in playlist.songs)
                byId[song.identity] ?? byPath[song.filePath] ?? song,
            ],
          ),
        );
      }
      await playlists.flush();
      forceNextScan = false;
      emit(LibraryPhase.complete);
      return active;
    } finally {
      await closeReader?.call();
    }
  }
}
