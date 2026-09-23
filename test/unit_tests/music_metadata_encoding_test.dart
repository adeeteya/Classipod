import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/repositories/library/library_metadata.dart';
import 'package:classipod/core/repositories/library/library_source.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const String expectedValue = 'Le curé de Ambon';
  const String malformedValue = '￾䰀攀 挀甀爀 搀攀 䄀洀戀漀渀';

  test('normalizeMetadataString keeps already valid strings unchanged', () {
    expect(normalizeMetadataString(expectedValue), expectedValue);
  });

  test('normalizeMetadataString repairs swapped UTF-16 metadata strings', () {
    expect(normalizeMetadataString(malformedValue), expectedValue);
  });

  test('libraryMetadata normalizes malformed metadata fields', () {
    final metadata = libraryMetadata(
      const LibrarySong(
        uri: 'file:///test.mp3',
        volume: 'test',
        size: 1,
        modified: 1,
      ),
      {
        'properties': {
          'TITLE': [malformedValue],
          'ALBUM': [malformedValue],
          'ARTIST': [malformedValue],
        },
      },
      index: 0,
    );

    expect(metadata.trackName, expectedValue);
    expect(metadata.albumName, expectedValue);
    expect(metadata.albumArtistName, expectedValue);
    expect(metadata.trackArtistNames, [expectedValue]);
  });
}
