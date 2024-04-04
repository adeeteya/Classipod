import 'package:classipod/core/extensions.dart';
import 'package:classipod/core/widgets/now_playing_page.dart';
import 'package:classipod/core/widgets/seek_bar.dart';
import 'package:classipod/core/widgets/volume_bar.dart';
import 'package:classipod/providers/music_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NowPlayingScreen extends ConsumerStatefulWidget {
  const NowPlayingScreen({super.key});

  @override
  ConsumerState createState() => _NowPlayingScreenState();
}

class _NowPlayingScreenState extends ConsumerState<NowPlayingScreen> {
  late final PageController _pageController;
  late final List<Metadata> musicFilesMetaDataList;

  @override
  void initState() {
    musicFilesMetaDataList = ref.read(musicProvider).musicFilesMetaDataList;
    _pageController =
        PageController(initialPage: ref.read(musicProvider).currentSongIndex);
    ref.listenManual(musicProvider.select((value) => value.currentSongIndex),
        (previous, next) {
      _pageController.animateToPage(next,
          duration: const Duration(milliseconds: 1000), curve: Curves.easeOut);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 40, 10, 30),
        child: Column(
          children: [
            Flexible(
              child: PageView.builder(
                controller: _pageController,
                itemCount: musicFilesMetaDataList.length,
                itemBuilder: (context, index) => NowPlayingPage(
                  albumArt: musicFilesMetaDataList[index].albumArt,
                  trackName: musicFilesMetaDataList[index].trackName,
                  artistNames:
                      musicFilesMetaDataList[index].getTrackArtistNames,
                  albumName: musicFilesMetaDataList[index].albumName,
                  currentTrackNumber: index + 1,
                  totalTrackNumber: musicFilesMetaDataList.length,
                ),
              ),
            ),
            Consumer(builder: (context, ref, _) {
              bool isVolumeChanging = ref.watch(
                  musicProvider.select((value) => value.isVolumeChanging));
              Widget animatedWidget =
                  (isVolumeChanging) ? const VolumeBar() : const SeekBar();

              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  final begin = Offset((isVolumeChanging) ? 1.0 : -0.5, 0.0);
                  final tween = Tween(begin: begin, end: Offset.zero);
                  final offsetAnimation = animation.drive(tween);

                  return FadeTransition(
                    key: ValueKey<Key?>(child.key),
                    opacity: animation,
                    child: SlideTransition(
                      key: ValueKey<Key?>(child.key),
                      position: offsetAnimation,
                      child: child,
                    ),
                  );
                },
                child: animatedWidget,
              );
            }),
          ],
        ),
      ),
    );
  }
}
