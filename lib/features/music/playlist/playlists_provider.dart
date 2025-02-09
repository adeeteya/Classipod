import 'package:classipod/features/music/playlist/playlist_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final playlistsProvider =
    NotifierProvider<PlaylistsNotifier, List<PlaylistModel>>(
  PlaylistsNotifier.new,
);

class PlaylistsNotifier extends Notifier<List<PlaylistModel>> {
  @override
  List<PlaylistModel> build() {
    return [];
  }

  Future<void> init() async {
    state = [
      PlaylistModel(id: 0, name: 'On The Go', songs: []),
    ];
  }

  Future<void> addNewPlaylist(PlaylistModel playlist) async {
    state = [...state, playlist];
  }

  Future<void> removePlaylist(int id) async {
    // Can't remove the on-the-go-playlist option
    if (id == 0) return;
    state = state.where((playlist) => playlist.id != id).toList();
  }
}
