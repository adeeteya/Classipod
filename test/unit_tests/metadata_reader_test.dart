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
          documentsDirectory: Directory(
            "${Directory.current.path}/test/test_files",
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

  test('Recognizing that wav File is Supported', () {
    final metadataReaderRepository = providerContainer.read(
      metadataReaderRepositoryProvider,
    );
    expect(
      metadataReaderRepository.isSupportedAudioFormat(
        "${Directory.current.path}/test/test_files/wav/Invincible.wav",
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
        trackDuration: 212688,
        bitrate: 128000,
        filePath: "${Directory.current.path}/test/test_files/mp3/Faded.mp3",
        thumbnailPath:
            "${Directory.current.path}/test/test_files/ClassiPod/thumbnails/FadedbyAlanWalker.jpg",
        lyrics:
            "[00:11.12] You were the shadow to my light\n[00:14.90] Did you feel us?\n[00:17.88] Another start\n[00:19.64] You fade away\n[00:21.72] Afraid our aim is out of sight\n[00:24.79] Wanna see us\n[00:28.38] Alight\n[00:30.77] \n[00:31.90] Where are you now?\n[00:36.40] Where are you now?\n[00:41.82] Where are you now?\n[00:44.21] Was it all in my fantasy?\n[00:47.11] Where are you now?\n[00:49.67] Were you only imaginary?\n[00:53.70] Where are you now?\n[00:56.51] \n[00:57.60] Atlantis\n[00:59.80] Under the sea\n[01:01.70] Under the sea\n[01:04.42] Where are you now?\n[01:07.40] Another dream\n[01:10.34] The monster's running wild inside of me\n[01:13.90] \n[01:14.45] I'm faded\n[01:19.75] I'm faded\n[01:23.69] So lost\n[01:25.60] I'm faded\n[01:30.37] I'm faded\n[01:34.37] So lost\n[01:35.77] I'm faded\n[01:37.11] \n[01:37.73] These shallow waters never met what I needed\n[01:44.44] I'm letting go\n[01:46.38] A deeper dive\n[01:48.40] Eternal silence of the sea\n[01:51.72] I'm breathing\n[01:55.10] Alive\n[01:57.10] \n[01:57.68] Where are you now?\n[02:03.80] Where are you now?\n[02:07.74] \n[02:08.38] Under the bright\n[02:09.73] But faded lights\n[02:11.13] You set my heart on fire\n[02:13.67] Where are you now?\n[02:16.51] Where are you now?\n[02:18.96] \n[02:31.80] Where are you now?\n[02:34.37] Atlantis\n[02:36.51] Under the sea\n[02:39.16] Under the sea\n[02:41.70] Where are you now?\n[02:44.37] Another dream\n[02:47.76] The monster's running wild inside of me\n[02:51.57] I'm faded\n[02:56.98] I'm faded\n[03:00.96] So lost\n[03:02.39] I'm faded\n[03:07.75] I'm faded\n[03:11.68] So lost\n[03:13.10] I'm faded",
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
        lyrics:
            "[00:11.12] You were the shadow to my light\n[00:14.90] Did you feel us?\n[00:17.88] Another start\n[00:19.64] You fade away\n[00:21.72] Afraid our aim is out of sight\n[00:24.79] Wanna see us\n[00:28.38] Alight\n[00:30.77] \n[00:31.90] Where are you now?\n[00:36.40] Where are you now?\n[00:41.82] Where are you now?\n[00:44.21] Was it all in my fantasy?\n[00:47.11] Where are you now?\n[00:49.67] Were you only imaginary?\n[00:53.70] Where are you now?\n[00:56.51] \n[00:57.60] Atlantis\n[00:59.80] Under the sea\n[01:01.70] Under the sea\n[01:04.42] Where are you now?\n[01:07.40] Another dream\n[01:10.34] The monster's running wild inside of me\n[01:13.90] \n[01:14.45] I'm faded\n[01:19.75] I'm faded\n[01:23.69] So lost\n[01:25.60] I'm faded\n[01:30.37] I'm faded\n[01:34.37] So lost\n[01:35.77] I'm faded\n[01:37.11] \n[01:37.73] These shallow waters never met what I needed\n[01:44.44] I'm letting go\n[01:46.38] A deeper dive\n[01:48.40] Eternal silence of the sea\n[01:51.72] I'm breathing\n[01:55.10] Alive\n[01:57.10] \n[01:57.68] Where are you now?\n[02:03.80] Where are you now?\n[02:07.74] \n[02:08.38] Under the bright\n[02:09.73] But faded lights\n[02:11.13] You set my heart on fire\n[02:13.67] Where are you now?\n[02:16.51] Where are you now?\n[02:18.96] \n[02:31.80] Where are you now?\n[02:34.37] Atlantis\n[02:36.51] Under the sea\n[02:39.16] Under the sea\n[02:41.70] Where are you now?\n[02:44.37] Another dream\n[02:47.76] The monster's running wild inside of me\n[02:51.57] I'm faded\n[02:56.98] I'm faded\n[03:00.96] So lost\n[03:02.39] I'm faded\n[03:07.75] I'm faded\n[03:11.68] So lost\n[03:13.10] I'm faded",
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
            "${Directory.current.path}/test/test_files/ClassiPod/thumbnails/FireflybyJimYosef.jpg",
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
            "${Directory.current.path}/test/test_files/ClassiPod/thumbnails/SpectrebyAlanWalker.jpg",
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
            "${Directory.current.path}/test/test_files/ClassiPod/thumbnails/On&OnbyCartoon&DanielLevi.jpg",
      ),
    );
  });

  test('Reading the wav Metadata correctly', () {
    final metadataReaderRepository = providerContainer.read(
      metadataReaderRepositoryProvider,
    );
    final metadataList = metadataReaderRepository.extractMetadataFromDirectory(
      "${Directory.current.path}/test/test_files/wav/",
    );
    expect(
      metadataList.first,
      MusicMetadata(
        trackName: "Invincible",
        trackArtistNames: ["Deaf Kev"],
        albumName: "Invincible",
        albumArtistName: "Deaf Kev",
        trackNumber: 1,
        year: 2015,
        genres: ["Glitch Hop"],
        trackDuration: 273084,
        bitrate: 176400,
        filePath:
            "${Directory.current.path}/test/test_files/wav/Invincible.wav",
      ),
    );
  });
}
