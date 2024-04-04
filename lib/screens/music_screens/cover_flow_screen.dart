import 'package:classipod/core/extensions.dart';
import 'package:classipod/core/widgets/album_reflective_art.dart';
import 'package:classipod/providers/music_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoverFlowScreen extends ConsumerStatefulWidget {
  const CoverFlowScreen({super.key});

  @override
  ConsumerState createState() => _CoverFlowScreenState();
}

class _CoverFlowScreenState extends ConsumerState<CoverFlowScreen> {
  late final PageController _pageController;
  double currentPage = 0.0;
  late final List<Metadata> musicFilesMetaDataList;

  @override
  void initState() {
    musicFilesMetaDataList = ref.read(musicProvider).musicFilesMetaDataList;
    currentPage = ref.read(musicProvider).currentSongIndex.toDouble();
    _pageController = PageController(
      initialPage: currentPage.toInt(),
      viewportFraction: 0.58,
    );
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page ?? currentPage;
      });
    });
    ref.listenManual(musicProvider.select((value) => value.currentSongIndex),
        (previous, next) {
      _pageController.animateToPage(next,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int currentSongIndex =
        ref.watch(musicProvider.select((value) => value.currentSongIndex));
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      child: Column(
        children: [
          const SizedBox(height: 10),
          Flexible(
            child: PageView.builder(
              controller: _pageController,
              itemCount: musicFilesMetaDataList.length,
              itemBuilder: (context, index) {
                double relativePosition = index - currentPage;
                return Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.003)
                    ..scale((1 - relativePosition.abs()).clamp(0.2, 0.6) + 0.4)
                    ..rotateY(relativePosition),
                  alignment: relativePosition >= 0
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: AlbumReflectiveArt(
                    albumArt: musicFilesMetaDataList[index].albumArt,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              musicFilesMetaDataList[currentSongIndex].trackName ??
                  "Unknown Track",
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
              musicFilesMetaDataList[currentSongIndex].getTrackArtistNames,
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
    );
  }
}
