import 'package:classipod/core/utils/directory_exclusion.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('isDirectoryExcluded', () {
    const String directoryPath = '/storage/emulated/0/Music/Albums';

    test('returns false when directoryPath is null', () {
      expect(
        isDirectoryExcluded(
          directoryPath: null,
          excludedDirectoryPaths: const {},
          nameFilters: const [],
        ),
        isFalse,
      );
    });

    test('returns false with no exclusions', () {
      expect(
        isDirectoryExcluded(
          directoryPath: directoryPath,
          excludedDirectoryPaths: const {},
          nameFilters: const [],
        ),
        isFalse,
      );
    });

    test('returns true when path is toggled off', () {
      expect(
        isDirectoryExcluded(
          directoryPath: directoryPath,
          excludedDirectoryPaths: const {directoryPath},
          nameFilters: const [],
        ),
        isTrue,
      );
    });

    test('returns true when path matches a name filter', () {
      expect(
        isDirectoryExcluded(
          directoryPath: directoryPath,
          excludedDirectoryPaths: const {},
          nameFilters: const ['albums'],
        ),
        isTrue,
      );
    });

    test('matches name filters case-insensitively', () {
      expect(
        isDirectoryExcluded(
          directoryPath: directoryPath,
          excludedDirectoryPaths: const {},
          nameFilters: const ['ALBUMS'],
        ),
        isTrue,
      );
    });

    test('returns false when filter does not match', () {
      expect(
        isDirectoryExcluded(
          directoryPath: directoryPath,
          excludedDirectoryPaths: const {},
          nameFilters: const ['ringtones'],
        ),
        isFalse,
      );
    });
  });
}
