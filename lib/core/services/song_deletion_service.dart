import 'dart:io';

import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/repositories/library/library_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:on_audio_query/on_audio_query.dart';

Future<bool> deleteSongFromDevice(
  MusicMetadata song, {
  Future<bool> Function(String path)? rescan,
  Future<void> Function(MusicMetadata song)? removeFromIndex,
}) async {
  final path = song.filePath;
  var removedFile = false;
  if (path != null && path.isNotEmpty) {
    final file = File(path);
    if (await file.exists()) {
      await file.delete();
      removedFile = true;
      try {
        await (rescan?.call(path) ?? OnAudioQuery().scanMedia(path));
      } catch (error) {
        debugPrint('Could not rescan deleted media: ${error.runtimeType}');
      }
    }
  }
  await (removeFromIndex?.call(song) ?? LibraryRepository.deleteSong(song));
  return removedFile;
}
