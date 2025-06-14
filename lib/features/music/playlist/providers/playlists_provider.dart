import 'package:classipod/core/constants/constants.dart';
import 'package:classipod/core/models/music_metadata.dart';
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
    return [
      PlaylistModel(name: 'On The Go', songs: []),
      ..._playlistBox.values,
    ];
  }

  void refreshProvider() {
    state = [state[0], ..._playlistBox.values];
  }

  Future<void> saveNewPlaylist({
    required String newPlaylistPlaceholderString,
    required List<MusicMetadata> songs,
  }) async {
    final newPlaylist = PlaylistModel(name: '', songs: songs);
    final newKey = await _playlistBox.add(newPlaylist);
    await _playlistBox.put(
      newKey,
      newPlaylist.copyWith(name: "$newPlaylistPlaceholderString ${newKey + 1}"),
    );
    refreshProvider();
  }

  Future<void> renamePlaylist({
    required dynamic playlistKey,
    required String newPlaylistName,
  }) async {
    // Can't rename the on-the-go-playlist option
    if (playlistKey == null) {
      return;
    } else {
      final currentPlaylist = _playlistBox.get(playlistKey);
      if (currentPlaylist != null) {
        await _playlistBox.put(
          playlistKey,
          currentPlaylist.copyWith(name: newPlaylistName),
        );
        refreshProvider();
      }
    }
  }

  Future<void> clearPlaylist({required dynamic playlistKey}) async {
    // Can't remove the on-the-go-playlist option
    if (playlistKey == null) {
      Future.delayed(const Duration(milliseconds: 350), () {
        state = [
          for (final playlist in state)
            if (playlist.key == null)
              playlist.copyWith(songs: [])
            else
              playlist,
        ];
      });
      return;
    } else {
      Future.delayed(const Duration(seconds: 1), () async {
        await _playlistBox.delete(playlistKey);
        refreshProvider();
      });
    }
  }

  void addSongToPlaylist(MusicMetadata? song) {
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
    required PlaylistModel playlistModel,
    MusicMetadata? song,
  }) async {
    if (song != null) {
      await _playlistBox.put(
        playlistModel.key,
        playlistModel.removeSongFromPlaylist(song),
      );
      refreshProvider();
    }
  }
}
