import 'package:classipod/core/extensions.dart';
import 'package:classipod/models/device_action.dart';
import 'package:classipod/providers/device_buttons_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin CustomPageScreen<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  abstract final String routeName;
  abstract final List displayItems;
  late final PageController pageController;
  final double viewPortFraction = 1;
  double currentPage = 0;
  int selectedDisplayItem = 0;

  void onSelectPressed();

  void scrollForward() {
    if (selectedDisplayItem < displayItems.length - 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void scrollBackward() {
    if (selectedDisplayItem > 0) {
      // pageController.animateToPage(
      //   selectedDisplayItem - 1,
      //   duration: const Duration(milliseconds: 300),
      //   curve: Curves.ease,
      // );
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void deviceControlHandler(prevState, newState) {
    if (newState == null || context.router.locationNamed != routeName) {
      return;
    }
    switch (newState) {
      case DeviceAction.menu:
        break;
      case DeviceAction.select:
        onSelectPressed();
        break;
      case DeviceAction.rotateForward:
        scrollForward();
        break;
      case DeviceAction.rotateBackward:
        scrollBackward();
        break;
      case DeviceAction.seekForward:
        scrollForward();
        break;
      case DeviceAction.seekBackward:
        scrollBackward();
        break;
      case DeviceAction.seekForwardLongPress:
        break;
      case DeviceAction.seekBackwardLongPress:
        break;
      case DeviceAction.playPause:
        break;
    }
  }

  @override
  void initState() {
    pageController = PageController(
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
