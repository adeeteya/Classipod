import 'package:flutter/foundation.dart';

/// A folder that holds music, either directly or somewhere below it.
///
/// The tree is derived from the folders the scanned files actually live in, so
/// it needs no directory listing permission and only ever offers folders that
/// contain something worth scanning.
@immutable
class MusicFolderNode {
  /// Absolute path of the folder.
  final String path;

  /// Name shown in the list, without the ancestors already on screen.
  final String label;

  /// How far below the shallowest offered folder this one sits.
  final int depth;

  /// Number of tracks anywhere below this folder.
  final int trackCount;

  const MusicFolderNode({
    required this.path,
    required this.label,
    required this.depth,
    required this.trackCount,
  });

  /// Builds the selectable folder list out of the parent folder of every
  /// track, shallowest first, each folder carrying the number of tracks below
  /// it.
  static List<MusicFolderNode> buildTree(Iterable<String> parentPaths) {
    final Map<String, int> trackCounts = {};
    List<String>? commonSegments;
    for (final String parentPath in parentPaths) {
      final List<String> segments = _segmentsOf(parentPath);
      if (segments.isEmpty) {
        continue;
      }
      for (int index = 0; index < segments.length; index++) {
        final String ancestor = "/${segments.take(index + 1).join('/')}";
        trackCounts[ancestor] = (trackCounts[ancestor] ?? 0) + 1;
      }
      commonSegments = commonSegments == null
          ? segments
          : _commonPrefix(commonSegments, segments);
    }
    if (trackCounts.isEmpty || commonSegments == null) {
      return const [];
    }

    // Everything above the deepest folder that still contains every track is
    // noise (/storage/emulated/0 and friends), so it is not offered.
    final int rootDepth = commonSegments.isEmpty ? 1 : commonSegments.length;
    final String rootPath = commonSegments.isEmpty
        ? "/"
        : "/${commonSegments.join('/')}";

    final List<String> paths = trackCounts.keys.toList()..sort();
    return [
      for (final String path in paths)
        if (path == rootPath || path.startsWith("$rootPath/"))
          MusicFolderNode(
            path: path,
            label: _segmentsOf(path).last,
            depth: _segmentsOf(path).length - rootDepth,
            trackCount: trackCounts[path]!,
          ),
    ];
  }

  static List<String> _commonPrefix(List<String> a, List<String> b) {
    final int limit = a.length < b.length ? a.length : b.length;
    int index = 0;
    while (index < limit && a[index] == b[index]) {
      index++;
    }
    return a.sublist(0, index);
  }

  static List<String> _segmentsOf(String path) =>
      path.split('/').where((segment) => segment.isNotEmpty).toList();

  /// Whether [filePath] sits anywhere below [rootPath].
  static bool isUnder({required String filePath, required String rootPath}) {
    return filePath == rootPath || filePath.startsWith("$rootPath/");
  }

  @override
  bool operator ==(Object other) {
    return other is MusicFolderNode &&
        other.path == path &&
        other.label == label &&
        other.depth == depth &&
        other.trackCount == trackCount;
  }

  @override
  int get hashCode => Object.hash(path, label, depth, trackCount);
}
