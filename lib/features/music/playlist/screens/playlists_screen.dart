import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/subsonic/remote_playlist.dart';
import 'package:classipod/features/custom_screen_elements/custom_screen.dart';
import 'package:classipod/features/music/playlist/models/playlist_model.dart';
import 'package:classipod/features/music/playlist/providers/playlists_provider.dart';
import 'package:classipod/features/music/playlist/widgets/playlist_list_tile.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PlaylistsScreen extends ConsumerStatefulWidget {
  const PlaylistsScreen({super.key});

  @override
  ConsumerState createState() => _PlaylistsScreenState();
}

class _PlaylistsScreenState extends ConsumerState<PlaylistsScreen>
    with CustomScreen {
  @override
  double get displayTileHeight => 54;

  @override
  String get routeName => Routes.playlists.name;

  @override
  List<PlaylistModel> get displayItems {
    final local = ref.watch(playlistsProvider);
    final remote = ref.watch(remotePlaylistsProvider).value ?? [];
    return [
      ...local,
      for (final item in remote)
        PlaylistModel(name: '${item.name} (Navidrome)', songs: []),
    ];
  }

  @override
  Future<void> onSelectPressed() =>
      _navigateToPlaylistSongsScreen(selectedDisplayItem);

  Future<void> _navigateToPlaylistSongsScreen(int displayIndex) async {
    setState(() => selectedDisplayItem = displayIndex);
    final local = ref.read(playlistsProvider);
    if (displayIndex < local.length) {
      context.goNamed(
        Routes.playlistSongs.name,
        extra: local[displayIndex].key.toString(),
      );
    } else {
      final remote = ref.read(remotePlaylistsProvider).value ?? [];
      final remoteIndex = displayIndex - local.length;
      if (remoteIndex >= remote.length) return;
      context.goNamed(
        Routes.remotePlaylistSongs.name,
        extra: remote[remoteIndex].id,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        children: [
          Flexible(
            child: CupertinoScrollbar(
              controller: scrollController,
              child: ListView.builder(
                controller: scrollController,
                itemCount: displayItems.length,
                prototypeItem: PlaylistListTile(
                  playlistModel: PlaylistModel(name: '', songs: []),
                  isSelected: false,
                  onTap: () {},
                ),
                itemBuilder: (context, index) {
                  final localCount = ref.read(playlistsProvider).length;
                  final remote = ref.read(remotePlaylistsProvider).value ?? [];
                  final remoteIndex = index - localCount;
                  return PlaylistListTile(
                    playlistModel: displayItems[index],
                    songCount: remoteIndex >= 0 && remoteIndex < remote.length
                        ? remote[remoteIndex].songCount
                        : null,
                    isSelected: selectedDisplayItem == index,
                    onTap: () async => _navigateToPlaylistSongsScreen(index),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
