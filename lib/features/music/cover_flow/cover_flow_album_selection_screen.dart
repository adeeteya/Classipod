import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/models/metadata.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/features/custom_screen_widgets/custom_screen.dart';
import 'package:classipod/features/music/album/album_detail.dart';
import 'package:classipod/features/music/cover_flow/cover_flow_album_song_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CoverFlowAlbumSelectionScreen extends ConsumerStatefulWidget {
  final AlbumDetail albumDetail;
  const CoverFlowAlbumSelectionScreen({
    super.key,
    required this.albumDetail,
  });

  @override
  ConsumerState createState() => _CoverFlowAlbumSelectionScreenState();
}

class _CoverFlowAlbumSelectionScreenState
    extends ConsumerState<CoverFlowAlbumSelectionScreen> with CustomScreen {
  @override
  int get maxScrollDownDisplayItems => 4;

  @override
  String get routeName => Routes.coverFlowSelection.name;

  @override
  List<Metadata> get displayItems => widget.albumDetail.albumSongs;

  @override
  Future<void> onSelectPressed() => _playSong(selectedDisplayItem);

  Future<void> _playSong(int index) async {
    setState(() => selectedDisplayItem = index);
    final originalSongIndex = displayItems[index].originalSongIndex;
    await ref
        .read(audioPlayerServiceProvider.notifier)
        .playSongAtOriginalIndex(originalSongIndex);

    if (mounted) {
      await context.pushNamed(Routes.nowPlaying.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    final int? currentlyPlayingOriginalIndex =
        ref.watch(currentSongMetadataProvider)?.originalSongIndex;
    return Hero(
      tag:
          "${widget.albumDetail.albumName}-${widget.albumDetail.albumArtistName}",
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: CupertinoColors.white,
              border: Border.all(),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppPalette.selectedTileGradientColor1,
                          AppPalette.selectedTileGradientColor2,
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.albumDetail.albumName,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: CupertinoColors.white,
                            ),
                            maxLines: 1,
                          ),
                          Text(
                            widget.albumDetail.albumArtistName,
                            style: const TextStyle(
                              fontSize: 16,
                              color: CupertinoColors.white,
                            ),
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: CupertinoScrollbar(
                    controller: scrollController,
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: displayItems.length,
                      itemBuilder: (context, index) =>
                          CoverFlowAlbumSongListTile(
                        songName: displayItems[index].getTrackName,
                        songDuration: Duration(
                          milliseconds: displayItems[index].getTrackDuration,
                        ),
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
          ),
        ),
      ),
    );
  }
}
