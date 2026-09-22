class LibrarySong {
  final String uri;
  final String volume;
  final String? path;
  final int size;
  final int modified;
  final Map<String, dynamic> metadata;

  const LibrarySong({
    required this.uri,
    required this.volume,
    this.path,
    required this.size,
    required this.modified,
    this.metadata = const {},
  });
}

class LibrarySnapshot {
  final List<LibrarySong> songs;

  final List<String> volumes;

  const LibrarySnapshot({required this.songs, required this.volumes});
}
