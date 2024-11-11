import 'package:classipod/core/widgets/album_art_song_list_tile.dart';
import 'package:classipod/models/album_details.dart';
import 'package:classipod/providers/display_provider.dart';
import 'package:classipod/providers/music_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlbumsSelectionScreen extends ConsumerStatefulWidget {
  const AlbumsSelectionScreen({super.key});

  @override
  ConsumerState createState() => _AlbumsSelectionScreenState();
}

class _AlbumsSelectionScreenState extends ConsumerState<AlbumsSelectionScreen> {
  late final ScrollController _scrollController;
  late final List<AlbumDetails> albumDetails;

  @override
  void initState() {
    _scrollController = ScrollController(
        initialScrollOffset: ref.read(displayProvider).scrollOffset);
    albumDetails = ref.read(musicProvider.notifier).albumDetails;
    ref.listenManual(displayProvider.select((value) => value.scrollOffset),
        (previous, next) {
      _scrollController.jumpTo(next);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectedDisplayListItem = ref.watch(
        displayProvider.select((value) => value.selectedDisplayListItem));
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      child: CupertinoScrollbar(
        controller: _scrollController,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: albumDetails.length,
          itemBuilder: (context, index) => AlbumArtSongListTile(
            thumbnailPath: albumDetails[index].thumbnailPath,
            songName: albumDetails[index].albumName,
            trackArtistNames: albumDetails[index].albumArtistName,
            isSelected: index == selectedDisplayListItem,
          ),
        ),
      ),
    );
  }
}
