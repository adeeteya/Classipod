import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/extensions/go_router_extensions.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/providers/filtered_audio_files_provider.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/core/subsonic/subsonic_controller.dart';
import 'package:classipod/core/widgets/empty_state_widget.dart';
import 'package:classipod/core/widgets/fast_scroll_indicator.dart';
import 'package:classipod/features/custom_screen_elements/custom_screen.dart';
import 'package:classipod/features/music/playlist/models/playlist_model.dart';
import 'package:classipod/features/music/playlist/models/playlist_option_type.dart';
import 'package:classipod/features/music/playlist/providers/playlists_provider.dart';
import 'package:classipod/features/music/playlist/widgets/playlist_option_list_tile.dart';
import 'package:classipod/features/music/playlist/widgets/playlist_song_list_tile.dart';
import 'package:classipod/features/now_playing/provider/now_playing_details_provider.dart';
import 'package:classipod/features/settings/widgets/subsonic_dialog.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PlaylistSongsScreen extends ConsumerStatefulWidget {
  final int? playlistKey;

  const PlaylistSongsScreen({super.key, required this.playlistKey});

  @override
  ConsumerState createState() => _PlaylistsSongsScreenState();
}

class _PlaylistsSongsScreenState extends ConsumerState<PlaylistSongsScreen>
    with CustomScreen {
  @override
  String get routeName => Routes.playlistSongs.name;

  @override
  double get displayTileHeight => 54;

  @override
  int get extraDisplayItems => 2;

  @override
  List<MusicMetadata> get displayItems {
    final stored = ref
        .watch(playlistsProvider)
        .firstWhere((e) => e.key == widget.playlistKey)
        .songs;
    final library = ref.watch(filteredAudioFilesProvider).value;
    if (library == null || !stored.any((song) => song.songId != null)) {
      return stored;
    }
    final byId = {for (final song in library) song.identity: song};
    return [
      for (final song in stored)
        if (song.isSubsonic || byId[song.identity] != null)
          byId[song.identity] ?? song,
    ];
  }

  PlaylistModel get playlist => ref
      .read(playlistsProvider)
      .firstWhere((e) => e.key == widget.playlistKey);

  @override
  Future<void> onSelectPressed() => _performAction(selectedDisplayItem);

  @override
  Future<void> onSelectLongPress() =>
      _performLongPressAction(selectedDisplayItem);

  Future<void> _performAction(int index) async {
    final isSavingEmptyOnTheGoPlaylist =
        index == 0 && widget.playlistKey == null && displayItems.isEmpty;
    if (isSavingEmptyOnTheGoPlaylist) {
      return;
    }

    setState(() => selectedDisplayItem = index);
    if (index == 0) {
      if (widget.playlistKey == null) {
        await ref
            .read(playlistsProvider.notifier)
            .saveNewPlaylist(
              newPlaylistPlaceholderString: context.localization.newPlaylist,
              songs: playlist.songs,
            );
        if (mounted) {
          context.pop();
        }
      }
      // If the playlist is not on-the-go, it means we are renaming an existing playlist
      else {
        final newPlaylistName = await context.pushNamed(
          Routes.playlistRename.name,
          extra: playlist.name,
        );
        if (newPlaylistName != null &&
            newPlaylistName is String &&
            newPlaylistName.isNotEmpty) {
          await ref
              .read(playlistsProvider.notifier)
              .renamePlaylist(
                playlistKey: widget.playlistKey,
                newPlaylistName: newPlaylistName,
              );
        }
      }
    } else if (index == 1) {
      await ref
          .read(playlistsProvider.notifier)
          .clearPlaylist(playlistKey: widget.playlistKey);
      if (mounted) {
        context.pop();
      }
    } else {
      final selected = displayItems[index - 2];
      var remote = ref.read(subsonicControllerProvider).value;
      if (selected.isSubsonic &&
          remote?.enabled == true &&
          remote?.config?.id == selected.serverId &&
          remote?.signedIn != true) {
        await showSubsonicDialog(context);
        if (!mounted) return;
        remote = ref.read(subsonicControllerProvider).value;
      }
      if (selected.isSubsonic && !(remote?.available(selected) ?? false)) {
        return;
      }
      final playable = displayItems
          .where(
            (song) => !song.isSubsonic || (remote?.available(song) ?? false),
          )
          .toList();
      await ref
          .read(audioPlayerServiceProvider.notifier)
          .playPlaylist(
            playlistDetail: playlist.copyWith(songs: playable),
            songIndex: playable.indexOf(selected),
          );
      if (mounted) {
        await context.openUniqueNamed(Routes.nowPlaying.name);
      }
    }
  }

  Future<void> _performLongPressAction(int index) async {
    if (displayItems.isEmpty) return;
    setState(() => selectedDisplayItem = index);
    if (index < 2) {
      return;
    } else {
      final result = await context.pushNamed(
        Routes.playlistSongsMoreOptions.name,
      );
      if (result == true) {
        await ref
            .read(playlistsProvider.notifier)
            .removeSongFromPlaylist(
              playlistModel: playlist,
              song: displayItems[index - 2],
            );
        if (playlist.songs.isEmpty) {
          return _performAction(1);
        } else {
          setState(() {
            selectedDisplayItem = index - 1;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (displayItems.isEmpty) {
      return CupertinoPageScaffold(
        child: Column(
          children: [
            Expanded(
              child: EmptyStateWidget(
                emptyDescription: context.localization.noMusicFilesFound,
              ),
            ),
          ],
        ),
      );
    }

    final String? currentlyPlayingOriginalIndex = ref
        .watch(nowPlayingDetailsProvider.select((e) => e.currentMetadata))
        ?.identity;

    return CupertinoPageScaffold(
      child: Column(
        children: [
          Flexible(
            child: FastScrollIndicator(
              wheelScrollIndex: wheelScrollIndex,
              itemCount: displayItems.length + 2,
              itemExtent: displayTileHeight,
              labelAt: (index) =>
                  index < 2 ? '' : displayItems[index - 2].getTrackName,
              child: CupertinoScrollbar(
                controller: scrollController,
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: displayItems.length + 2,
                  prototypeItem: PlaylistOptionListTile(
                    onTap: () {},
                    isSelected: false,
                    type: PlaylistOptionType.savePlaylist,
                  ),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return PlaylistOptionListTile(
                        onTap: () async => _performAction(0),
                        isSelected: selectedDisplayItem == 0,
                        type: widget.playlistKey == null
                            ? PlaylistOptionType.savePlaylist
                            : PlaylistOptionType.renamePlaylist,
                      );
                    } else if (index == 1) {
                      return PlaylistOptionListTile(
                        onTap: () async => _performAction(1),
                        isSelected: selectedDisplayItem == 1,
                        type: PlaylistOptionType.clearPlaylist,
                      );
                    }

                    return PlaylistSongListTile(
                      songMetadata: displayItems[index - 2],
                      unavailable:
                          displayItems[index - 2].isSubsonic &&
                          !(ref
                                  .watch(subsonicControllerProvider)
                                  .value
                                  ?.available(displayItems[index - 2]) ??
                              false),
                      isSelected: selectedDisplayItem == index,
                      isCurrentlyPlaying:
                          currentlyPlayingOriginalIndex ==
                          displayItems[index - 2].identity,
                      onTap: () async => _performAction(index),
                      onLongPress: () async => _performLongPressAction(index),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
