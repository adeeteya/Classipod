import 'dart:async';

import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/models/metadata.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/core/widgets/empty_state_widget.dart';
import 'package:classipod/features/custom_screen_widgets/custom_page_screen.dart';
import 'package:classipod/features/device/services/device_buttons_service_provider.dart';
import 'package:classipod/features/now_playing/provider/now_playing_provider.dart';
import 'package:classipod/features/now_playing/widgets/now_playing_bottom_bar.dart';
import 'package:classipod/features/now_playing/widgets/now_playing_page.dart';
import 'package:classipod/features/now_playing/widgets/volume_bar.dart';
import 'package:classipod/features/status_bar/widgets/status_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum _NowPlayingBottomBarPage {
  seekBar,
  scrubberBar,
}

class NowPlayingScreen extends ConsumerStatefulWidget {
  const NowPlayingScreen({super.key});

  @override
  ConsumerState createState() => _NowPlayingScreenState();
}

class _NowPlayingScreenState extends ConsumerState<NowPlayingScreen>
    with CustomPageScreen {
  final PageController _bottomBarPageController = PageController();
  late Timer _longPressTimer;
  Timer _lastVolumeChangeTimer = Timer(Duration.zero, () {});
  bool _isVolumeChanging = false;
  _NowPlayingBottomBarPage _bottomBarPage = _NowPlayingBottomBarPage.seekBar;

  @override
  String get routeName => Routes.nowPlaying.name;

  @override
  int get initialPage => ref.read(audioPlayerProvider).currentIndex ?? 0;

  @override
  List<Metadata> get displayItems => ref.read(nowPlayingMetadataListProvider);

  @override
  Future<void> onSelectPressed() async {
    if (_bottomBarPage == _NowPlayingBottomBarPage.seekBar) {
      await _bottomBarPageController.animateToPage(
        1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      setState(() {
        _bottomBarPage = _NowPlayingBottomBarPage.scrubberBar;
      });
    } else {
      await _bottomBarPageController.animateToPage(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      setState(() {
        _bottomBarPage = _NowPlayingBottomBarPage.seekBar;
      });
    }
  }

  @override
  void onSelectLongPress() {
    context.goNamed(Routes.nowPlayingMoreOptions.name);
  }

  void startVolumeTimer() {
    if (_lastVolumeChangeTimer.isActive) {
      _lastVolumeChangeTimer.cancel();
    }
    _lastVolumeChangeTimer =
        Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timer.tick >= 3) {
        setState(() {
          _isVolumeChanging = false;
        });
        timer.cancel();
      }
    });
  }

  @override
  Future<void> rotateForward() async {
    if (_bottomBarPage == _NowPlayingBottomBarPage.scrubberBar) {
      await ref.read(audioPlayerServiceProvider.notifier).seekForward();
      return;
    }
    setState(() {
      _isVolumeChanging = true;
    });
    await ref.read(audioPlayerServiceProvider.notifier).increaseVolume();
    startVolumeTimer();
  }

  @override
  Future<void> rotateBackward() async {
    if (_bottomBarPage == _NowPlayingBottomBarPage.scrubberBar) {
      await ref.read(audioPlayerServiceProvider.notifier).seekBackward();
      return;
    }
    setState(() {
      _isVolumeChanging = true;
    });
    await ref.read(audioPlayerServiceProvider.notifier).decreaseVolume();
    startVolumeTimer();
  }

  @override
  Future<void> seekForward() async {
    await ref.read(audioPlayerServiceProvider.notifier).nextSong();
  }

  @override
  Future<void> seekBackward() async {
    await ref.read(audioPlayerServiceProvider.notifier).seekBackwards();
  }

  @override
  void seekForwardLongPress() {
    _longPressTimer =
        Timer.periodic(const Duration(milliseconds: 50), (_) async {
      await ref.read(audioPlayerServiceProvider.notifier).seekForward();
    });
  }

  @override
  void seekBackwardLongPress() {
    _longPressTimer =
        Timer.periodic(const Duration(milliseconds: 50), (_) async {
      await ref.read(audioPlayerServiceProvider.notifier).seekBackward();
    });
  }

  @override
  void onLongPressEnd() {
    if (_longPressTimer.isActive) {
      _longPressTimer.cancel();
      ref.read(deviceButtonsServiceProvider.notifier).resetDeviceAction();
    }
  }

  @override
  void dispose() {
    _lastVolumeChangeTimer.cancel();
    _bottomBarPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (displayItems.isEmpty) {
      return CupertinoPageScaffold(
        child: Column(
          children: [
            StatusBar(title: Routes.nowPlaying.title(context)),
            Expanded(
              child: EmptyStateWidget(
                emptyDescription: context.localization.noMusicFilesFound,
              ),
            ),
          ],
        ),
      );
    }

    ref.listen(currentAudioPlayerIndexStreamProvider, (previous, next) async {
      if (next is AsyncData) {
        final nextPage = next.value ?? 0;
        final previousPage = previous?.value ?? 0;
        if ((nextPage - previousPage).abs() > 10) {
          pageController.jumpToPage(nextPage);
        } else if (nextPage - previousPage != 0) {
          await pageController.animateToPage(
            nextPage,
            duration: const Duration(milliseconds: 1000),
            curve: Curves.ease,
          );
        }
      }
    });

    final size = MediaQuery.sizeOf(context);
    late final double verticalPadding;
    if (size.height < 800) {
      verticalPadding = 10;
    } else {
      verticalPadding = 20;
    }

    return CupertinoPageScaffold(
      child: Column(
        children: [
          StatusBar(
            title: Routes.nowPlaying.title(context),
          ),
          Flexible(
            child: Padding(
              padding:
                  EdgeInsets.fromLTRB(10, verticalPadding, 10, verticalPadding),
              child: Column(
                children: [
                  Flexible(
                    flex: 7,
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: displayItems.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => NowPlayingPage(
                        songMetadata: displayItems[index],
                        currentTrackNumber: index + 1,
                        totalTrackNumber: displayItems.length,
                      ),
                    ),
                  ),
                  Flexible(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder: (child, animation) {
                        final begin =
                            Offset(_isVolumeChanging ? 1.0 : -0.5, 0.0);
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
                      child: _isVolumeChanging
                          ? const VolumeBar()
                          : PageView(
                              controller: _bottomBarPageController,
                              physics: const NeverScrollableScrollPhysics(),
                              children: const [
                                NowPlayingBottomBar(),
                                NowPlayingBottomBar(showScrubber: true),
                              ],
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
