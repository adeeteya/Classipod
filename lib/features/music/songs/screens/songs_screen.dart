import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/core/widgets/empty_state_widget.dart';
import 'package:classipod/features/custom_screen_elements/custom_screen.dart';
import 'package:classipod/features/music/songs/provider/songs_provider.dart';
import 'package:classipod/features/music/songs/widgets/song_list_tile.dart';
import 'package:classipod/features/now_playing/provider/now_playing_details_provider.dart';
import 'package:classipod/features/status_bar/widgets/status_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SongsScreen extends ConsumerStatefulWidget {
  const SongsScreen({super.key});

  @override
  ConsumerState createState() => _SongsScreenState();
}

class _SongsScreenState extends ConsumerState<SongsScreen> with CustomScreen {
  @override
  double get displayTileHeight => 54;

  @override
  String get routeName => Routes.songs.name;

  @override
  List<MusicMetadata> get displayItems => ref.read(songsProvider);

  @override
  Future<void> onSelectPressed() => _playSong(selectedDisplayItem);

  @override
  void onSelectLongPress() =>
      _navigateToSongMoreOptionsModal(selectedDisplayItem);

  void _navigateToSongMoreOptionsModal(int index) {
    setState(() => selectedDisplayItem = index);
    context.goNamed(Routes.songsMoreOptions.name, extra: displayItems[index]);
  }

  Future<void> _playSong(int displayIndex) async {
    setState(() => selectedDisplayItem = displayIndex);
    final int originalSongIndex = displayItems[displayIndex].originalSongIndex;

    await ref
        .read(audioPlayerServiceProvider.notifier)
        .playSongFromOriginalList(originalSongIndex);

    if (mounted) {
      await context.pushNamed(Routes.nowPlaying.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    final int? currentlyPlayingOriginalIndex =
        ref
            .watch(nowPlayingDetailsProvider.select((e) => e.currentMetadata))
            ?.originalSongIndex;
    if (displayItems.isEmpty) {
      return CupertinoPageScaffold(
        child: Column(
          children: [
            StatusBar(title: Routes.songs.title(context)),
            Expanded(
              child: EmptyStateWidget(
                emptyDescription: context.localization.noMusicFilesFound,
              ),
            ),
          ],
        ),
      );
    }

    return CupertinoPageScaffold(
      child: Column(
        children: [
          StatusBar(title: Routes.songs.title(context)),
          Flexible(
            child: CupertinoScrollbar(
              controller: scrollController,
              child: ListView.builder(
                controller: scrollController,
                itemCount: displayItems.length,
                itemBuilder:
                    (context, index) => SongListTile(
                      songName: displayItems[index].trackName,
                      trackArtistNames: displayItems[index].getTrackArtistNames,
                      isSelected: selectedDisplayItem == index,
                      isCurrentlyPlaying:
                          currentlyPlayingOriginalIndex ==
                          displayItems[index].originalSongIndex,
                      onTap: () async => _playSong(index),
                      onLongPress: () => _navigateToSongMoreOptionsModal(index),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
