import 'package:classipod/core/custom_screen.dart';
import 'package:classipod/core/routes.dart';
import 'package:classipod/core/widgets/album_art_song_list_tile.dart';
import 'package:classipod/models/album_details.dart';
import 'package:classipod/providers/music_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AlbumsSelectionScreen extends ConsumerStatefulWidget {
  const AlbumsSelectionScreen({super.key});

  @override
  ConsumerState createState() => _AlbumsSelectionScreenState();
}

class _AlbumsSelectionScreenState extends ConsumerState<AlbumsSelectionScreen>
    with CustomScreen {
  @override
  double get displayTileHeight => 50;

  @override
  String get routeName => Routes.albums.name;

  @override
  List<AlbumDetails> get displayItems =>
      ref.read(musicProvider.notifier).albumDetails;

  @override
  void onSelectPressed() {
    ref.read(musicProvider.notifier).playAlbum(
          ref
              .read(musicProvider.notifier)
              .albumNames
              .elementAt(selectedDisplayItem),
        );
    context.pushNamed(Routes.nowPlaying.name);
  }

  @override
  Widget build(BuildContext context) {
    if (displayItems.isEmpty) {
      return const CupertinoPageScaffold(
        backgroundColor: CupertinoColors.white,
        child: Center(
          child: Text("No Music Files Present from the Selected Directory☹️"),
        ),
      );
    }

    return CupertinoPageScaffold(
      child: CupertinoScrollbar(
        controller: scrollController,
        child: ListView.builder(
          controller: scrollController,
          itemCount: displayItems.length,
          itemBuilder: (context, index) => AlbumArtSongListTile(
            thumbnailPath: displayItems[index].thumbnailPath,
            songName: displayItems[index].albumName,
            trackArtistNames: displayItems[index].albumArtistName,
            isSelected: selectedDisplayItem == index,
          ),
        ),
      ),
    );
  }
}
