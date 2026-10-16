import 'package:classipod/core/utils/playlist_name.dart';
import 'package:classipod/features/music/playlist/models/playlist_name_result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('capitalizeFirstLetter', () {
    test('uppercases the first letter the wheel types in lowercase', () {
      expect(capitalizeFirstLetter('road trip'), 'Road trip');
    });

    test('leaves an already capitalized name alone', () {
      expect(capitalizeFirstLetter('Road Trip'), 'Road Trip');
    });

    test('drops surrounding whitespace', () {
      expect(capitalizeFirstLetter('  road  '), 'Road');
    });

    test('returns empty for an empty or blank name', () {
      expect(capitalizeFirstLetter(''), '');
      expect(capitalizeFirstLetter('   '), '');
    });

    test('keeps single character names', () {
      expect(capitalizeFirstLetter('a'), 'A');
    });
  });

  group('PlaylistNameResult', () {
    test('a submitted result carries the name', () {
      const result = PlaylistNameResult.submitted('Road Trip');
      expect(result.isSubmitted, isTrue);
      expect(result.name, 'Road Trip');
    });

    test('a cancelled result never looks like an empty name', () {
      const result = PlaylistNameResult.cancelled();
      expect(result.isSubmitted, isFalse);
      expect(result.name, isNull);
    });
  });
}
