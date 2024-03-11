import 'package:flutter/cupertino.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retropod/core/extensions.dart';
import 'package:retropod/providers/music_provider.dart';

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
      viewportFraction: 0.6,
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
          const SizedBox(height: 20),
          Flexible(
            child: PageView.builder(
              controller: _pageController,
              itemCount: musicFilesMetaDataList.length,
              itemBuilder: (context, index) {
                double relativePosition = index - currentPage;
                return SizedBox(
                  width: 250,
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.003)
                      ..scale(
                          (1 - relativePosition.abs()).clamp(0.2, 0.6) + 0.4)
                      ..rotateY(relativePosition),
                    alignment: relativePosition >= 0
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: (musicFilesMetaDataList[index].albumArt != null)
                        ? Image.memory(musicFilesMetaDataList[index].albumArt!)
                        : Image.asset("assets/images/default_album_cover.jpeg"),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
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
        ],
      ),
    );
  }
}
