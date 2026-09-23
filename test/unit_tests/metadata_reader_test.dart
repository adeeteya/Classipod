import 'dart:io';

import 'package:classipod/core/repositories/library/audio_file_formats.dart';
import 'package:classipod/core/repositories/library/library_metadata.dart';
import 'package:classipod/core/repositories/library/library_source.dart';
import 'package:classipod/core/repositories/library/metadata_worker.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('audio discovery recognizes case-insensitive candidate extensions', () {
    for (final extension in supportedAudioFileExtensions) {
      expect(isSupportedAudioFormat('Song${extension.toUpperCase()}'), isTrue);
    }
    expect(isSupportedAudioFormat('cover.jpg'), isFalse);
    expect(isSupportedAudioFormat('song.mp3.txt'), isFalse);
  });

  final fixtures = {
    'mp3/Faded.mp3': ('Faded', 'Alan Walker', 212000),
    'flac/Faded.flac': ('Faded', 'Alan Walker', 212000),
    'ogg/Firefly.ogg': ('Firefly', 'Jim Yosef', 256000),
    'opus/Spectre.opus': ('Spectre', 'Alan Walker', 226000),
    'm4a/On&On.m4a': ('On & On', 'Cartoon', 208000),
    'wav/Invincible.wav': ('Invincible', 'Deaf Kev', 273000),
  };
  for (final entry in fixtures.entries) {
    test(
      'TagLib worker reads ${entry.key} through the shared mapper',
      () async {
        final worker = await MetadataWorker.start();
        addTearDown(worker.close);
        final file = File('test/test_files/${entry.key}').absolute;
        final artwork = await Directory.systemTemp.createTemp('taglib-art-');
        addTearDown(() => artwork.delete(recursive: true));
        final tags = await worker.read(
          file.uri.toString(),
          artworkDirectory: artwork.path,
        );
        expect(tags['error'], isNull);
        final metadata = libraryMetadata(
          LibrarySong(
            uri: file.uri.toString(),
            volume: file.parent.uri.toString(),
            path: file.path,
            size: await file.length(),
            modified: 0,
          ),
          tags,
          index: 0,
        );
        expect(metadata.trackName, entry.value.$1);
        expect(metadata.trackArtistNames!.join(';'), contains(entry.value.$2));
        expect(metadata.albumArtistNames, isNotEmpty);
        expect(metadata.trackDuration, closeTo(entry.value.$3, 1500));
        if (entry.key.startsWith('mp3/') || entry.key.startsWith('flac/')) {
          expect(metadata.lyrics, contains('You were the shadow to my light'));
          expect(tags['hasCover'], isTrue);
          final cover = File(tags['artworkPath'] as String);
          expect(
            cover.uri.pathSegments.last,
            sha256.convert(await cover.readAsBytes()).toString(),
          );
          expect(metadata.thumbnailPath, cover.path);
          final blocked = File('${artwork.path}/blocked');
          await blocked.writeAsString('not a directory');
          final retry = await worker.read(
            file.uri.toString(),
            artworkDirectory: blocked.path,
          );
          expect(retry['error'], isNull);
          expect(retry['properties'], tags['properties']);
          expect(retry['artworkError'], isNotNull);
          expect(retry['artworkPath'], isNull);
        }
      },
    );
  }

  test('TagLib reads encoded file URIs and reports unreadable files', () async {
    final directory = await Directory.systemTemp.createTemp('taglib-uri-');
    addTearDown(() => directory.delete(recursive: true));
    final worker = await MetadataWorker.start();
    addTearDown(worker.close);
    final file = await File('test/test_files/mp3/Faded.mp3')
        .copy('${directory.path}/Café #1 %.mp3');
    expect((await worker.read(file.uri.toString()))['error'], isNull);
    await file.writeAsBytes([0, 1, 2]);
    final malformed = await worker.read(file.uri.toString());
    expect(malformed['error'] != null || malformed['duration'] == 0, isTrue);
    await file.delete();
    expect((await worker.read(file.uri.toString()))['error'], isNotNull);
  });
}
