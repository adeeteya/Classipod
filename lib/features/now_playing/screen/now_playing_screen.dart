import 'dart:async';

import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/extensions/go_router_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/core/widgets/empty_state_widget.dart';
import 'package:classipod/features/device/models/device_action.dart';
import 'package:classipod/features/device/services/device_buttons_service_provider.dart';
import 'package:classipod/features/now_playing/provider/now_playing_details_provider.dart';
import 'package:classipod/features/now_playing/widgets/now_playing_bottom_bar.dart';
import 'package:classipod/features/now_playing/widgets/now_playing_page.dart';
import 'package:classipod/features/now_playing/widgets/rating_bar.dart';
import 'package:classipod/features/now_playing/widgets/shuffle_segmented_control.dart';
import 'package:classipod/features/now_playing/widgets/volume_bar.dart';
import 'package:classipod/features/status_bar/widgets/status_bar.dart';
import 'package:classipod/features/tutorial/controller/tutorial_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';

enum _NowPlayingBottomBarPage {
  seekBar,
  scrubberBar,
  volumeBar,
  shuffleBar,
  ratingBar,
}

class NowPlayingScreen extends ConsumerStatefulWidget {
  const NowPlayingScreen({super.key});

  @override
  ConsumerState createState() => _NowPlayingScreenState();
}

class _NowPlayingScreenState extends ConsumerState<NowPlayingScreen> {
  final PageController _bottomBarPageController = PageController();
  late Timer _longPressTimer;
  Timer _lastVolumeChangeTimer = Timer(Duration.zero, () {});
  bool _isShuffleEnabled = false;
  _NowPlayingBottomBarPage _bottomBarPage = _NowPlayingBottomBarPage.seekBar;

