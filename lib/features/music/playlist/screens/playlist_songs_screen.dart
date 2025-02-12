import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/models/metadata.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/core/widgets/empty_state_widget.dart';
import 'package:classipod/features/custom_screen_elements/custom_screen.dart';
import 'package:classipod/features/music/playlist/providers/playlists_provider.dart';
import 'package:classipod/features/music/playlist/widgets/playlist_song_list_tile.dart';
import 'package:classipod/features/now_playing/provider/now_playing_details_provider.dart';
import 'package:classipod/features/status_bar/widgets/status_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PlaylistSongsScreen extends ConsumerStatefulWidget {
  final int playlistId;
  const PlaylistSongsScreen({super.key, required this.playlistId});

  @override
  ConsumerState createState() => _PlaylistsSongsScreenState();
}

class _PlaylistsSongsScreenState extends ConsumerState<PlaylistSongsScreen>
    with CustomScreen {
  @override
  String get routeName =>
      Uri.parse("${Routes.playlistSongs.name}?playlistId=${widget.playlistId}")
          .path;

  @override
  double get displayTileHeight => 54;

  @override
  int get extraDisplayItems => 2;

  @override
  List<Metadata> get displayItems =>
      ref.watch(playlistsProvider).elementAtOrNull(widget.playlistId)?.songs ??
      [];

  @override
  Future<void> onSelectPressed() => _performAction(selectedDisplayItem);

  @override
  void onSelectLongPress() => _performLongPressAction(selectedDisplayItem);

  Future<void> _performAction(int index) async {
    setState(() => selectedDisplayItem = index);
    if (index == 0) {
      await ref
          .read(playlistsProvider.notifier)
          .saveNewPlaylist(context.localization.newPlaylist);
      if (mounted) {
        context.pop();
      }
    } else if (index == 1) {
      await ref
          .read(playlistsProvider.notifier)
          .clearPlaylist(widget.playlistId);
      if (mounted) {
        context.pop();
      }
    } else {
      await ref.read(audioPlayerServiceProvider.notifier).playPlaylist(
            playlistDetail: ref.read(playlistsProvider)[widget.playlistId],
            songIndex: index - 2,
          );
      if (mounted) {
        await context.pushNamed(Routes.nowPlaying.name);
      }
    }
  }

  void _performLongPressAction(int index) {
    if (displayItems.isEmpty) return;
    setState(() => selectedDisplayItem = index);
    if (index < 2) {
      return;
    } else {
      context.goNamed(
        Routes.playlistSongsMoreOptions.name,
        extra: () async {
          await ref.read(playlistsProvider.notifier).removeSongFromPlaylist(
                playlistId: widget.playlistId,
                song: displayItems[index - 2],
              );
        },
      );
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
            gradient: isSelected
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
                    color: isSelected
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
            StatusBar(
              title: ref.read(playlistsProvider)[widget.playlistId].name,
            ),
            Expanded(
              child: EmptyStateWidget(
                emptyDescription: context.localization.noMusicFilesFound,
              ),
            ),
          ],
        ),
      );
    }

    final int? currentlyPlayingOriginalIndex = ref
        .watch(nowPlayingDetailsProvider.select((e) => e.currentMetadata))
        ?.originalSongIndex;

    return CupertinoPageScaffold(
      child: Column(
        children: [
          StatusBar(
            title: ref.read(playlistsProvider)[widget.playlistId].name,
          ),
          Flexible(
            child: CupertinoScrollbar(
              controller: scrollController,
              child: ListView.builder(
                controller: scrollController,
                itemCount: displayItems.length + 2,
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
                    isCurrentlyPlaying: currentlyPlayingOriginalIndex ==
                        displayItems[index - 2].originalSongIndex,
                    onTap: () async => _performAction(index),
                    onLongPress: () => _performLongPressAction(index),
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
