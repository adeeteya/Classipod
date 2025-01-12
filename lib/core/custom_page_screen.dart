import 'package:classipod/core/extensions.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/features/device/device_action.dart';
import 'package:classipod/features/device/device_buttons_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

mixin CustomPageScreen<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  abstract final String routeName;
  abstract final List displayItems;
  late final PageController pageController;
  final double viewPortFraction = 1;
  final int initialPage = 0;
  double currentPage = 0;
  int selectedDisplayItem = 0;

  void onSelectPressed();

  Future<void> scrollForward() async {
    if (selectedDisplayItem < displayItems.length - 1) {
      await pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  Future<void> scrollBackward() async {
    if (selectedDisplayItem > 0) {
      // pageController.animateToPage(
      //   selectedDisplayItem - 1,
      //   duration: const Duration(milliseconds: 300),
      //   curve: Curves.ease,
      // );
      await pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void onMenuButtonPressed() {
    context.pop();
  }

  Future<void> onPlayPauseButtonPressed() async {
    await ref.read(audioPlayerServiceProvider.notifier).togglePlayback();
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
        onSelectPressed();
        break;
      case DeviceAction.rotateForward:
        await scrollForward();
        break;
      case DeviceAction.rotateBackward:
        await scrollBackward();
        break;
      case DeviceAction.seekForward:
        await scrollForward();
        break;
      case DeviceAction.seekBackward:
        await scrollBackward();
        break;
      case DeviceAction.seekForwardLongPress:
        break;
      case DeviceAction.seekBackwardLongPress:
        break;
      case DeviceAction.playPause:
        await onPlayPauseButtonPressed();
        break;
      case DeviceAction.longPressEnd:
        break;
    }
  }

  @override
  void initState() {
    pageController = PageController(
      initialPage: initialPage,
      viewportFraction: viewPortFraction,
      keepPage: false,
    );
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page ?? currentPage;
        selectedDisplayItem = currentPage.toInt();
      });
    });
    super.initState();
    ref.listenManual(
      deviceButtonProvider,
      deviceControlHandler,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
