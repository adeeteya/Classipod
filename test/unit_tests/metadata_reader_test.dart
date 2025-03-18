import 'dart:io';

import 'package:classipod/core/models/device_directory.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/providers/device_directory_provider.dart';
import 'package:classipod/core/repositories/metadata_reader_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final ProviderContainer providerContainer = ProviderContainer(
    overrides: [
      deviceDirectoryProvider.overrideWith(
        (_) => DeviceDirectory(
          cacheDirectory: Directory(
            "${Directory.current.path}/test/test_files/temp",
          ),
          documentsDirectory: Directory(
            "${Directory.current.path}/test/test_files/",
          ),
        ),
      ),
    ],
  );

  test('Recognizing that Mp3 File is Supported', () {
    final metadataReaderRepository = providerContainer.read(
      metadataReaderRepositoryProvider,
    );
    expect(
      metadataReaderRepository.isSupportedAudioFormat(
        "${Directory.current.path}/test/test_files/mp3/Faded.mp3",
      ),
      true,
    );
  });

  test('Recognizing that Flac File is Supported', () {
    final metadataReaderRepository = providerContainer.read(
      metadataReaderRepositoryProvider,
    );
    expect(
      metadataReaderRepository.isSupportedAudioFormat(
        "${Directory.current.path}/test/test_files/flac/Faded.flac",
      ),
      true,
    );
  });

  test('Recognizing that Ogg File is Supported', () {
    final metadataReaderRepository = providerContainer.read(
      metadataReaderRepositoryProvider,
    );
    expect(
      metadataReaderRepository.isSupportedAudioFormat(
        "${Directory.current.path}/test/test_files/ogg/Faded.ogg",
      ),
      true,
    );
  });

  test('Recognizing that Opus File is Supported', () {
    final metadataReaderRepository = providerContainer.read(
      metadataReaderRepositoryProvider,
    );
    expect(
      metadataReaderRepository.isSupportedAudioFormat(
        "${Directory.current.path}/test/test_files/opus/Faded.opus",
      ),
      true,
    );
  });

  test('Reading the mp3 Metadata correctly', () {
    final metadataReaderRepository = providerContainer.read(
      metadataReaderRepositoryProvider,
    );
    final metadataList = metadataReaderRepository.extractAudioFilesMetadata(
      "${Directory.current.path}/test/test_files/mp3/",
    );
    expect(
      metadataList.first,
      MusicMetadata(
        trackName: "Faded",
        trackArtistNames: ["Alan Walker"],
        albumName: "Faded",
        albumArtistName: "Alan Walker",
        trackNumber: 1,
        year: 2015,
        genres: ["Electro House"],
        mimeType: "image/jpeg",
        trackDuration: 213000,
        bitrate: 128000,
        filePath: "${Directory.current.path}/test/test_files/mp3/Faded.mp3",
        thumbnailPath:
            "${Directory.current.path}/test/test_files/temp/FadedbyAlanWalker.jpg",
      ),
    );
  });

  test('Reading the flac Metadata correctly', () {
    final metadataReaderRepository = providerContainer.read(
      metadataReaderRepositoryProvider,
    );
    final metadataList = metadataReaderRepository.extractAudioFilesMetadata(
      "${Directory.current.path}/test/test_files/flac/",
    );
    expect(
      metadataList.first,
      MusicMetadata(
        trackName: "Faded",
        trackArtistNames: ["Alan Walker"],
        albumName: "Faded",
        albumArtistName: "Alan Walker",
        trackNumber: 1,
        year: 2015,
        genres: ["Electro House"],
        mimeType: "image/jpeg",
        trackDuration: 212626,
        bitrate: 705600,
        filePath: "${Directory.current.path}/test/test_files/flac/Faded.flac",
        thumbnailPath:
            "${Directory.current.path}/test/test_files/temp/FadedbyAlanWalker.jpg",
      ),
    );
  });

  test('Reading the ogg Metadata correctly', () {
    final metadataReaderRepository = providerContainer.read(
      metadataReaderRepositoryProvider,
    );
    final metadataList = metadataReaderRepository.extractAudioFilesMetadata(
      "${Directory.current.path}/test/test_files/ogg/",
    );
    expect(
      metadataList.first,
      MusicMetadata(
        trackName: "Faded",
        trackArtistNames: ["Alan Walker"],
        albumName: "Faded",
        albumArtistName: "Alan Walker",
        trackNumber: 1,
        year: 2015,
        genres: ["Electro House"],
        mimeType: "image/jpeg",
        trackDuration: 212000,
        bitrate: 128000,
        filePath: "${Directory.current.path}/test/test_files/ogg/Faded.ogg",
        thumbnailPath:
            "${Directory.current.path}/test/test_files/temp/FadedbyAlanWalker.jpg",
      ),
    );
  });

  test('Reading the opus Metadata correctly', () {
    final metadataReaderRepository = providerContainer.read(
      metadataReaderRepositoryProvider,
    );
    final metadataList = metadataReaderRepository.extractAudioFilesMetadata(
      "${Directory.current.path}/test/test_files/opus/",
    );
    expect(
      metadataList.first,
      MusicMetadata(
        trackName: "Faded",
        trackArtistNames: ["Alan Walker"],
        albumName: "Faded",
        albumArtistName: "Alan Walker",
        trackNumber: 1,
        year: 2015,
        genres: ["Electro House"],
        mimeType: "image/jpeg",
        trackDuration: 212000,
        bitrate: 187,
        filePath: "${Directory.current.path}/test/test_files/opus/Faded.opus",
        thumbnailPath:
            "${Directory.current.path}/test/test_files/temp/FadedbyAlanWalker.jpg",
      ),
    );
  });
}
