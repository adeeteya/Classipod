import 'dart:async';

import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/extensions/go_router_extensions.dart';
import 'package:classipod/core/models/playback_shuffle_mode.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/core/widgets/empty_state_widget.dart';
import 'package:classipod/core/widgets/subtle_reflection.dart';
import 'package:classipod/features/device/models/device_action.dart';
import 'package:classipod/features/device/services/device_buttons_service_provider.dart';
import 'package:classipod/features/now_playing/provider/now_playing_details_provider.dart';
import 'package:classipod/features/now_playing/widgets/lyrics_view.dart';
import 'package:classipod/features/now_playing/widgets/now_playing_bottom_bar.dart';
import 'package:classipod/features/now_playing/widgets/now_playing_widget.dart';
import 'package:classipod/features/now_playing/widgets/rating_bar.dart';
import 'package:classipod/features/now_playing/widgets/shuffle_segmented_control.dart';
import 'package:classipod/features/now_playing/widgets/volume_bar.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:classipod/features/tutorial/controller/tutorial_controller.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';

enum _NowPlayingBottomBarPage {
  seekBar,
  scrubberBar,
  volumeBar,
  ratingBar,
  shuffleBar,
  lyrics,
}

class NowPlayingScreen extends ConsumerStatefulWidget {
  const NowPlayingScreen({super.key});

  @override
  ConsumerState createState() => _NowPlayingScreenState();
}

class _NowPlayingScreenState extends ConsumerState<NowPlayingScreen> {
  final PageController _bottomBarPageController = PageController();
  final ScrollController _lyricsScrollController = ScrollController();
  Timer? _longPressTimer;
  Timer? _barInactivityTimer;
  PlaybackShuffleMode _shuffleMode = PlaybackShuffleMode.off;
  _NowPlayingBottomBarPage _bottomBarPage = _NowPlayingBottomBarPage.seekBar;
  String? _lastLyricsSongIndex;
  Future<void>? _progressReturnTransition;
  int? _progressReturnPage;
  int _activeInputs = 0;

  String get routeName => Routes.nowPlaying.name;

