import 'package:classipod/core/constants/constants.dart';
import 'package:classipod/core/models/metadata.dart';
import 'package:classipod/core/services/audio_files_service.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/features/music/album/models/album_model.dart';
import 'package:classipod/features/music/playlist/models/playlist_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

final playlistsProvider =
    NotifierProvider<PlaylistsNotifier, List<PlaylistModel>>(
      PlaylistsNotifier.new,
    );

class PlaylistsNotifier extends Notifier<List<PlaylistModel>> {
  final Box<PlaylistModel> _playlistBox = Hive.box<PlaylistModel>(
    Constants.playlistBoxName,
  );

  @override
  List<PlaylistModel> build() {
    return [];
  }

  Future<void> init() async {
    state = [
      PlaylistModel(id: 0, name: 'On The Go', songs: []),
      ..._playlistBox.values,
    ];
  }

  Future<void> saveNewPlaylist(String newPlaylistPlaceholderString) async {
    final newPlaylist = state[0].copyWith(
      id: state.length,
      name: "$newPlaylistPlaceholderString ${state.length}",
    );
    await _playlistBox.add(newPlaylist);
    state = [...state, newPlaylist];
  }

  Future<void> clearPlaylist(int id) async {
    // Can't remove the on-the-go-playlist option
    if (id == 0) {
      Future.delayed(const Duration(seconds: 1), () {
        state = [
          for (final playlist in state)
            if (playlist.id == 0) playlist.copyWith(songs: []) else playlist,
        ];
      });
      return;
    } else {
      await _playlistBox.deleteAt(id - 1);
      Future.delayed(const Duration(seconds: 1), () {
        state = state.where((playlist) => playlist.id != id).toList();
      });
    }
  }

  void addSongToPlaylist(Metadata? song) {
    if (song != null) {
      state = [
        state[0].addSongToPlaylist(song),
        if (state.length > 1) ...state.sublist(1),
      ];
    }
  }

  void addAlbumToPlaylist(AlbumModel? albumDetail) {
    if (albumDetail != null) {
      albumDetail.albumSongs.forEach(addSongToPlaylist);
    }
  }

  Future<void> removeSongFromPlaylist({
    required int playlistId,
    Metadata? song,
  }) async {
    if (song != null) {
      state = [
        for (final playlist in state)
          if (playlist.id == playlistId)
            playlist.removeSongFromPlaylist(song)
          else
            playlist,
      ];
    }
    if (state[0].songs.isEmpty) {
      await ref
          .read(audioPlayerServiceProvider.notifier)
          .setAudioSource(
            musicMetadataList: ref.read(audioFilesServiceProvider).requireValue,
          );
    }
  }
}
