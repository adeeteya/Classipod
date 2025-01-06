import 'dart:async';

import 'package:classipod/core/custom_page_screen.dart';
import 'package:classipod/core/extensions.dart';
import 'package:classipod/core/routes.dart';
import 'package:classipod/core/widgets/now_playing_page.dart';
import 'package:classipod/core/widgets/seek_bar.dart';
import 'package:classipod/core/widgets/volume_bar.dart';
import 'package:classipod/models/device_action.dart';
import 'package:classipod/models/metadata.dart';
import 'package:classipod/providers/device_buttons_provider.dart';
import 'package:classipod/providers/music_provider.dart';
import 'package:classipod/screens/no_music_screen.dart';
import 'package:classipod/screens/status_bar/status_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class NowPlayingScreen extends ConsumerStatefulWidget {
  const NowPlayingScreen({super.key});

  @override
  ConsumerState createState() => _NowPlayingScreenState();
}

class _NowPlayingScreenState extends ConsumerState<NowPlayingScreen>
    with CustomPageScreen {
  late Timer _longPressTimer;
  Timer _lastVolumeChangeTimer = Timer(Duration.zero, () {});
  bool _isVolumeChanging = false;

  @override
  String get routeName => Routes.nowPlaying.name;

  @override
  int get initialPage => ref.read(musicProvider).currentSongIndex;

  @override
  List<Metadata> get displayItems =>
      ref.read(musicProvider).musicFilesMetaDataList;

  @override
  Future<void> onSelectPressed() async {
    await ref.read(musicProvider.notifier).togglePlayback();
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
    setState(() {
      _isVolumeChanging = true;
    });
    await ref.read(musicProvider.notifier).increaseVolume();
    startVolumeTimer();
  }

  Future<void> rotateBackward() async {
    setState(() {
      _isVolumeChanging = true;
    });
    await ref.read(musicProvider.notifier).decreaseVolume();
    startVolumeTimer();
  }

  void seekForwardButtonLongPress() {
    _longPressTimer =
        Timer.periodic(const Duration(milliseconds: 50), (_) async {
      await ref.read(musicProvider.notifier).seekForward();
    });
  }

  void seekBackwardButtonLongPress() {
    _longPressTimer =
        Timer.periodic(const Duration(milliseconds: 50), (_) async {
      await ref.read(musicProvider.notifier).seekBackward();
    });
  }

  void longPressEnd() {
    if (_longPressTimer.isActive) {
      _longPressTimer.cancel();
      ref.read(deviceButtonProvider.notifier).resetDeviceAction();
    }
  }

  @override
  Future<void> deviceControlHandler(_, DeviceAction? newState) async {
    if (newState == null || context.router.locationNamed != routeName) {
      return;
    }
    switch (newState) {
      case DeviceAction.menu:
        context.pop();
        break;
      case DeviceAction.select:
        await onSelectPressed();
        break;
      case DeviceAction.rotateForward:
        await rotateForward();
        break;
      case DeviceAction.rotateBackward:
        await rotateBackward();
        break;
      case DeviceAction.seekForward:
        await ref.read(musicProvider.notifier).nextSong();
        break;
      case DeviceAction.seekBackward:
        await ref.read(musicProvider.notifier).previousSong();
        break;
      case DeviceAction.seekForwardLongPress:
        seekForwardButtonLongPress();
        break;
      case DeviceAction.seekBackwardLongPress:
        seekBackwardButtonLongPress();
        break;
      case DeviceAction.longPressEnd:
        longPressEnd();
        break;
      case DeviceAction.playPause:
        await onSelectPressed();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (displayItems.isEmpty) {
      return NoMusicScreen(
        title: Routes.nowPlaying.title,
      );
    }

    ref.listen(musicProvider.select((value) => value.currentSongIndex),
        (previous, next) async {
      if ((next - (previous ?? 0)).abs() > 10) {
        pageController.jumpToPage(next);
      } else {
        await pageController.animateToPage(
          next,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.ease,
        );
      }
    });

    return CupertinoPageScaffold(
      child: Column(
        children: [
          StatusBar(
            title: Routes.nowPlaying.title,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 40, 10, 30),
              child: Column(
                children: [
                  Flexible(
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: displayItems.length,
                      itemBuilder: (context, index) => NowPlayingPage(
                        thumbnailPath: displayItems[index].thumbnailPath,
                        trackName: displayItems[index].trackName,
                        artistNames: displayItems[index].getTrackArtistNames,
                        albumName: displayItems[index].albumName,
                        currentTrackNumber: index + 1,
                        totalTrackNumber: displayItems.length,
                      ),
                    ),
                  ),
                  AnimatedSwitcher(
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
                    child:
                        _isVolumeChanging ? const VolumeBar() : const SeekBar(),
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
