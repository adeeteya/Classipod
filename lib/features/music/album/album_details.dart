class AlbumDetails {
  final String albumName;
  final String? thumbnailPath;
  final String albumArtistName;
  final List<int> supportingArtistNames;

  AlbumDetails({
    required this.albumName,
    required this.thumbnailPath,
    required this.albumArtistName,
    this.supportingArtistNames = const [],
  });
}
