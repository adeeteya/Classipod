import 'package:flutter/cupertino.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retropod/core/extensions.dart';
import 'package:retropod/core/widgets/song_list_tile.dart';
import 'package:retropod/providers/display_provider.dart';
import 'package:retropod/providers/music_provider.dart';

class SongsScreen extends ConsumerStatefulWidget {
  const SongsScreen({super.key});

  @override
  ConsumerState createState() => _SongsScreenState();
}

class _SongsScreenState extends ConsumerState<SongsScreen> {
  final ScrollController _scrollController = ScrollController();
  late final List<Metadata> musicFilesMetaDataList;

  @override
  void initState() {
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
    return CupertinoScrollbar(
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
    );
  }
}
