import 'dart:io';

import 'package:audio_metadata_reader/audio_metadata_reader.dart';

class FileMetadataReader {
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

  const FileMetadataReader();

  bool isSupportedAudioFormat(String path) {
    final String lowercasePath = path.toLowerCase();
    return supportedAudioFileExtensions.any(lowercasePath.endsWith);
  }

  AudioMetadata readAudioMetadata(String path) {
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
}
