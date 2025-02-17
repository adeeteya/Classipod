import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/features/custom_screen_elements/custom_screen.dart';
import 'package:classipod/features/music/playlist/models/playlist_model.dart';
import 'package:classipod/features/music/playlist/providers/playlists_provider.dart';
import 'package:classipod/features/music/playlist/widgets/playlist_list_tile.dart';
import 'package:classipod/features/status_bar/widgets/status_bar.dart';
import 'package:flutter/cupertino.dart';
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
  List<PlaylistModel> get displayItems => ref.watch(playlistsProvider);

  @override
  Future<void> onSelectPressed() =>
      _navigateToPlaylistSongsScreen(selectedDisplayItem);

  Future<void> _navigateToPlaylistSongsScreen(int displayIndex) async {
    setState(() => selectedDisplayItem = displayIndex);
    context.goNamed(
      Routes.playlistSongs.name,
      queryParameters: {'playlistId': displayItems[displayIndex].id.toString()},
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        children: [
          StatusBar(title: Routes.playlists.title(context)),
          Flexible(
            child: CupertinoScrollbar(
              controller: scrollController,
              child: ListView.builder(
                controller: scrollController,
                itemCount: displayItems.length,
                itemBuilder:
                    (context, index) => PlaylistListTile(
                      playlistModel: displayItems[index],
                      isSelected: selectedDisplayItem == index,
                      onTap: () async => _navigateToPlaylistSongsScreen(index),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
