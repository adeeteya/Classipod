import 'package:classipod/core/constants.dart';
import 'package:classipod/core/widgets/cover_flow_album_song_list_tile.dart';
import 'package:classipod/models/cover_flow_album_details.dart';
import 'package:classipod/providers/display_provider.dart';
import 'package:classipod/providers/music_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoverFlowAlbumSelectionScreen extends ConsumerStatefulWidget {
  const CoverFlowAlbumSelectionScreen({super.key});

  @override
  ConsumerState createState() => _CoverFlowAlbumSelectionScreenState();
}

class _CoverFlowAlbumSelectionScreenState
    extends ConsumerState<CoverFlowAlbumSelectionScreen> {
  late final List<CoverFlowAlbumDetails> coverFlowAlbumDetails;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    coverFlowAlbumDetails =
        ref.read(musicProvider.notifier).coverFlowAlbumDetails;
    ref.listenManual(displayProvider, (previous, next) {
      _scrollController.jumpTo(next.scrollOffset);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int selectedDisplayListItem = ref.watch(
        displayProvider.select((value) => value.selectedDisplayListItem));

    return Padding(
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
                      primaryBlueGradientColor1,
                      primaryBlueGradientColor2
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
                        ref
                            .read(musicProvider.notifier)
                            .albumDetails[ref
                                .read(displayProvider.notifier)
                                .previousSelectedDisplayListItem]
                            .albumName,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: CupertinoColors.white),
                        maxLines: 1,
                      ),
                      Text(
                        ref
                            .read(musicProvider.notifier)
                            .albumDetails[ref
                                .read(displayProvider.notifier)
                                .previousSelectedDisplayListItem]
                            .albumArtistName,
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
                controller: _scrollController,
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: coverFlowAlbumDetails.length,
                  itemBuilder: (context, index) => CoverFlowAlbumSongListTile(
                    songName: coverFlowAlbumDetails[index].songName,
                    songDuration: Duration(
                        milliseconds:
                            coverFlowAlbumDetails[index].trackDuration),
                    isSelected: selectedDisplayListItem == index,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
