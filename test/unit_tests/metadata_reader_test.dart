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
          cacheDirectory: Directory("${Directory.current.path}/test/cache"),
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

  test('Recognizing that M4a File is Supported', () {
    final metadataReaderRepository = providerContainer.read(
      metadataReaderRepositoryProvider,
    );
    expect(
      metadataReaderRepository.isSupportedAudioFormat(
        "${Directory.current.path}/test/test_files/m4a/Faded.m4a",
      ),
      true,
    );
  });

  test('Reading the mp3 Metadata correctly', () {
    final metadataReaderRepository = providerContainer.read(
      metadataReaderRepositoryProvider,
    );
    final metadataList = metadataReaderRepository.extractMetadataFromDirectory(
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
        trackDuration: 212697,
        bitrate: 128000,
        filePath: "${Directory.current.path}/test/test_files/mp3/Faded.mp3",
        thumbnailPath:
            "${Directory.current.path}/test/cache/FadedbyAlanWalker.jpg",
      ),
    );
  });

  test('Reading the flac Metadata correctly', () {
    final metadataReaderRepository = providerContainer.read(
      metadataReaderRepositoryProvider,
    );
    final metadataList = metadataReaderRepository.extractMetadataFromDirectory(
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
            "${Directory.current.path}/test/cache/FadedbyAlanWalker.jpg",
      ),
    );
  });

  test('Reading the ogg Metadata correctly', () {
    final metadataReaderRepository = providerContainer.read(
      metadataReaderRepositoryProvider,
    );
    final metadataList = metadataReaderRepository.extractMetadataFromDirectory(
      "${Directory.current.path}/test/test_files/ogg/",
    );
    expect(
      metadataList.first,
      MusicMetadata(
        trackName: "Firefly",
        trackArtistNames: ["Jim Yosef"],
        albumName: "Firefly",
        albumArtistName: "Jim Yosef",
        trackNumber: 17,
        year: 2015,
        genres: ["Dance/Electronic"],
        discNumber: 1,
        mimeType: "image/jpeg",
        trackDuration: 256000,
        bitrate: 160000,
        filePath: "${Directory.current.path}/test/test_files/ogg/Firefly.ogg",
        thumbnailPath:
            "${Directory.current.path}/test/cache/FireflybyJimYosef.jpg",
      ),
    );
  });

  test('Reading the opus Metadata correctly', () {
    final metadataReaderRepository = providerContainer.read(
      metadataReaderRepositoryProvider,
    );
    final metadataList = metadataReaderRepository.extractMetadataFromDirectory(
      "${Directory.current.path}/test/test_files/opus/",
    );
    expect(
      metadataList.first,
      MusicMetadata(
        trackName: "Spectre",
        trackArtistNames: ["Alan Walker"],
        albumName: "Spectre",
        albumArtistName: "Alan Walker",
        trackNumber: 1,
        albumLength: 1,
        discNumber: 1,
        year: 2015,
        genres: ["Dance/Electronic"],
        mimeType: "image/jpeg",
        trackDuration: 226000,
        bitrate: 187,
        filePath: "${Directory.current.path}/test/test_files/opus/Spectre.opus",
        thumbnailPath:
            "${Directory.current.path}/test/cache/SpectrebyAlanWalker.jpg",
      ),
    );
  });

  test('Reading the m4a Metadata correctly', () {
    final metadataReaderRepository = providerContainer.read(
      metadataReaderRepositoryProvider,
    );
    final metadataList = metadataReaderRepository.extractMetadataFromDirectory(
      "${Directory.current.path}/test/test_files/m4a/",
    );
    expect(
      metadataList.first,
      MusicMetadata(
        trackName: "On & On",
        trackArtistNames: ["Cartoon & Daniel Levi"],
        albumName: "On & On",
        albumArtistName: "Cartoon & Daniel Levi",
        trackNumber: 2,
        albumLength: 2,
        discNumber: 1,
        mimeType: "image/jpeg",
        year: 2019,
        genres: ["Dance/Electronic"],
        trackDuration: 208014,
        filePath: "${Directory.current.path}/test/test_files/m4a/On&On.m4a",
        thumbnailPath:
            "${Directory.current.path}/test/cache/On&OnbyCartoon&DanielLevi.jpg",
      ),
    );
  });
}
