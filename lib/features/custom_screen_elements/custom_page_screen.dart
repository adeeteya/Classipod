import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/extensions/go_router_extensions.dart';
import 'package:classipod/features/custom_screen_elements/screen_view_state.dart';
import 'package:classipod/features/device/models/device_action.dart';
import 'package:classipod/features/device/services/device_buttons_service_provider.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

mixin CustomPageScreen<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  abstract final String routeName;
  abstract final List displayItems;
  late final PageController pageController;
  final double viewPortFraction = 1;
  final int initialPage = 0;
  String? get screenStateKey => null;
  ScreenViewState? _viewState;
  int? _pendingRestoredPage;
  double currentPage = 0;
  int selectedDisplayItem = 0;

  void restorePageSelection() {
    if (displayItems.isEmpty) return;
    final target = (_pendingRestoredPage ?? selectedDisplayItem).clamp(
      0,
      displayItems.length - 1,
    );
    _pendingRestoredPage = null;
    if (target == selectedDisplayItem) return;
    selectedDisplayItem = target;
    currentPage = target.toDouble();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && pageController.hasClients) {
        pageController.jumpToPage(target);
      }
    });
  }

  void onSelectPressed();

  void onSelectLongPress() {}

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
      await pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void onMenuButtonPressed() {
    context.pop();
  }

  Future<void> seekForward() async {
    await scrollForward();
  }

  Future<void> seekBackward() async {
    await scrollBackward();
  }

  Future<void> rotateForward() async {
    await scrollForward();
  }

  Future<void> rotateBackward() async {
    await scrollBackward();
  }

  void seekForwardLongPress() {}

  void seekBackwardLongPress() {}

  void onLongPressEnd() {}

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

  void _updatePage() {
    setState(() {
      currentPage = pageController.page ?? currentPage;
      selectedDisplayItem = currentPage.toInt();
      _viewState?.selectedIndex = selectedDisplayItem;
    });
  }

  @override
  void initState() {
    final key = screenStateKey;
    if (key != null) {
      _viewState = ref
          .read(screenViewStatesProvider)
          .putIfAbsent(key, ScreenViewState.new);
    }
    final count = displayItems.length;
    if (count == 0) _pendingRestoredPage = _viewState?.selectedIndex;
    final restoredPage = _viewState == null
        ? initialPage
        : count == 0
        ? 0
        : _viewState!.selectedIndex.clamp(0, count - 1);
    currentPage = restoredPage.toDouble();
    selectedDisplayItem = restoredPage;
    pageController = PageController(
      initialPage: restoredPage,
      viewportFraction: viewPortFraction,
      keepPage: false,
    );
    pageController.addListener(_updatePage);
    super.initState();
    ref.listenManual(deviceButtonsServiceProvider, deviceControlHandler);
  }

  @override
  void dispose() {
    _viewState?.selectedIndex = _pendingRestoredPage ?? selectedDisplayItem;
    pageController.removeListener(_updatePage);
    pageController.dispose();
    super.dispose();
  }
}
