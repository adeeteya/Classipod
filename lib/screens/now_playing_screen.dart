import 'package:flutter/cupertino.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retropod/core/extensions.dart';
import 'package:retropod/core/widgets/box_progress_bar.dart';
import 'package:retropod/core/widgets/now_playing_page.dart';
import 'package:retropod/providers/music_provider.dart';

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
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
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
              Widget animatedWidget = (isVolumeChanging)
                  ? Row(
                      children: [
                        const Icon(CupertinoIcons.volume_down),
                        StreamBuilder<double>(
                            stream: ref
                                .read(musicProvider.notifier)
                                .getVolumeStream(),
                            builder: (context, snapshot) {
                              return BoxProgressBar(
                                max: 1.0,
                                value: snapshot.data ?? 0.0,
                              );
                            }),
                        const Icon(CupertinoIcons.volume_up),
                      ],
                    )
                  : StreamBuilder<Duration>(
                      stream:
                          ref.read(musicProvider.notifier).getPositionStream(),
                      builder: (context, snapshot) {
                        double totalDuration = (ref
                                    .read(musicProvider)
                                    .musicFilesMetaDataList[ref
                                        .read(musicProvider)
                                        .currentSongIndex]
                                    .trackDuration ??
                                1000) /
                            1000;
                        double currentDuration =
                            snapshot.data?.inSeconds.toDouble() ?? 0;

                        int elapsedTimeInMinutes = currentDuration ~/ 60;
                        int elapsedTimeInSeconds =
                            (currentDuration).toInt() % 60;

                        int remainingTimeInMinutes =
                            (totalDuration - currentDuration) ~/ 60;
                        int remainingTimeInSeconds =
                            (totalDuration - currentDuration).toInt() % 60;

                        return Row(
                          children: [
                            SizedBox(
                              width: 35,
                              child: Text(
                                "$elapsedTimeInMinutes:${elapsedTimeInSeconds < 10 ? "0$elapsedTimeInSeconds" : elapsedTimeInSeconds}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            BoxProgressBar(
                              max: totalDuration,
                              value: currentDuration,
                            ),
                            SizedBox(
                              width: 40,
                              child: Text(
                                "- $remainingTimeInMinutes:${remainingTimeInSeconds < 10 ? "0$remainingTimeInSeconds" : remainingTimeInSeconds}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );

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
