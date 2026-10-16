import 'dart:io';

import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/services/song_deletion_service.dart';
import 'package:flutter_test/flutter_test.dart';

MusicMetadata song(int index, {String? filePath}) => MusicMetadata(
  originalSongIndex: index,
  songId: 'song-$index',
  contentUri: 'content://media/external/audio/media/$index',
  trackName: 'Song $index',
  filePath: filePath,
);

void main() {
  group('deleteSongFromDevice', () {
    test('deletes the file and rescans it', () async {
      final directory = await Directory.systemTemp.createTemp('classipod');
      addTearDown(() => directory.delete(recursive: true));
      final file = File('${directory.path}/episode.mp3');
      await file.writeAsString('audio');

      final rescanned = <String>[];
      final indexed = <MusicMetadata>[];
      final deleted = await deleteSongFromDevice(
        song(0, filePath: file.path),
        rescan: (path) async {
          rescanned.add(path);
          return true;
        },
        removeFromIndex: (entry) async => indexed.add(entry),
      );

      expect(deleted, isTrue);
      expect(await file.exists(), isFalse);
      expect(rescanned, [file.path]);
      expect(indexed.single.identity, 'song-0');
    });

    test('reports a missing file without touching the device', () async {
      final directory = await Directory.systemTemp.createTemp('classipod');
      addTearDown(() => directory.delete(recursive: true));

      final deleted = await deleteSongFromDevice(
        song(0, filePath: '${directory.path}/gone.mp3'),
        rescan: (_) async => true,
        removeFromIndex: (_) async {},
      );

      expect(deleted, isFalse);
    });

    test('a remote only song has no file to remove', () async {
      final deleted = await deleteSongFromDevice(
        MusicMetadata(songId: 'remote'),
        rescan: (_) async => true,
        removeFromIndex: (_) async {},
      );

      expect(deleted, isFalse);
    });
  });
}