  String get routeName => Routes.nowPlaying.name;

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
    } else if (_bottomBarPage == _NowPlayingBottomBarPage.scrubberBar) {
      await _bottomBarPageController.animateToPage(
        2,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      setState(() {
        _bottomBarPage = _NowPlayingBottomBarPage.shuffleBar;
      });
    } else if (_bottomBarPage == _NowPlayingBottomBarPage.shuffleBar) {
      await ref
          .read(audioPlayerServiceProvider.notifier)
          .setShuffleMode(_isShuffleEnabled);
      await _bottomBarPageController.animateToPage(
        3,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      setState(() {
        _bottomBarPage = _NowPlayingBottomBarPage.ratingBar;
      });
    } else if (_bottomBarPage == _NowPlayingBottomBarPage.ratingBar) {
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

  void onSelectLongPress() {
    unawaited(context.pushNamed(Routes.nowPlayingMoreOptions.name));
  }

  void startVolumeTimer() {
    if (_lastVolumeChangeTimer.isActive) {
      _lastVolumeChangeTimer.cancel();
    }
    _lastVolumeChangeTimer = Timer.periodic(const Duration(seconds: 1), (
      timer,
    ) {
      if (timer.tick >= 3) {
        setState(() {
          _bottomBarPage = _NowPlayingBottomBarPage.seekBar;
        });
        timer.cancel();
      }
    });
  }

  Future<void> rotateForward() async {
    if (_bottomBarPage == _NowPlayingBottomBarPage.scrubberBar) {
      await ref.read(audioPlayerServiceProvider.notifier).seekForward();
      return;
    } else if (_bottomBarPage == _NowPlayingBottomBarPage.shuffleBar) {
      setState(() {
        _isShuffleEnabled = true;
      });
      return;
    } else if (_bottomBarPage == _NowPlayingBottomBarPage.ratingBar) {
      await ref
          .read(nowPlayingDetailsProvider.notifier)
          .increaseCurrentMetadataRating();
      return;
    }
    setState(() {
      _bottomBarPage = _NowPlayingBottomBarPage.volumeBar;
    });
    await ref.read(audioPlayerServiceProvider.notifier).increaseVolume();
    startVolumeTimer();
  }

  Future<void> rotateBackward() async {
    if (_bottomBarPage == _NowPlayingBottomBarPage.scrubberBar) {
      await ref.read(audioPlayerServiceProvider.notifier).seekBackward();
      return;
    } else if (_bottomBarPage == _NowPlayingBottomBarPage.shuffleBar) {
      setState(() {
        _isShuffleEnabled = false;
      });
      return;
    } else if (_bottomBarPage == _NowPlayingBottomBarPage.ratingBar) {
      await ref
          .read(nowPlayingDetailsProvider.notifier)
          .decreaseCurrentMetadataRating();
      return;
    }
    setState(() {
      _bottomBarPage = _NowPlayingBottomBarPage.volumeBar;
    });
    await ref.read(audioPlayerServiceProvider.notifier).decreaseVolume();
    startVolumeTimer();
  }

  Future<void> seekForward() async {
    await ref.read(audioPlayerServiceProvider.notifier).nextSong();
  }

  Future<void> seekBackward() async {
    await ref.read(audioPlayerServiceProvider.notifier).seekBackwards();
  }

  void seekForwardLongPress() {
    _longPressTimer = Timer.periodic(const Duration(milliseconds: 50), (
      _,
    ) async {
      await ref.read(audioPlayerServiceProvider.notifier).seekForward();
    });
  }

  void seekBackwardLongPress() {
    _longPressTimer = Timer.periodic(const Duration(milliseconds: 50), (
      _,
    ) async {
      await ref.read(audioPlayerServiceProvider.notifier).seekBackward();
    });
  }

  void onLongPressEnd() {
    if (_longPressTimer.isActive) {
      _longPressTimer.cancel();
      ref.read(deviceButtonsServiceProvider.notifier).resetDeviceAction();
    }
  }

  void onMenuButtonPressed() {
    context.pop();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(tutorialControllerProvider.notifier).playNowPlayingTutorial();
    });
  }

  @override
  void dispose() {
    _lastVolumeChangeTimer.cancel();
    _bottomBarPageController.dispose();
    super.dispose();
  }

  Future<void> deviceControlHandler(_, DeviceAction? newState) async {
    if (newState == null || context.router.locationNamed != routeName) {
      return;
    }
    switch (newState) {
      case DeviceAction.menu:
        onMenuButtonPressed();
        break;
      case DeviceAction.select:
        await onSelectPressed();
        break;
      case DeviceAction.selectLongPress:
        onSelectLongPress();
        break;
      case DeviceAction.rotateForward:
        await rotateForward();
        break;
      case DeviceAction.rotateBackward:
        await rotateBackward();
        break;
      case DeviceAction.seekForward:
        await seekForward();
        break;
      case DeviceAction.seekBackward:
        await seekBackward();
        break;
      case DeviceAction.seekForwardLongPress:
        seekForwardLongPress();
        break;
      case DeviceAction.seekBackwardLongPress:
        seekBackwardLongPress();
        break;
      case DeviceAction.playPause:
        break;
      case DeviceAction.longPressEnd:
        onLongPressEnd();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingDetails = ref.watch(nowPlayingDetailsProvider);

    ref.listen(deviceButtonsServiceProvider, deviceControlHandler);

    if (nowPlayingDetails.metadataList.isEmpty) {
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

    return CupertinoPageScaffold(
      child: Column(
        children: [
          StatusBar(title: Routes.nowPlaying.title(context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (nowPlayingDetails.isShuffleEnabled)
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(
                    CupertinoIcons.shuffle,
                    size: 20,
                    color: CupertinoColors.black,
                  ),
                ),
              if (nowPlayingDetails.loopMode != LoopMode.off)
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(
                    (nowPlayingDetails.loopMode == LoopMode.all)
                        ? CupertinoIcons.repeat
                        : CupertinoIcons.repeat_1,
                    size: 20,
                    color: CupertinoColors.black,
                  ),
                ),
              if (!nowPlayingDetails.isShuffleEnabled &&
                  nowPlayingDetails.loopMode == LoopMode.off)
                const SizedBox(height: 20),
            ],
          ),
          Expanded(
            child: GestureDetector(
              onTap: onSelectPressed,
              onLongPress: onSelectLongPress,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: NowPlayingWidget(nowPlayingDetails: nowPlayingDetails),
              ),
            ),
          ),
          SizedBox(
            height: 30,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  final begin = Offset(
                    _bottomBarPage == _NowPlayingBottomBarPage.volumeBar
                        ? 1.0
                        : -0.5,
                    0.0,
                  );
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
                child:
                    _bottomBarPage == _NowPlayingBottomBarPage.volumeBar
                        ? const VolumeBar()
                        : PageView(
                          controller: _bottomBarPageController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            const NowPlayingBottomBar(),
                            const NowPlayingBottomBar(showScrubber: true),
                            ShuffleSegmentedControl(
                              isShuffleEnabled: _isShuffleEnabled,
                              onValueChanged: (value) {
                                setState(() {
                                  _isShuffleEnabled =
                                      value ?? _isShuffleEnabled;
                                });
                              },
                            ),
                            RatingBar(
                              currentRating:
                                  nowPlayingDetails.currentMetadata?.rating ??
                                  0,
                              onRatingClicked: (val) async {
                                await ref
                                    .read(nowPlayingDetailsProvider.notifier)
                                    .setCurrentMetadataRating(val ?? 0);
                              },
                            ),
                          ],
                        ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
