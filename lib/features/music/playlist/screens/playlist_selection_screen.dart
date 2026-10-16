import 'dart:async';

import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/features/custom_screen_elements/custom_screen.dart';
import 'package:classipod/features/music/playlist/models/add_to_playlist_action.dart';
import 'package:classipod/features/music/playlist/models/playlist_model.dart';
import 'package:classipod/features/music/playlist/models/playlist_name_result.dart';
import 'package:classipod/features/music/playlist/providers/playlists_provider.dart';
import 'package:classipod/features/music/playlist/widgets/placeholder_list_tile.dart';
import 'package:classipod/features/music/playlist/widgets/playlist_list_tile.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Screen opened when the user picks "Add to Playlist" anywhere in the library.
///
/// It lists every saved playlist, offers creating a new one or falling back to
/// the on-the-go playlist, and pops with the [PlaylistModel] the caller must
/// add [songs] to. Returning the playlist instead of writing to the box here
/// keeps the caller in charge of building the final list, so every entry point
/// (single song, album, search result) shares one code path.
class PlaylistSelectionScreen extends ConsumerStatefulWidget {
  final List<MusicMetadata> songs;

  const PlaylistSelectionScreen({super.key, required this.songs});

  @override
  ConsumerState<PlaylistSelectionScreen> createState() =>
      _PlaylistSelectionScreenState();
}

class _PlaylistSelectionScreenState
    extends ConsumerState<PlaylistSelectionScreen>
    with CustomScreen {
  @override
  double get displayTileHeight => 54;

  @override
  String get routeName => Routes.playlistSelection.name;

  /// Saved playlists only: the on-the-go playlist is offered as its own
  /// entry, so it never shows up as a regular destination.
  List<PlaylistModel> get savedPlaylists =>
      ref.watch(playlistsProvider).sublist(1);

  @override
  int get extraDisplayItems => 2;

  @override
  List get displayItems => [...savedPlaylists, ...AddToPlaylistAction.values];

  @override
  Future<void> onSelectPressed() => _performAction(selectedDisplayItem);

  /// Layout: the saved playlists first, then "New Playlist" and "On-The-Go",
  /// with cancel reachable through the MENU button.
  Future<void> _performAction(int index) async {
    setState(() => selectedDisplayItem = index);

    if (index < savedPlaylists.length) {
      final playlist = savedPlaylists[index];
      if (playlist.songs.isEmpty) {
        return;
      }
      context.pop(playlist);
      return;
    }

    switch (AddToPlaylistAction.values[index - savedPlaylists.length]) {
      case AddToPlaylistAction.newPlaylist:
        final result = await context.pushNamed(Routes.playlistName.name);
        if (!mounted || result is! PlaylistNameResult || !result.isSubmitted) {
          return;
        }
        // The new playlist is created empty and the caller inserts the
        // songs, so the same identity reconciliation runs for every target.
        await ref
            .read(playlistsProvider.notifier)
            .createPlaylist(playlistName: result.name!, songs: const []);
        final created = ref
            .read(playlistsProvider)
            .where((playlist) => playlist.name == result.name)
            .lastOrNull;
        if (mounted && created != null) {
          context.pop(created);
        }
        break;
      case AddToPlaylistAction.onTheGo:
        context.pop(
          ref
              .read(playlistsProvider)
              .firstWhere((playlist) => playlist.key == null),
        );
        break;
      case AddToPlaylistAction.cancel:
        context.pop();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = displayItems;
    return CupertinoPageScaffold(
      child: Column(
        children: [
          Flexible(
            child: CupertinoScrollbar(
              controller: scrollController,
              child: ListView.builder(
                controller: scrollController,
                itemCount: items.length,
                prototypeItem: PlaylistListTile(
                  playlistModel: PlaylistModel(name: '', songs: []),
                  isSelected: false,
                  onTap: () {},
                ),
                itemBuilder: (context, index) {
                  final isSelected = selectedDisplayItem == index;
                  if (index < savedPlaylists.length) {
                    return PlaylistListTile(
                      playlistModel: savedPlaylists[index],
                      isSelected: isSelected,
                      onTap: () async => _performAction(index),
                    );
                  }
                  return PlaceholderListTile(
                    text: switch (AddToPlaylistAction.values[index -
                        savedPlaylists.length]) {
                      AddToPlaylistAction.newPlaylist =>
                        context.localization.newPlaylist,
                      AddToPlaylistAction.onTheGo =>
                        context.localization.onTheGoPlaylist,
                      AddToPlaylistAction.cancel =>
                        context.localization.cancelText,
                    },
                    isSelected: isSelected,
                    onTap: () async => _performAction(index),
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
