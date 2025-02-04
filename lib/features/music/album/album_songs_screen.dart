import 'package:classipod/core/models/metadata.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/features/custom_screen_widgets/custom_screen.dart';
import 'package:classipod/features/music/album/album_detail.dart';
import 'package:classipod/features/music/songs/condensed_song_list_tile.dart';
import 'package:classipod/features/now_playing/provider/now_playing_details_provider.dart';
import 'package:classipod/features/status_bar/widgets/status_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AlbumSongsScreen extends ConsumerStatefulWidget {
  final AlbumDetail albumDetail;
  const AlbumSongsScreen({
    super.key,
    required this.albumDetail,
  });

  @override
  ConsumerState createState() => _AlbumSongsScreenState();
}

class _AlbumSongsScreenState extends ConsumerState<AlbumSongsScreen>
    with CustomScreen {
  @override
  String get routeName => Routes.albumSongs.name;

  @override
  List<Metadata> get displayItems => widget.albumDetail.albumSongs;

  @override
  Future<void> onSelectPressed() => _playSong(selectedDisplayItem);

  Future<void> _playSong(int index) async {
    setState(() => selectedDisplayItem = index);
    await ref
        .read(audioPlayerServiceProvider.notifier)
        .playSongFromOriginalIndex(displayItems[index].originalSongIndex);

    if (mounted) {
      await context.pushNamed(Routes.nowPlaying.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    final int? currentlyPlayingOriginalIndex = ref
        .watch(nowPlayingDetailsProvider.select((e) => e.currentMetadata))
        ?.originalSongIndex;
    return CupertinoPageScaffold(
      child: Column(
        children: [
          StatusBar(
            title: widget.albumDetail.albumName,
          ),
          Flexible(
            child: CupertinoScrollbar(
              controller: scrollController,
              child: ListView.builder(
                controller: scrollController,
                itemCount: displayItems.length,
                itemBuilder: (context, index) => CondensedSongListTile(
                  songName: displayItems[index].getTrackName,
                  isSelected: selectedDisplayItem == index,
                  isCurrentlyPlaying: currentlyPlayingOriginalIndex ==
                      displayItems[index].originalSongIndex,
                  onTap: () async => _playSong(index),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
