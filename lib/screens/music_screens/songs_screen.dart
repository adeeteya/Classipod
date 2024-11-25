import 'package:classipod/core/widgets/song_list_tile.dart';
import 'package:classipod/models/metadata.dart';
import 'package:classipod/providers/display_provider.dart';
import 'package:classipod/providers/music_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SongsScreen extends ConsumerStatefulWidget {
  const SongsScreen({super.key});

  @override
  ConsumerState createState() => _SongsScreenState();
}

class _SongsScreenState extends ConsumerState<SongsScreen> {
  late final ScrollController _scrollController;
  late final List<Metadata> musicFilesMetaDataList;

  @override
  void initState() {
    _scrollController = ScrollController(
        initialScrollOffset: ref.read(displayProvider).scrollOffset);
    musicFilesMetaDataList =
        ref.read(musicProvider.notifier).completeMusicFileMetaDataList;
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

    if (musicFilesMetaDataList.isEmpty) {
      return const CupertinoPageScaffold(
        backgroundColor: CupertinoColors.white,
        child: Center(
          child: Text("No Music Files Present from the Selected Directory☹️"),
        ),
      );
    }

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      child: CupertinoScrollbar(
        controller: _scrollController,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: musicFilesMetaDataList.length,
          itemBuilder: (context, index) => SongListTile(
            songName: musicFilesMetaDataList[index].trackName,
            trackArtistNames: musicFilesMetaDataList[index].getTrackArtistNames,
            isSelected: selectedDisplayListItem == index,
          ),
        ),
      ),
    );
  }
}
