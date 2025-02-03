import 'package:classipod/core/models/metadata.dart';

class AlbumDetail {
  final String albumName;
  final String? albumArtPath;
  final String albumArtistName;
  final List<Metadata> albumSongs;

  AlbumDetail({
    required this.albumName,
    required this.albumArtPath,
    required this.albumArtistName,
    required this.albumSongs,
  });

  AlbumDetail copyWith({
    String? albumName,
    String? albumArtPath,
    String? albumArtistName,
    List<Metadata>? albumSongs,
  }) {
    return AlbumDetail(
      albumName: albumName ?? this.albumName,
      albumArtPath: albumArtPath ?? this.albumArtPath,
      albumArtistName: albumArtistName ?? this.albumArtistName,
      albumSongs: albumSongs ?? this.albumSongs,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AlbumDetail &&
        other.albumName == albumName &&
        other.albumArtistName == albumArtistName;
  }

  @override
  int get hashCode => Object.hash(
        albumName,
        albumArtistName,
      );
}
