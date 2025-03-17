import 'package:classipod/core/models/music_metadata.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class PlaylistModel extends HiveObject {
  int id;

  String name;

  List<MusicMetadata> songs;

  PlaylistModel({required this.id, required this.name, required this.songs});

  PlaylistModel copyWith({int? id, String? name, List<MusicMetadata>? songs}) {
    return PlaylistModel(
      id: id ?? this.id,
      name: name ?? this.name,
      songs: songs ?? this.songs,
    );
  }

  PlaylistModel addSongToPlaylist(MusicMetadata song) {
    // If song is already in the playlist then return
    if (songs.contains(song)) {
      return this;
    }
    return copyWith(songs: [...songs, song]);
  }

  PlaylistModel removeSongFromPlaylist(MusicMetadata song) {
    return copyWith(
      songs:
          songs
              .where((e) => e.originalSongIndex != song.originalSongIndex)
              .toList(),
    );
  }

  PlaylistModel clearPlaylist() {
    return copyWith(songs: []);
  }

  @override
  bool operator ==(Object other) {
    return other is PlaylistModel &&
        other.id == id &&
        other.name == name &&
        other.songs == songs;
  }

  @override
  int get hashCode => Object.hash(id, name, songs);

  @override
  String toString() {
    return 'PlaylistModel(id: $id, name: $name, songs: $songs)';
  }
}
