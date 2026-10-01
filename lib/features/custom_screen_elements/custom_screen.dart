import 'dart:async';

import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/extensions/go_router_extensions.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/features/custom_screen_elements/screen_view_state.dart';
import 'package:classipod/features/device/models/device_action.dart';
import 'package:classipod/features/device/services/device_buttons_service_provider.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

mixin CustomScreen<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  abstract final String routeName;
  abstract final List displayItems;
  String? get screenStateKey => null;
  ScreenViewState? _viewState;
  int _selectedDisplayItem = 0;
  int get selectedDisplayItem {
    if (screenStateKey == null) return _selectedDisplayItem;
    final count = displayItems.length + extraDisplayItems;
    return count == 0 ? 0 : _selectedDisplayItem.clamp(0, count - 1);
  }

  set selectedDisplayItem(int value) {
    _selectedDisplayItem = value;
    _viewState?.selectedIndex = value;
  }

  int extraDisplayItems = 0;
  int topStatusBarHeight = 30;
  final double displayTileHeight = 30;
  late final ScrollController scrollController;

  final ValueNotifier<int> wheelScrollIndex = ValueNotifier(-1);

  void revealDisplayItem(int index) {
    selectedDisplayItem = index;
    void reveal(Duration _) {
      if (!mounted || !scrollController.hasClients) return;
      final position = scrollController.position;
      if (!position.hasContentDimensions) {
        WidgetsBinding.instance.addPostFrameCallback(reveal);
        return;
      }
      scrollController.jumpTo(
        (index * displayTileHeight).clamp(
          position.minScrollExtent,
          position.maxScrollExtent,
        ),
      );
    }

    WidgetsBinding.instance.addPostFrameCallback(reveal);
  }

  void onSelectPressed();

  void onSelectLongPress() {}

  void scrollForward() {
    if (selectedDisplayItem < displayItems.length + extraDisplayItems - 1) {
      setState(() {
        selectedDisplayItem++;
        wheelScrollIndex.value = selectedDisplayItem;
      });

      final double currentSelectedDisplayItemsHeight =
          (selectedDisplayItem + 1) * displayTileHeight + topStatusBarHeight;

      final double currentScrollHeight =
          context.screenSize.height + scrollController.offset;

      if (currentSelectedDisplayItemsHeight > currentScrollHeight) {
        scrollController.jumpTo(scrollController.offset + displayTileHeight);
      }
    }
  }

  void scrollBackward() {
    if (selectedDisplayItem > 0) {
      setState(() {
        selectedDisplayItem--;
        wheelScrollIndex.value = selectedDisplayItem;
      });
    }

    if (selectedDisplayItem * displayTileHeight < scrollController.offset) {
      scrollController.jumpTo(displayTileHeight * selectedDisplayItem);
    }
  }

  void onMenuButtonPressed() {
    scheduleMicrotask(() {
      if (mounted && ModalRoute.of(context)?.isCurrent == true) {
        context.pop();
      }
    });
  }

  Future<void> seekForward() async {
    await ref.read(audioPlayerServiceProvider.notifier).nextSong();
  }

  Future<void> seekBackward() async {
    await ref.read(audioPlayerServiceProvider.notifier).seekBackwards();
  }

  Future<void> deviceControlHandler(_, DeviceAction? newState) async {
    if (!mounted ||
        newState == null ||
        ModalRoute.of(context)?.isCurrent != true ||
        context.router.locationNamed != routeName) {
      return;
    }
    switch (newState) {
      case DeviceAction.menu:
        onMenuButtonPressed();
        break;
      case DeviceAction.select:
        onSelectPressed();
        break;
      case DeviceAction.selectLongPress:
        onSelectLongPress();
        break;
      case DeviceAction.rotateForward:
        scrollForward();
        break;
      case DeviceAction.rotateBackward:
        scrollBackward();
        break;
      case DeviceAction.seekForward:
        await seekForward();
        break;
      case DeviceAction.seekBackward:
        await seekBackward();
        break;
      case DeviceAction.seekForwardLongPress:
        break;
      case DeviceAction.seekBackwardLongPress:
        break;
      case DeviceAction.playPause:
        break;
      case DeviceAction.longPressEnd:
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    final key = screenStateKey;
    if (key != null) {
      _viewState = ref
          .read(screenViewStatesProvider)
          .putIfAbsent(key, ScreenViewState.new);
      _selectedDisplayItem = _viewState!.selectedIndex;
    }
    scrollController = ScrollController(
      initialScrollOffset: _viewState?.scrollOffset ?? 0,
      keepScrollOffset: false,
    );
    scrollController.addListener(() {
      if (scrollController.hasClients) {
        _viewState?.scrollOffset = scrollController.offset;
      }
    });
    if (_viewState != null) {
      clampRestoredScrollOffset(scrollController, () => mounted);
    }
    ref.listenManual(deviceButtonsServiceProvider, deviceControlHandler);
  }

  @override
  void dispose() {
    wheelScrollIndex.dispose();
    scrollController.dispose();
    super.dispose();
  }
}
