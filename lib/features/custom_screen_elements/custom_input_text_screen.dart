import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/extensions/go_router_extensions.dart';
import 'package:classipod/core/widgets/input_text_bar.dart';
import 'package:classipod/features/custom_screen_elements/screen_view_state.dart';
import 'package:classipod/features/device/models/device_action.dart';
import 'package:classipod/features/device/services/device_buttons_service_provider.dart';
import 'package:classipod/features/tutorial/controller/tutorial_controller.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

mixin CustomInputTextScreen<T extends ConsumerStatefulWidget>
    on ConsumerState<T> {
  abstract final String routeName;
  abstract final List displayItems;
  String? get screenStateKey => null;
  ScreenViewState? _viewState;
  int _selectedDisplayItem = 0;
  int get selectedDisplayItem {
    final count = displayItems.length + extraDisplayItems;
    return count == 0 ? 0 : _selectedDisplayItem.clamp(0, count - 1);
  }

  set selectedDisplayItem(int value) {
    _selectedDisplayItem = value;
    _viewState?.selectedIndex = value;
  }

  int extraDisplayItems = 0;
  int topStatusBarHeight = 30;
  final double displayTileHeight = 54;
  late final ScrollController scrollController;
  String inputText = '';
  bool isInputTextBarActive = true;
  late final InputTextBarController inputTextBarController =
      InputTextBarController(initialText: inputText);

  void onSelectPressed() {
    if (isInputTextBarActive) {
      inputTextBarController.selectAlphabet();
    } else {
      onSelectAction();
    }
  }

  void onSelectLongPress() {}

  void onSelectAction() {}

  void reopenInputTextBar() {
    setState(() {
      selectedDisplayItem = 0;
      isInputTextBarActive = !isInputTextBarActive;
    });
  }

  void scrollForward() {
    if (isInputTextBarActive) {
      inputTextBarController.moveToNextAlphabet();
    } else if (selectedDisplayItem <
        displayItems.length + extraDisplayItems - 1) {
      setState(() {
        selectedDisplayItem++;
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
    if (isInputTextBarActive) {
      inputTextBarController.moveBackToPreviousAlphabet();
      return;
    }

    if (selectedDisplayItem > 0) {
      setState(() {
        selectedDisplayItem--;
      });
    }

    if (selectedDisplayItem * displayTileHeight < scrollController.offset) {
      scrollController.jumpTo(displayTileHeight * selectedDisplayItem);
    }
  }

  void onMenuButtonPressed() {
    if (isInputTextBarActive) {
      setState(() {
        isInputTextBarActive = false;
      });
    } else {
      context.pop();
    }
  }

  Future<void> seekForward() async {
    inputTextBarController.addSpace();
  }

  Future<void> seekBackward() async {
    inputTextBarController.removeCharacter();
  }

  void seekBackwardLongPress() {}

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
        seekBackwardLongPress();
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
      isInputTextBarActive = _viewState!.inputActive;
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      ref.read(tutorialControllerProvider.notifier).playInputTextBarTutorial();
    });
    ref.listenManual(deviceButtonsServiceProvider, deviceControlHandler);
  }

  @override
  void dispose() {
    _viewState?.selectedIndex = _selectedDisplayItem;
    _viewState?.inputActive = isInputTextBarActive;
    scrollController.dispose();
    super.dispose();
  }
}
