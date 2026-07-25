import 'dart:collection';
import 'dart:io';

import 'package:audio_metadata_reader/audio_metadata_reader.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/providers/device_directory_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final metadataReaderRepositoryProvider =
    Provider.autoDispose<MetadataReaderRepository>((ref) {
      final documentsDirectory = ref
          .read(deviceDirectoryProvider)
          .requireValue
          .documentsDirectory;
      final thumbnailsDirectoryPath =
          '${documentsDirectory.path}/ClassiPod/thumbnails';
      Directory(thumbnailsDirectoryPath).createSync(recursive: true);
      return MetadataReaderRepository(thumbnailsDirectoryPath);
    });

class MetadataReaderRepository {
  /// Formats supported by the metadata reader and at least one playback backend.
  ///
  /// Playback availability varies by platform and by the codec stored inside a
  /// container.
  static const Set<String> supportedAudioFileExtensions = {
    '.aac',
    '.aif',
    '.aifc',
    '.aiff',
    '.ape',
    '.flac',
    '.m4a',
    '.mov',
    '.mp3',
    '.mp4',
    '.ogg',
    '.opus',
    '.wav',
  };

  final String thumbnailsDirectoryPath;

  MetadataReaderRepository(this.thumbnailsDirectoryPath);

  bool isSupportedAudioFormat(String path) {
    final String lowercasePath = path.toLowerCase();
    return supportedAudioFileExtensions.any(lowercasePath.endsWith);
  }

  AudioMetadata _readAudioMetadata(String path) {
    final File file = File(path);

    try {
      return readMetadata(file, getImage: true);
    } on NoMetadataParserException {
      if (!path.toLowerCase().endsWith('.aac') || !_isAdtsAac(file)) {
        rethrow;
      }

      final String fileName = path.replaceAll(r'\', '/').split('/').last;
      return AudioMetadata(
        file: file,
        title: fileName.substring(0, fileName.length - '.aac'.length),
      );
    }
  }

  bool _isAdtsAac(File file) {
    final RandomAccessFile reader = file.openSync();

    try {
      final List<int> header = reader.readSync(7);
      if (header.length != 7 ||
          header[0] != 0xFF ||
          (header[1] & 0xF6) != 0xF0) {
        return false;
      }

      final int headerLength = (header[1] & 0x01) == 0 ? 9 : 7;
      final int frameLength =
          ((header[3] & 0x03) << 11) |
          (header[4] << 3) |
          ((header[5] & 0xE0) >> 5);
      return frameLength >= headerLength && frameLength <= reader.lengthSync();
    } finally {
      reader.closeSync();
    }
  }

  String getThumbnailPath({
    required String? albumName,
    required String? artistName,
    required String filePath,
  }) {
    final String? normalizedAlbumName = normalizeMetadataString(albumName);
    final String? normalizedArtistName = normalizeMetadataString(artistName);
    String albumArtFileName;
    if (normalizedAlbumName == null || normalizedArtistName == null) {
      albumArtFileName = filePath;
    } else {
      albumArtFileName = '${normalizedAlbumName}by$normalizedArtistName';
    }
    albumArtFileName = albumArtFileName
        .replaceAll(RegExp(r'[\\/:*?"<>|]'), '_')
        .replaceAll('/', '-')
        .replaceAll(' ', '');
    return '$thumbnailsDirectoryPath/$albumArtFileName.jpg';
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
          audioMetadata = _readAudioMetadata(path);

          String? thumbnailPath;
          if (audioMetadata.pictures.isNotEmpty) {
            thumbnailPath = getThumbnailPath(
              albumName: audioMetadata.album,
              artistName: audioMetadata.artist,
              filePath: path,
            );
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
          audioMetadata = _readAudioMetadata(path);

          String? thumbnailPath;
          if (audioMetadata.pictures.isNotEmpty) {
            thumbnailPath = getThumbnailPath(
              albumName: audioMetadata.album,
              artistName: audioMetadata.artist,
              filePath: path,
            );
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
