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

class _NowPlayingScreenState extends ConsumerState<NowPlayingScreen> {
  final PageController _bottomBarPageController = PageController();
  late Timer _longPressTimer;
  Timer _lastVolumeChangeTimer = Timer(Duration.zero, () {});
  bool _isVolumeChanging = false;
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

  Future<void> seekForward() async {
    await ref.read(audioPlayerServiceProvider.notifier).nextSong();
  }

  Future<void> seekBackward() async {
    await ref.read(audioPlayerServiceProvider.notifier).seekBackwards();
  }

  void seekForwardLongPress() {
    _longPressTimer =
        Timer.periodic(const Duration(milliseconds: 50), (_) async {
      await ref.read(audioPlayerServiceProvider.notifier).seekForward();
    });
  }

  void seekBackwardLongPress() {
    _longPressTimer =
        Timer.periodic(const Duration(milliseconds: 50), (_) async {
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

    final size = MediaQuery.sizeOf(context);
    late final double verticalPadding;
    if (size.height < 800) {
      verticalPadding = 10;
    } else {
      verticalPadding = 20;
    }

    ref.listen(deviceButtonsServiceProvider, deviceControlHandler);

    return CupertinoPageScaffold(
      child: Column(
        children: [
          StatusBar(
            title: Routes.nowPlaying.title(context),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, verticalPadding, 10, 0),
              child: NowPlayingWidget(
                songMetadata: nowPlayingDetails.currentMetadata!,
                currentTrackNumber: nowPlayingDetails.currentIndex + 1,
                totalTrackNumber: nowPlayingDetails.metadataList.length,
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
                  final begin = Offset(_isVolumeChanging ? 1.0 : -0.5, 0.0);
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
          ),
          SizedBox(height: verticalPadding),
        ],
      ),
    );
  }
}
