import 'package:classipod/core/constants.dart';
import 'package:classipod/core/custom_screen.dart';
import 'package:classipod/core/routes.dart';
import 'package:classipod/core/widgets/cover_flow_album_song_list_tile.dart';
import 'package:classipod/models/cover_flow_album_details.dart';
import 'package:classipod/providers/music_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CoverFlowAlbumSelectionScreen extends ConsumerStatefulWidget {
  const CoverFlowAlbumSelectionScreen({super.key});

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
  List<CoverFlowAlbumDetails> get displayItems =>
      ref.read(musicProvider.notifier).coverFlowAlbumDetails;

  @override
  void onSelectPressed() {
    ref.read(musicProvider.notifier).playAtIndex(ref
        .read(musicProvider.notifier)
        .coverFlowAlbumDetails
        .elementAt(selectedDisplayItem)
        .songIndex);
    context.pushNamed(Routes.nowPlaying.name);
  }

  @override
  Widget build(BuildContext context) {
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
                        ref.read(musicProvider.notifier).albumName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: CupertinoColors.white,
                        ),
                        maxLines: 1,
                      ),
                      Text(
                        ref.read(musicProvider.notifier).artistName,
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
                  itemBuilder: (context, index) => CoverFlowAlbumSongListTile(
                    songName: displayItems[index].songName,
                    songDuration: Duration(
                        milliseconds: displayItems[index].trackDuration),
                    isSelected: selectedDisplayItem == index,
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
