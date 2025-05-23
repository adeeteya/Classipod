import 'dart:collection';
import 'dart:io';

import 'package:audio_metadata_reader/audio_metadata_reader.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/providers/device_directory_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final metadataReaderRepositoryProvider =
    Provider.autoDispose<MetadataReaderRepository>((ref) {
      return MetadataReaderRepository(
        ref.read(deviceDirectoryProvider).requireValue.cacheDirectory.path,
      );
    });

class MetadataReaderRepository {
  final String cacheParentDirectory;

  MetadataReaderRepository(this.cacheParentDirectory);

  bool isSupportedAudioFormat(String path) {
    if (path.endsWith('.mp3') ||
        path.endsWith('.ogg') ||
        path.endsWith('.opus') ||
        path.endsWith('.wav') ||
        path.endsWith('.flac') ||
        path.endsWith('.m4a') ||
        path.endsWith('.aac')) {
      return true;
    } else {
      return false;
    }
  }

  String getThumbnailPath({
    required String? albumName,
    required String? artistName,
    required String filePath,
  }) {
    String albumArtFileName;
    if (albumName == null || artistName == null) {
      albumArtFileName = filePath;
    } else {
      albumArtFileName = '${albumName}by$artistName';
    }
    albumArtFileName = albumArtFileName
        .replaceAll(RegExp(r'[\\/:*?"<>|]'), '_')
        .replaceAll('/', '-')
        .replaceAll(' ', '');
    return '$cacheParentDirectory/$albumArtFileName.jpg';
  }

  UnmodifiableListView<MusicMetadata> extractMetadataFromDirectory(
    String musicFolderPath,
  ) {
    final Directory storageDir = Directory(musicFolderPath);
    final List<FileSystemEntity> files = storageDir.listSync(
      recursive: true,
      followLinks: false,
    );
    final List<String> filePaths = files.map((e) => e.path).toList();

    final List<MusicMetadata> metadataList = [];

    AudioMetadata audioMetadata;

    for (final String path in filePaths) {
      try {
        if (isSupportedAudioFormat(path)) {
          audioMetadata = readMetadata(File(path), getImage: true);

          final String thumbnailPath = getThumbnailPath(
            albumName: audioMetadata.album,
            artistName: audioMetadata.artist,
            filePath: path,
          );

          if (audioMetadata.pictures.isNotEmpty) {
            File(
              thumbnailPath,
            ).writeAsBytesSync(audioMetadata.pictures[0].bytes);
          }

          metadataList.add(
            MusicMetadata.fromAudioMetadata(
              audioMetadata,
              thumbnailPath,
              metadataList.length,
            ),
          );
        }
      } catch (e) {
        debugPrint("Metadata Parsing Error: $e");
      }
    }

    return UnmodifiableListView(metadataList);
  }

  UnmodifiableListView<MusicMetadata> extractMetadataFromFiles(
    List<String> filePaths,
  ) {
    final List<MusicMetadata> metadataList = [];

    AudioMetadata audioMetadata;

    for (final String path in filePaths) {
      try {
        if (isSupportedAudioFormat(path)) {
          audioMetadata = readMetadata(File(path), getImage: true);

          final String thumbnailPath = getThumbnailPath(
            albumName: audioMetadata.album,
            artistName: audioMetadata.artist,
            filePath: path,
          );

          if (audioMetadata.pictures.isNotEmpty) {
            File(
              thumbnailPath,
            ).writeAsBytesSync(audioMetadata.pictures[0].bytes);
          }

          metadataList.add(
            MusicMetadata.fromAudioMetadata(
              audioMetadata,
              thumbnailPath,
              metadataList.length,
            ),
          );
        }
      } catch (e) {
        debugPrint("Metadata Parsing Error: $e");
      }
    }

    return UnmodifiableListView(metadataList);
  }
}
