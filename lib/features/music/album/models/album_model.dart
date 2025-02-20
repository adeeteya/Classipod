import 'package:classipod/core/models/music_metadata.dart';

class AlbumModel {
  final String albumName;
  final String? albumArtPath;
  final String albumArtistName;
  final List<MusicMetadata> albumSongs;

  AlbumModel({
    required this.albumName,
    required this.albumArtPath,
    required this.albumArtistName,
    required this.albumSongs,
  });

  AlbumModel copyWith({
    String? albumName,
    String? albumArtPath,
    String? albumArtistName,
    List<MusicMetadata>? albumSongs,
  }) {
    return AlbumModel(
      albumName: albumName ?? this.albumName,
      albumArtPath: albumArtPath ?? this.albumArtPath,
      albumArtistName: albumArtistName ?? this.albumArtistName,
      albumSongs: albumSongs ?? this.albumSongs,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AlbumModel &&
        other.albumName == albumName &&
        other.albumArtistName == albumArtistName;
  }

  @override
  int get hashCode => Object.hash(albumName, albumArtistName);

  bool isOnDevice() {
    return albumSongs.first.isOnDevice;
  }
}
