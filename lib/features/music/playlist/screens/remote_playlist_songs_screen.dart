import 'package:classipod/core/extensions/go_router_extensions.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/core/subsonic/remote_playlist.dart';
import 'package:classipod/features/custom_screen_elements/custom_screen.dart';
import 'package:classipod/features/music/playlist/models/playlist_model.dart';
import 'package:classipod/features/music/playlist/widgets/playlist_song_list_tile.dart';
import 'package:classipod/features/now_playing/provider/now_playing_details_provider.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RemotePlaylistSongsScreen extends ConsumerStatefulWidget {
  final String playlistId;

  const RemotePlaylistSongsScreen({super.key, required this.playlistId});

  @override
  ConsumerState<RemotePlaylistSongsScreen> createState() =>
      _RemotePlaylistSongsScreenState();
}

class _RemotePlaylistSongsScreenState
    extends ConsumerState<RemotePlaylistSongsScreen>
    with CustomScreen {
  @override
  String get routeName => Routes.remotePlaylistSongs.name;

  @override
  double get displayTileHeight => 54;

  @override
  List<MusicMetadata> get displayItems =>
      ref.watch(remotePlaylistSongsProvider(widget.playlistId)).value ?? [];

  @override
  Future<void> onSelectPressed() => _play(selectedDisplayItem);

  Future<void> _play(int index) async {
    final songs = displayItems;
    if (index < 0 || index >= songs.length) return;
    setState(() => selectedDisplayItem = index);
    await ref
        .read(audioPlayerServiceProvider.notifier)
        .playPlaylist(
          playlistDetail: PlaylistModel(
            name: 'Navidrome Playlist',
            songs: songs,
          ),
          songIndex: index,
        );
    if (mounted) await context.openUniqueNamed(Routes.nowPlaying.name);
  }

  @override
  Widget build(BuildContext context) {
    final result = ref.watch(remotePlaylistSongsProvider(widget.playlistId));
    if (result.isLoading) {
      return const CupertinoPageScaffold(
        child: Center(child: CupertinoActivityIndicator()),
      );
    }
    if (result.hasError) {
      return const CupertinoPageScaffold(
        child: Center(child: Text('Unable to load Navidrome playlist')),
      );
    }
    if (displayItems.isEmpty) {
      return const CupertinoPageScaffold(
        child: Center(child: Text('This playlist has no tracks')),
      );
    }
    final playing = ref
        .watch(nowPlayingDetailsProvider.select((e) => e.currentMetadata))
        ?.identity;
    return CupertinoPageScaffold(
      child: CupertinoScrollbar(
        controller: scrollController,
        child: ListView.builder(
          controller: scrollController,
          itemCount: displayItems.length,
          prototypeItem: PlaylistSongListTile(
            songMetadata: displayItems.first,
            isSelected: false,
            isCurrentlyPlaying: false,
            onTap: () {},
            onLongPress: () {},
          ),
          itemBuilder: (context, index) => PlaylistSongListTile(
            songMetadata: displayItems[index],
            isSelected: selectedDisplayItem == index,
            isCurrentlyPlaying: playing == displayItems[index].identity,
            onTap: () => _play(index),
            onLongPress: () {},
          ),
        ),
      ),
    );
  }
}
