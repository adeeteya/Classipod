import 'package:classipod/core/custom_screen.dart';
import 'package:classipod/core/routes.dart';
import 'package:classipod/core/widgets/album_art_song_list_tile.dart';
import 'package:classipod/providers/music_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ArtistSongsScreen extends ConsumerStatefulWidget {
  final String artistName;
  const ArtistSongsScreen({super.key, required this.artistName});

  @override
  ConsumerState createState() => _ArtistSongsScreenState();
}

class _ArtistSongsScreenState extends ConsumerState<ArtistSongsScreen>
    with CustomScreen {
  @override
  double get displayTileHeight => 50;

  @override
  String get routeName => widget.artistName;

  @override
  List<int> get displayItems =>
      ref.read(musicProvider.notifier).fetchArtistSongs(widget.artistName);

  @override
  void onSelectPressed() {
    ref
        .read(musicProvider.notifier)
        .playAtIndex(displayItems[selectedDisplayItem]);
    context.pushNamed(Routes.nowPlaying.name);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoScrollbar(
        controller: scrollController,
        child: ListView.builder(
          controller: scrollController,
          itemCount: displayItems.length,
          itemBuilder: (context, index) => AlbumArtSongListTile(
            thumbnailPath: ref
                .read(musicProvider.notifier)
                .completeMusicFileMetaDataList[displayItems[index]]
                .thumbnailPath,
            songName: ref
                .read(musicProvider.notifier)
                .completeMusicFileMetaDataList[displayItems[index]]
                .trackName,
            trackArtistNames: ref
                .read(musicProvider.notifier)
                .completeMusicFileMetaDataList[displayItems[index]]
                .getTrackArtistNames,
            isSelected: selectedDisplayItem == index,
          ),
        ),
      ),
    );
  }
}
