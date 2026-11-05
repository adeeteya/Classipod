import 'package:classipod/core/constants/constants.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/providers/filtered_audio_files_provider.dart';
import 'package:classipod/core/utils/name_order.dart';
import 'package:classipod/features/music/album/models/album_model.dart';
import 'package:classipod/features/music/playlist/models/playlist_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

final starredPlaylistProvider = Provider<List<MusicMetadata>>((ref) {
  final List<MusicMetadata> songs =
      ref.watch(filteredAudioFilesProvider).value ?? [];
  return songs.where((song) => song.rating >= 1).toList();
});

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
    ref.listen(starredPlaylistProvider, (_, starredSongs) {
      state = [
        state[0],
        VirtualPlaylistModel(
          name: 'Starred',
          songs: starredSongs,
          virtualKey: starredPlaylistKey,
        ),
        ...state.skip(2),
      ];
    });
    return [
      PlaylistModel(name: 'On The Go', songs: []),
      VirtualPlaylistModel(
        name: 'Starred',
        songs: ref.read(starredPlaylistProvider),
        virtualKey: starredPlaylistKey,
      ),
      ..._sortedSavedPlaylists(),
    ];
  }

  void refreshProvider() {
    state = [
      state[0],
      VirtualPlaylistModel(
        name: 'Starred',
        songs: ref.read(starredPlaylistProvider),
        virtualKey: starredPlaylistKey,
      ),
      ..._sortedSavedPlaylists(),
    ];
  }

  List<PlaylistModel> _sortedSavedPlaylists() =>
      _playlistBox.values.toList()
        ..sort((a, b) => compareNames(a.name, b.name));

  Future<void> saveNewPlaylist({
    required String newPlaylistPlaceholderString,
    required List<MusicMetadata> songs,
  }) async {
    if (songs.isEmpty) {
      return;
    }

    final newPlaylist = PlaylistModel(name: '', songs: songs);
    final newKey = await _playlistBox.add(newPlaylist);
    await _playlistBox.put(
      newKey,
      newPlaylist.copyWith(name: "$newPlaylistPlaceholderString ${newKey + 1}"),
    );
    refreshProvider();
  }

  Future<void> renamePlaylist({
    required int? playlistKey,
    required String newPlaylistName,
  }) async {
    // Can't rename virtual playlist options.
    if (playlistKey == null || playlistKey == starredPlaylistKey) {
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

  Future<void> clearPlaylist({required int? playlistKey}) async {
    // Can't remove virtual playlist options.
    if (playlistKey == starredPlaylistKey) {
      return;
    } else if (playlistKey == null) {
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
    if (song != null && playlistModel.key != starredPlaylistKey) {
      await _playlistBox.put(
        playlistModel.key,
        playlistModel.removeSongFromPlaylist(song),
      );
      refreshProvider();
    }
  }
}
