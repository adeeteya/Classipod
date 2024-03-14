import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retropod/core/extensions.dart';
import 'package:retropod/core/widgets/album_art_song_list_tile.dart';
import 'package:retropod/providers/display_provider.dart';
import 'package:retropod/providers/music_provider.dart';

class ArtistSongsScreen extends ConsumerStatefulWidget {
  final String artistName;
  const ArtistSongsScreen({super.key, required this.artistName});

  @override
  ConsumerState createState() => _ArtistSongsScreenState();
}

class _ArtistSongsScreenState extends ConsumerState<ArtistSongsScreen> {
  final ScrollController _scrollController = ScrollController();
  late final List<int> artistSongsIndexes;

  @override
  void initState() {
    ref.read(musicProvider.notifier).fetchArtistSongs(widget.artistName);
    artistSongsIndexes = ref.read(musicProvider.notifier).artistSongsIndexes;
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
          itemCount: artistSongsIndexes.length,
          itemBuilder: (context, index) => AlbumArtSongListTile(
            albumArt: ref
                .read(musicProvider.notifier)
                .completeMusicFileMetaDataList[artistSongsIndexes[index]]
                .albumArt,
            songName: ref
                .read(musicProvider.notifier)
                .completeMusicFileMetaDataList[artistSongsIndexes[index]]
                .trackName,
            trackArtistNames: ref
                .read(musicProvider.notifier)
                .completeMusicFileMetaDataList[artistSongsIndexes[index]]
                .getTrackArtistNames,
            isSelected: selectedDisplayListItem == index,
          ),
        ),
      ),
    );
  }
}
