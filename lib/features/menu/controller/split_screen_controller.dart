import 'dart:async';

import 'package:classipod/features/menu/models/split_screen_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splitScreenControllerProvider =
    NotifierProvider<SplitScreenControllerNotifier, SplitScreenType>(
      SplitScreenControllerNotifier.new,
    );

class SplitScreenControllerNotifier extends Notifier<SplitScreenType> {
  Timer? _previewTimer;
  SplitScreenType? _pendingType;

  @override
  SplitScreenType build() {
    ref.onDispose(() => _previewTimer?.cancel());
    return SplitScreenType.albumArt;
  }

  set changeSplitScreenType(SplitScreenType splitScreenType) {
    if (_pendingType == splitScreenType) return;
    _previewTimer?.cancel();
    _pendingType = splitScreenType == state ? null : splitScreenType;
    _schedulePreview();
  }

  void onClickWheelScroll() {
    _previewTimer?.cancel();
    _schedulePreview();
  }

  void _schedulePreview() {
    if (_pendingType == null) return;
    _previewTimer = Timer(const Duration(seconds: 1), () {
      final nextType = _pendingType;
      _pendingType = null;
      if (nextType != null) state = nextType;
    });
  }
}
