import 'package:classipod/features/settings/models/music_folder_node.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('music_folder_node', () {
    test('Building the tree from an empty library yields nothing', () {
      expect(MusicFolderNode.buildTree(const []), isEmpty);
    });

    test('Folders shared by every track are not offered as separate roots', () {
      final tree = MusicFolderNode.buildTree(const [
        '/storage/emulated/0/Music/Beatles',
        '/storage/emulated/0/Music/Beatles',
        '/storage/emulated/0/Music/Queen',
      ]);

      expect(tree.map((node) => node.path), [
        '/storage/emulated/0/Music',
        '/storage/emulated/0/Music/Beatles',
        '/storage/emulated/0/Music/Queen',
      ]);
      expect(tree.first.depth, 0);
      expect(tree.last.depth, 1);
    });

    test('Every folder counts the tracks stored anywhere below it', () {
      final tree = MusicFolderNode.buildTree(const [
        '/music/rock/live',
        '/music/rock/studio',
        '/music/jazz',
      ]);
      final counts = {
        for (final node in tree) node.path: node.trackCount,
      };

      expect(counts['/music'], 3);
      expect(counts['/music/rock'], 2);
      expect(counts['/music/jazz'], 1);
    });

    test('Separate storage volumes stay reachable under a shared root', () {
      final tree = MusicFolderNode.buildTree(const [
        '/storage/emulated/0/Music',
        '/storage/ABCD-1234/Music',
      ]);

      expect(
        tree.map((node) => node.path),
        containsAll(<String>[
          '/storage/emulated/0/Music',
          '/storage/ABCD-1234/Music',
        ]),
      );
      expect(tree.first.path, '/storage');
      expect(tree.first.trackCount, 2);
    });

    test('A root only matches paths below it, not sibling prefixes', () {
      expect(
        MusicFolderNode.isUnder(
          filePath: '/music/rock/live',
          rootPath: '/music/rock',
        ),
        isTrue,
      );
      expect(
        MusicFolderNode.isUnder(filePath: '/music/rock', rootPath: '/music'),
        isTrue,
      );
      expect(
        MusicFolderNode.isUnder(
          filePath: '/music/rocket',
          rootPath: '/music/rock',
        ),
        isFalse,
      );
    });
  });
}
