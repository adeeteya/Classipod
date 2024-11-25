import 'package:classipod/core/constants.dart';
import 'package:classipod/core/extensions.dart';
import 'package:classipod/models/device_action.dart';
import 'package:classipod/providers/device_buttons_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin CustomScreen<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  abstract final String routeName;
  abstract final List displayItems;
  int selectedDisplayItem = 0;
  final double displayTileHeight = 30.0;
  final ScrollController scrollController = ScrollController();

  void onSelectPressed();

  void scrollForward() {
    if (selectedDisplayItem < displayItems.length - 1) {
      setState(() {
        selectedDisplayItem++;
      });

      if (selectedDisplayItem != displayItems.length - 1 &&
          (((selectedDisplayItem + 2) * displayTileHeight) >
              ((context.screenSize.height * kScreenHeightRatio) +
                  scrollController.offset))) {
        scrollController.jumpTo(scrollController.offset + displayTileHeight);
      }
    }
  }

  void scrollBackward() {
    if (selectedDisplayItem > 0) {
      setState(() {
        selectedDisplayItem--;
      });
    }
    if (selectedDisplayItem != 0 &&
        (selectedDisplayItem * displayTileHeight) - displayTileHeight <
            scrollController.offset) {
      scrollController
          .jumpTo(displayTileHeight * selectedDisplayItem - displayTileHeight);
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
    super.initState();
    ref.listenManual(
      deviceButtonProvider,
      deviceControlHandler,
    );
  }
}
