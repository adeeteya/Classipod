import 'package:classipod/core/models/music_metadata.dart';

List<MusicMetadata> withoutDuplicateFileNames(Iterable<MusicMetadata> songs) {
  final seen = <String>{};
  return [
    for (final song in songs)
      if (_keep(song.filePath, seen)) song,
  ];
}

bool _keep(String? path, Set<String> seen) {
  if (path == null || path.isEmpty) return true;
  var normalized = path.replaceAll('\\', '/');
  if (normalized.startsWith('content://')) return true;
  if (normalized.startsWith('file:') ||
      normalized.startsWith('http://') ||
      normalized.startsWith('https://')) {
    final uri = Uri.tryParse(normalized);
    if (uri == null || uri.pathSegments.isEmpty) return true;
    normalized = uri.pathSegments.last;
  } else {
    normalized = normalized.split('/').last;
  }
  if (normalized.isEmpty) return true;
  return seen.add(normalized.toLowerCase());
}
