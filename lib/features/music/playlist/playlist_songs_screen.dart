import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/models/metadata.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/core/widgets/empty_state_widget.dart';
import 'package:classipod/features/custom_screen_widgets/custom_screen.dart';
import 'package:classipod/features/music/playlist/playlist_songs_provider.dart';
import 'package:classipod/features/music/songs/song_list_tile.dart';
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
  double get displayTileHeight => 40.0;

  @override
  List<Metadata> get displayItems =>
      ref.watch(playlistSongsProvider(widget.playlistId)).songs;

  @override
  Future<void> onSelectPressed() => _playPlaylist(selectedDisplayItem);

  @override
  void onSelectLongPress() {
    if (displayItems.isEmpty) return;
    context.goNamed(
      Routes.playlistSongsMoreOptions.name,
      extra: () async {
        await ref
            .read(playlistSongsProvider(widget.playlistId).notifier)
            .removeSongFromPlaylist(displayItems[selectedDisplayItem]);
      },
    );
  }

  Future<void> _playPlaylist(int displayIndex) async {
    setState(() => selectedDisplayItem = displayIndex);
    await ref.read(audioPlayerServiceProvider.notifier).playPlaylist(
          playlistDetail: ref.read(playlistSongsProvider(widget.playlistId)),
          songIndex: displayIndex,
        );
    if (mounted) {
      await context.pushNamed(Routes.nowPlaying.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    final int? currentlyPlayingOriginalIndex = ref
        .watch(nowPlayingDetailsProvider.select((e) => e.currentMetadata))
        ?.originalSongIndex;

    if (displayItems.isEmpty) {
      return CupertinoPageScaffold(
        child: Column(
          children: [
            StatusBar(
              title: ref.read(playlistSongsProvider(widget.playlistId)).name,
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

    return CupertinoPageScaffold(
      child: Column(
        children: [
          StatusBar(
            title: ref.read(playlistSongsProvider(widget.playlistId)).name,
          ),
          Flexible(
            child: CupertinoScrollbar(
              controller: scrollController,
              child: ListView.builder(
                controller: scrollController,
                itemCount: displayItems.length,
                itemBuilder: (context, index) => SongListTile(
                  songName: displayItems[index].trackName,
                  trackArtistNames: displayItems[index].getTrackArtistNames,
                  isSelected: selectedDisplayItem == index,
                  isCurrentlyPlaying: currentlyPlayingOriginalIndex ==
                      displayItems[index].originalSongIndex,
                  onTap: () async => _playPlaylist(index),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
