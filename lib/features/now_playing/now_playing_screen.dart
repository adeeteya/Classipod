import 'dart:async';

import 'package:classipod/core/custom_page_screen.dart';
import 'package:classipod/core/extensions.dart';
import 'package:classipod/core/routes.dart';
import 'package:classipod/features/device/device_action.dart';
import 'package:classipod/features/device/device_buttons_provider.dart';
import 'package:classipod/features/now_playing/now_playing_provider.dart';
import 'package:classipod/features/now_playing/widgets/now_playing_page.dart';
import 'package:classipod/features/now_playing/widgets/seek_bar.dart';
import 'package:classipod/features/now_playing/widgets/volume_bar.dart';
import 'package:classipod/features/status_bar/status_bar.dart';
import 'package:classipod/models/metadata.dart';
import 'package:classipod/screens/no_music_screen.dart';
import 'package:classipod/services/audio_player_service.dart';
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
  int get initialPage => ref.read(audioPlayerProvider).currentIndex ?? 0;

  @override
  List<Metadata> get displayItems => ref.watch(nowPlayingMetadataListProvider);

  @override
  Future<void> onSelectPressed() async {
    await ref.read(audioPlayerServiceProvider.notifier).togglePlayback();
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
    await ref.read(audioPlayerServiceProvider.notifier).increaseVolume();
    startVolumeTimer();
  }

  Future<void> rotateBackward() async {
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
    await ref.read(audioPlayerServiceProvider.notifier).previousSong();
  }

  void seekForwardButtonLongPress() {
    _longPressTimer =
        Timer.periodic(const Duration(milliseconds: 50), (_) async {
      await ref.read(audioPlayerServiceProvider.notifier).seekForward();
    });
  }

  void seekBackwardButtonLongPress() {
    _longPressTimer =
        Timer.periodic(const Duration(milliseconds: 50), (_) async {
      await ref.read(audioPlayerServiceProvider.notifier).seekBackward();
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
        await seekForward();
        break;
      case DeviceAction.seekBackward:
        await seekBackward();
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
