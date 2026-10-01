import 'dart:async';

import 'package:classipod/core/extensions/go_router_extensions.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/core/widgets/fast_scroll_indicator.dart';
import 'package:classipod/features/custom_screen_elements/custom_screen.dart';
import 'package:classipod/features/music/album/models/album_model.dart';
import 'package:classipod/features/music/songs/widgets/condensed_song_list_tile.dart';
import 'package:classipod/features/music/songs/widgets/song_list_tile.dart';
import 'package:classipod/features/now_playing/provider/now_playing_details_provider.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AlbumSongsScreen extends ConsumerStatefulWidget {
  final AlbumModel albumDetail;
  final bool showArtistNames;
  final String? routeName;

  const AlbumSongsScreen({
    super.key,
    required this.albumDetail,
    this.showArtistNames = false,
    this.routeName,
  });

  @override
  ConsumerState createState() => _AlbumSongsScreenState();
}

class _AlbumSongsScreenState extends ConsumerState<AlbumSongsScreen>
    with CustomScreen {
  @override
  double get displayTileHeight => widget.showArtistNames ? 54 : 30;

  @override
  String get routeName => widget.routeName ?? Routes.albumSongs.name;

  @override
  List<MusicMetadata> get displayItems => widget.albumDetail.albumSongs;

  @override
  Future<void> onSelectPressed() => _playSongFromAlbum(selectedDisplayItem);

  Future<void> _playSongFromAlbum(int index) async {
    setState(() => selectedDisplayItem = index);
    await ref
        .read(audioPlayerServiceProvider.notifier)
        .playAlbum(albumDetail: widget.albumDetail, songIndex: index);

    if (mounted) {
      await context.openUniqueNamed(Routes.nowPlaying.name);
    }
  }

  @override
  Future<void> onSelectLongPress() async {
    await context.pushNamed(
      Routes.albumSongsMoreOptions.name,
      extra: displayItems[selectedDisplayItem],
    );
  }

  @override
  Widget build(BuildContext context) {
    final String? currentlyPlayingOriginalIndex = ref
        .watch(nowPlayingDetailsProvider.select((e) => e.currentMetadata))
        ?.identity;
    return CupertinoPageScaffold(
      child: Column(
        children: [
          Flexible(
            child: FastScrollIndicator(
              wheelScrollIndex: wheelScrollIndex,
              itemCount: displayItems.length,
              itemExtent: displayTileHeight,
              labelAt: (index) => displayItems[index].getTrackName,
              child: CupertinoScrollbar(
                controller: scrollController,
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: displayItems.length,
                  itemExtent: displayTileHeight,
                  itemBuilder: (context, index) {
                    if (widget.showArtistNames) {
                      return SongListTile(
                        songName: displayItems[index].getTrackName,
                        trackArtistNames:
                            displayItems[index].getTrackArtistNames,
                        isSelected: selectedDisplayItem == index,
                        isCurrentlyPlaying:
                            currentlyPlayingOriginalIndex ==
                            displayItems[index].identity,
                        onTap: () async => _playSongFromAlbum(index),
                        onLongPress: () {
                          setState(() => selectedDisplayItem = index);
                          unawaited(onSelectLongPress());
                        },
                      );
                    }
                    return CondensedSongListTile(
                      songName: displayItems[index].getTrackName,
                      isSelected: selectedDisplayItem == index,
                      isCurrentlyPlaying:
                          currentlyPlayingOriginalIndex ==
                          displayItems[index].identity,
                      onTap: () async => _playSongFromAlbum(index),
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
