import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/utils/artist_name_utils.dart';

class AlbumModel {
  final String albumName;
  final String? albumArtPath;
  final String albumArtistName;
  final List<MusicMetadata> albumSongs;

  AlbumModel({
    required this.albumName,
    this.albumArtPath,
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
        other.albumName.trim().toLowerCase() ==
            albumName.trim().toLowerCase() &&
        _primaryArtist(other.albumArtistName) ==
            _primaryArtist(albumArtistName);
  }

  @override
  int get hashCode => Object.hash(
    albumName.trim().toLowerCase(),
    _primaryArtist(albumArtistName),
  );

  static String _primaryArtist(String artistNames) {
    final artists = splitArtistNames(artistNames);
    return (artists.isEmpty ? artistNames : artists.first).trim().toLowerCase();
  }

  bool isOnDevice() {
    return albumSongs.first.isOnDevice;
  }
}
