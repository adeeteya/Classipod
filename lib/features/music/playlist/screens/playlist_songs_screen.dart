import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/core/widgets/empty_state_widget.dart';
import 'package:classipod/features/custom_screen_elements/custom_screen.dart';
import 'package:classipod/features/music/playlist/models/playlist_model.dart';
import 'package:classipod/features/music/playlist/providers/playlists_provider.dart';
import 'package:classipod/features/music/playlist/widgets/playlist_song_list_tile.dart';
import 'package:classipod/features/now_playing/provider/now_playing_details_provider.dart';
import 'package:classipod/features/status_bar/widgets/status_bar.dart';
import 'package:flutter/cupertino.dart';
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
  List<MusicMetadata> get displayItems =>
      ref
          .watch(playlistsProvider)
          .firstWhere((e) => e.key == widget.playlistKey)
          .songs;

  PlaylistModel get playlist => ref
      .read(playlistsProvider)
      .firstWhere((e) => e.key == widget.playlistKey);

  @override
  Future<void> onSelectPressed() => _performAction(selectedDisplayItem);

  @override
  Future<void> onSelectLongPress() =>
      _performLongPressAction(selectedDisplayItem);

  Future<void> _performAction(int index) async {
    setState(() => selectedDisplayItem = index);
    if (index == 0) {
      await ref
          .read(playlistsProvider.notifier)
          .saveNewPlaylist(context.localization.newPlaylist, playlist.songs);
      if (mounted) {
        context.pop();
      }
    } else if (index == 1) {
      await ref
          .read(playlistsProvider.notifier)
          .clearPlaylist(widget.playlistKey);
      if (mounted) {
        context.pop();
      }
    } else {
      await ref
          .read(audioPlayerServiceProvider.notifier)
          .playPlaylist(playlistDetail: playlist, songIndex: index - 2);
      if (mounted) {
        await context.pushNamed(Routes.nowPlaying.name);
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

  Widget _customPlaylistListTile({
    required final VoidCallback onTap,
    required bool isSelected,
    required bool isSavePlaylist,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 54,
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient:
                isSelected
                    ? const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppPalette.selectedTileGradientColor1,
                        AppPalette.selectedTileGradientColor2,
                      ],
                    )
                    : null,
          ),
          child: Row(
            children: [
              SizedBox(
                height: 54,
                width: 54,
                child: ColoredBox(
                  color: AppPalette.defaultIconBackgroundColor,
                  child: Icon(
                    isSavePlaylist
                        ? CupertinoIcons.plus_app
                        : CupertinoIcons.clear_circled,
                    size: 25,
                    color: CupertinoColors.black,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  isSavePlaylist
                      ? context.localization.savePlaylist
                      : context.localization.clearPlaylist,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color:
                        isSelected
                            ? CupertinoColors.white
                            : CupertinoColors.black,
                  ),
                  maxLines: 1,
                ),
              ),
              if (isSelected)
                const Icon(
                  CupertinoIcons.right_chevron,
                  color: CupertinoColors.white,
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (displayItems.isEmpty) {
      return CupertinoPageScaffold(
        child: Column(
          children: [
            StatusBar(title: playlist.name),
            Expanded(
              child: EmptyStateWidget(
                emptyDescription: context.localization.noMusicFilesFound,
              ),
            ),
          ],
        ),
      );
    }

    final int? currentlyPlayingOriginalIndex =
        ref
            .watch(nowPlayingDetailsProvider.select((e) => e.currentMetadata))
            ?.originalSongIndex;

    return CupertinoPageScaffold(
      child: Column(
        children: [
          StatusBar(title: playlist.name),
          Flexible(
            child: CupertinoScrollbar(
              controller: scrollController,
              child: ListView.builder(
                controller: scrollController,
                itemCount: displayItems.length + 2,
                prototypeItem: _customPlaylistListTile(
                  onTap: () {},
                  isSelected: false,
                  isSavePlaylist: false,
                ),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return _customPlaylistListTile(
                      onTap: () async => _performAction(0),
                      isSelected: selectedDisplayItem == 0,
                      isSavePlaylist: true,
                    );
                  } else if (index == 1) {
                    return _customPlaylistListTile(
                      onTap: () async => _performAction(1),
                      isSelected: selectedDisplayItem == 1,
                      isSavePlaylist: false,
                    );
                  }

                  return PlaylistSongListTile(
                    songMetadata: displayItems[index - 2],
                    isSelected: selectedDisplayItem == index,
                    isCurrentlyPlaying:
                        currentlyPlayingOriginalIndex ==
                        displayItems[index - 2].originalSongIndex,
                    onTap: () async => _performAction(index),
                    onLongPress: () async => _performLongPressAction(index),
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
