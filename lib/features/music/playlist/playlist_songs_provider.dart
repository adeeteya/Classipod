import 'package:classipod/core/models/metadata.dart';
import 'package:classipod/core/services/audio_files_service.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/features/music/album/album_detail.dart';
import 'package:classipod/features/music/playlist/playlist_model.dart';
import 'package:classipod/features/music/playlist/playlists_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final playlistSongsProvider =
    NotifierProvider.family<PlaylistSongsNotifier, PlaylistModel, int>(
  PlaylistSongsNotifier.new,
);

class PlaylistSongsNotifier extends FamilyNotifier<PlaylistModel, int> {
  @override
  PlaylistModel build(int arg) {
    return ref.read(playlistsProvider).firstWhere(
          (playlist) => playlist.id == arg,
        );
  }

  void addSongToPlaylist(Metadata? song) {
    if (song != null) {
      state = state.addSongToPlaylist(song);
    }
  }

  void addAlbumToPlaylist(AlbumDetail albumDetail) {
    albumDetail.albumSongs.forEach(addSongToPlaylist);
  }

  Future<void> removeSongFromPlaylist(Metadata? song) async {
    if (song != null) {
      state = state.removeSongFromPlaylist(song);
    }
    if (state.songs.isEmpty) {
      await ref.read(audioPlayerServiceProvider.notifier).setAudioSource(
            musicMetadataList: ref.read(audioFilesServiceProvider).requireValue,
          );
    }
  }
}
