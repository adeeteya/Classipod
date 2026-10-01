import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScreenViewState {
  int selectedIndex = 0;
  double scrollOffset = 0;
  bool inputActive = true;
}

final screenViewStatesProvider = Provider<Map<String, ScreenViewState>>(
  (_) => {},
);

void clampRestoredScrollOffset(
  ScrollController controller,
  bool Function() isMounted,
) {
  void clampOffset(Duration _) {
    if (!isMounted()) return;
    if (!controller.hasClients || !controller.position.hasContentDimensions) {
      WidgetsBinding.instance.addPostFrameCallback(clampOffset);
      return;
    }
    final position = controller.position;
    final offset = position.pixels.clamp(
      position.minScrollExtent,
      position.maxScrollExtent,
    );
    if (offset != position.pixels) controller.jumpTo(offset);
  }

  WidgetsBinding.instance.addPostFrameCallback(clampOffset);
}
