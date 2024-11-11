import 'package:classipod/core/widgets/album_reflective_art.dart';
import 'package:classipod/models/album_details.dart';
import 'package:classipod/models/display_details.dart';
import 'package:classipod/providers/display_provider.dart';
import 'package:classipod/providers/music_provider.dart';
import 'package:classipod/screens/music_screens/cover_flow_album_selection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoverFlowScreen extends ConsumerStatefulWidget {
  const CoverFlowScreen({super.key});

  @override
  ConsumerState createState() => _CoverFlowScreenState();
}

class _CoverFlowScreenState extends ConsumerState<CoverFlowScreen> {
  late final PageController _pageController;
  late final List<AlbumDetails> albumDetails;
  double currentPage = 0.0;
  bool isCoverFlowSongSelection = false;

  @override
  void initState() {
    _pageController = PageController(
      viewportFraction: 0.58,
    );
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page ?? currentPage;
      });
    });
    albumDetails = ref.read(musicProvider.notifier).albumDetails;
    ref.listenManual(displayProvider, (previous, next) {
      if (next.displayScreenType == DisplayScreenType.coverFlow) {
        setState(() {
          isCoverFlowSongSelection = false;
        });
        _pageController.animateToPage(next.selectedDisplayListItem,
            duration: const Duration(milliseconds: 300), curve: Curves.ease);
        albumDetails[next.selectedDisplayListItem].albumName;
        albumDetails[next.selectedDisplayListItem].albumArtistName;
      } else if (next.displayScreenType ==
          DisplayScreenType.coverFlowAlbumSelection) {
        setState(() {
          isCoverFlowSongSelection = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int selectedDisplayListItem = ref.watch(
        displayProvider.select((value) => value.selectedDisplayListItem));

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 10),
              Flexible(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: albumDetails.length,
                  itemBuilder: (context, index) {
                    double relativePosition = index - currentPage;
                    return Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.003)
                        ..scale(
                            (1 - relativePosition.abs()).clamp(0.2, 0.6) + 0.4)
                        ..rotateY(relativePosition),
                      alignment: relativePosition >= 0
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: AlbumReflectiveArt(
                        thumbnailPath: albumDetails[index].thumbnailPath,
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  albumDetails[selectedDisplayListItem].albumName,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  albumDetails[selectedDisplayListItem].albumArtistName,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
          if (isCoverFlowSongSelection) const CoverFlowAlbumSelectionScreen(),
        ],
      ),
    );
  }
}