  Future<void> onSelectPressed() async {
    final String? lyrics = ref
        .read(nowPlayingDetailsProvider)
        .currentMetadata
        ?.lyrics;
    final bool hasLyrics = lyrics != null && lyrics.trim().isNotEmpty;

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
        _bottomBarPage = _NowPlayingBottomBarPage.ratingBar;
      });
    } else if (_bottomBarPage == _NowPlayingBottomBarPage.ratingBar) {
      await _bottomBarPageController.animateToPage(
        3,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      setState(() {
        _shuffleMode = ref.read(nowPlayingDetailsProvider).shuffleMode;
        _bottomBarPage = _NowPlayingBottomBarPage.shuffleBar;
      });
    } else if (_bottomBarPage == _NowPlayingBottomBarPage.shuffleBar) {
      await ref
          .read(audioPlayerServiceProvider.notifier)
          .setShuffleMode(_shuffleMode);
      if (hasLyrics) {
        await _bottomBarPageController.animateToPage(
          4,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
        setState(() {
          _bottomBarPage = _NowPlayingBottomBarPage.lyrics;
        });
      } else {
        await _bottomBarPageController.animateToPage(
          4,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
        _bottomBarPageController.jumpToPage(0);
        setState(() {
          _bottomBarPage = _NowPlayingBottomBarPage.seekBar;
        });
      }
    } else if (_bottomBarPage == _NowPlayingBottomBarPage.lyrics) {
      await _bottomBarPageController.animateToPage(
        5,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      _bottomBarPageController.jumpToPage(0);
      setState(() {
        _bottomBarPage = _NowPlayingBottomBarPage.seekBar;
      });
    }
  }

  void onSelectLongPress() {
    unawaited(context.pushNamed(Routes.nowPlayingMoreOptions.name));
  }

  Future<void> scrollLyrics(double offsetChange) async {
    if (!_lyricsScrollController.hasClients) {
      return;
    }

    final ScrollPosition position = _lyricsScrollController.position;
    final double targetOffset = (position.pixels + offsetChange).clamp(
      position.minScrollExtent,
      position.maxScrollExtent,
    );

    if (targetOffset == position.pixels) {
      return;
    }

    await _lyricsScrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }

  Future<void> showVolumeBar() async {
    await _progressReturnTransition;
    if (!mounted || _bottomBarPage == _NowPlayingBottomBarPage.volumeBar) {
      return;
    }
    setState(() {
      _bottomBarPage = _NowPlayingBottomBarPage.volumeBar;
    });
    await WidgetsBinding.instance.endOfFrame;
    if (!mounted || !_bottomBarPageController.hasClients) {
      return;
    }
    await _bottomBarPageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  Future<void> returnToProgressBar() async {
    if (!mounted || !_bottomBarPageController.hasClients) {
      return;
    }
    if (_bottomBarPage == _NowPlayingBottomBarPage.shuffleBar) {
      await ref
          .read(audioPlayerServiceProvider.notifier)
          .setShuffleMode(_shuffleMode);
      if (!mounted || !_bottomBarPageController.hasClients) {
        return;
      }
    }
    final nextPage = _bottomBarPageController.page!.round() + 1;
    setState(() {
      _progressReturnPage = nextPage;
    });
    await WidgetsBinding.instance.endOfFrame;
    if (!mounted || !_bottomBarPageController.hasClients) {
      return;
    }
    await _bottomBarPageController.animateToPage(
      nextPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
    if (!mounted || !_bottomBarPageController.hasClients) {
      return;
    }
    _bottomBarPageController.jumpToPage(0);
    setState(() {
      _bottomBarPage = _NowPlayingBottomBarPage.seekBar;
      _progressReturnPage = null;
    });
    await WidgetsBinding.instance.endOfFrame;
  }

  void restartBarInactivityTimer() {
    _barInactivityTimer?.cancel();
    if (!mounted ||
        _activeInputs > 0 ||
        _progressReturnTransition != null ||
        _bottomBarPage == _NowPlayingBottomBarPage.seekBar ||
        _bottomBarPage == _NowPlayingBottomBarPage.lyrics) {
      return;
    }
    _barInactivityTimer = Timer(const Duration(seconds: 4), () {
      _progressReturnTransition = returnToProgressBar().whenComplete(() {
        _progressReturnTransition = null;
      });
    });
  }

  Future<void> handleUserInput(FutureOr<void> Function() action) async {
    _barInactivityTimer?.cancel();
    _activeInputs++;
    try {
      await _progressReturnTransition;
      if (mounted &&
          ModalRoute.of(context)?.isCurrent == true &&
          context.router.locationNamed == routeName) {
        await action();
      }
    } finally {
      _activeInputs--;
      restartBarInactivityTimer();
    }
  }

  Future<void> rotateForward() async {
    if (_bottomBarPage == _NowPlayingBottomBarPage.scrubberBar) {
      await ref.read(audioPlayerServiceProvider.notifier).seekForward();
      return;
    } else if (_bottomBarPage == _NowPlayingBottomBarPage.shuffleBar) {
      setState(() {
        _shuffleMode =
            PlaybackShuffleMode.values[(_shuffleMode.index + 1).clamp(0, 2)];
      });
      return;
    } else if (_bottomBarPage == _NowPlayingBottomBarPage.ratingBar) {
      await ref
          .read(nowPlayingDetailsProvider.notifier)
          .increaseCurrentMetadataRating();
      return;
    } else if (_bottomBarPage == _NowPlayingBottomBarPage.lyrics) {
      await scrollLyrics(60);
      return;
    }
    await Future.wait([
      showVolumeBar(),
      ref.read(settingsPreferencesControllerProvider.notifier).increaseVolume(),
    ]);
  }

  Future<void> rotateBackward() async {
    if (_bottomBarPage == _NowPlayingBottomBarPage.scrubberBar) {
      await ref.read(audioPlayerServiceProvider.notifier).seekBackward();
      return;
    } else if (_bottomBarPage == _NowPlayingBottomBarPage.shuffleBar) {
      setState(() {
        _shuffleMode =
            PlaybackShuffleMode.values[(_shuffleMode.index - 1).clamp(0, 2)];
      });
      return;
    } else if (_bottomBarPage == _NowPlayingBottomBarPage.ratingBar) {
      await ref
          .read(nowPlayingDetailsProvider.notifier)
          .decreaseCurrentMetadataRating();
      return;
    } else if (_bottomBarPage == _NowPlayingBottomBarPage.lyrics) {
      await scrollLyrics(-60);
      return;
    }
    await Future.wait([
      showVolumeBar(),
      ref.read(settingsPreferencesControllerProvider.notifier).decreaseVolume(),
    ]);
  }

  Future<void> seekForward() async {
    if (_bottomBarPage == _NowPlayingBottomBarPage.shuffleBar) {
      await rotateForward();
      return;
    }
    await ref.read(audioPlayerServiceProvider.notifier).nextSong();
  }

  Future<void> seekBackward() async {
    if (_bottomBarPage == _NowPlayingBottomBarPage.shuffleBar) {
      await rotateBackward();
      return;
    }
    await ref.read(audioPlayerServiceProvider.notifier).seekBackwards();
  }

  void seekForwardLongPress() {
    _longPressTimer?.cancel();
    _longPressTimer = Timer.periodic(const Duration(milliseconds: 50), (
      _,
    ) async {
      restartBarInactivityTimer();
      await ref.read(audioPlayerServiceProvider.notifier).seekForward();
    });
  }

  void seekBackwardLongPress() {
    _longPressTimer?.cancel();
    _longPressTimer = Timer.periodic(const Duration(milliseconds: 50), (
      _,
    ) async {
      restartBarInactivityTimer();
      await ref.read(audioPlayerServiceProvider.notifier).seekBackward();
    });
  }

  void onLongPressEnd() {
    if (_longPressTimer?.isActive ?? false) {
      _longPressTimer?.cancel();
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
    _barInactivityTimer?.cancel();
    _longPressTimer?.cancel();
    _bottomBarPageController.dispose();
    _lyricsScrollController.dispose();
    super.dispose();
  }

  Future<void> deviceControlHandler(_, DeviceAction? newState) async {
    if (!mounted ||
        newState == null ||
        ModalRoute.of(context)?.isCurrent != true ||
        context.router.locationNamed != routeName) {
      return;
    }
    await handleUserInput(() async {
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
    });
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingDetails = ref.watch(nowPlayingDetailsProvider);
    final String? lyrics = nowPlayingDetails.currentMetadata?.lyrics;
    final bool hasLyrics = lyrics != null && lyrics.trim().isNotEmpty;
    final String? currentLyricsSongIndex =
        nowPlayingDetails.currentMetadata?.identity;

    if (_lastLyricsSongIndex != currentLyricsSongIndex) {
      _lastLyricsSongIndex = currentLyricsSongIndex;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!_lyricsScrollController.hasClients) {
          return;
        }
        _lyricsScrollController.jumpTo(0);
      });
    }

    if (!hasLyrics &&
        _bottomBarPage == _NowPlayingBottomBarPage.lyrics &&
        _progressReturnTransition == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          return;
        }
        if (_bottomBarPageController.hasClients) {
          _bottomBarPageController.jumpToPage(0);
        }
        setState(() {
          _bottomBarPage = _NowPlayingBottomBarPage.seekBar;
        });
      });
    }

    ref.listen(deviceButtonsServiceProvider, deviceControlHandler);

    if (nowPlayingDetails.metadataList.isEmpty) {
      return CupertinoPageScaffold(
        child: Column(
          children: [
            Expanded(
              child: EmptyStateWidget(
                emptyDescription: context.localization.noMusicFilesFound,
              ),
            ),
          ],
        ),
      );
    }

    final bottomBarPages = <Widget>[
      ...(_bottomBarPage == _NowPlayingBottomBarPage.volumeBar
          ? const [NowPlayingBottomBar(), VolumeBar(), NowPlayingBottomBar()]
          : [
              const NowPlayingBottomBar(),
              const NowPlayingBottomBar(showScrubber: true),
              RatingBar(
                currentRating: nowPlayingDetails.currentMetadata?.rating ?? 0,
                onRatingClicked: (val) async {
                  await ref
                      .read(nowPlayingDetailsProvider.notifier)
                      .setCurrentMetadataRating(val ?? 0);
                },
              ),
              ShuffleSegmentedControl(
                shuffleMode: _shuffleMode,
                onValueChanged: (value) {
                  setState(() {
                    _shuffleMode = value ?? _shuffleMode;
                  });
                },
              ),
              if (hasLyrics) const SizedBox(height: 10),
              const NowPlayingBottomBar(),
            ]),
    ];
    final returnPage = _progressReturnPage;
    if (returnPage != null) {
      while (bottomBarPages.length <= returnPage) {
        bottomBarPages.add(const NowPlayingBottomBar());
      }
      bottomBarPages[returnPage] = const NowPlayingBottomBar();
    }

    return Listener(
      onPointerDown: (_) => restartBarInactivityTimer(),
      onPointerMove: (_) => restartBarInactivityTimer(),
      onPointerUp: (_) => restartBarInactivityTimer(),
      onPointerSignal: (_) => restartBarInactivityTimer(),
      child: CupertinoPageScaffold(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (nowPlayingDetails.isShuffleEnabled)
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                      CupertinoIcons.shuffle,
                      size: 20,
                      color: context.appPrimaryTextColor,
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
                      color: context.appPrimaryTextColor,
                    ),
                  ),
                if (!nowPlayingDetails.isShuffleEnabled &&
                    nowPlayingDetails.loopMode == LoopMode.off)
                  const SizedBox(height: 20),
              ],
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => unawaited(handleUserInput(onSelectPressed)),
                onLongPress: () =>
                    unawaited(handleUserInput(onSelectLongPress)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child:
                        (_bottomBarPage == _NowPlayingBottomBarPage.lyrics &&
                            hasLyrics)
                        ? LyricsView(
                            key: ValueKey(
                              'lyrics-view-${nowPlayingDetails.currentMetadata?.identity ?? 0}',
                            ),
                            lyrics: lyrics,
                            scrollController: _lyricsScrollController,
                          )
                        : const NowPlayingWidget(
                            key: ValueKey('now-playing-view'),
                          ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24 + SubtleReflection.visibleHeight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: PageView(
                  controller: _bottomBarPageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    for (final page in bottomBarPages)
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: SubtleReflection.visibleHeight,
                        ),
                        child: page,
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
