import 'dart:async';

import 'package:cupertino_ui/cupertino_ui.dart';

class StatusBarEntranceController extends AnimationController {
  Timer? _delay;
  Animation<double>? _pageAnimation;

  StatusBarEntranceController({required super.vsync})
    : super(duration: const Duration(milliseconds: 500));

  void prepare() {
    cancelEntrance();
    reset();
  }

  void startAfterTransition(Animation<double>? animation) {
    _pageAnimation = animation;
    if (animation == null ||
        animation.status == AnimationStatus.completed ||
        animation.status == AnimationStatus.dismissed) {
      _scheduleEntrance();
    } else {
      animation.addStatusListener(_onPageStatus);
    }
  }

  void _onPageStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed ||
        status == AnimationStatus.dismissed) {
      _scheduleEntrance();
    }
  }

  void _scheduleEntrance() {
    _pageAnimation?.removeStatusListener(_onPageStatus);
    _pageAnimation = null;
    _delay?.cancel();
    _delay = Timer(const Duration(milliseconds: 500), () {
      unawaited(forward());
    });
  }

  void cancelEntrance() {
    _delay?.cancel();
    _delay = null;
    _pageAnimation?.removeStatusListener(_onPageStatus);
    _pageAnimation = null;
    stop();
  }

  @override
  void dispose() {
    cancelEntrance();
    super.dispose();
  }
}
