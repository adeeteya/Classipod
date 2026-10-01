import 'dart:async';

import 'package:classipod/features/music/cover_flow/cover_flow_motion.dart';
import 'package:flutter/widgets.dart';

class CoverFlowWheelController {
  CoverFlowWheelController({
    required this.pageController,
    required TickerProvider vsync,
  }) : _animation = AnimationController.unbounded(vsync: vsync) {
    _animation.addListener(_updatePage);
  }

  final PageController pageController;
  final AnimationController _animation;
  int _target = 0;

  int? get target => _animation.isAnimating ? _target : null;

  void step(int direction, int itemCount) {
    if (!pageController.hasClients || itemCount == 0) return;
    final page = pageController.page!;
    final next = ((target ?? page.round()) + direction).clamp(0, itemCount - 1);
    if (next == target || (target == null && next == page)) return;
    final velocity = _animation.isAnimating ? _animation.velocity : 0.0;
    _target = next;
    _animation.value = page;
    unawaited(
      _animation.animateWith(
        ScrollSpringSimulation(
          CoverFlowMotion.spring,
          page,
          next.toDouble(),
          velocity,
        ),
      ),
    );
  }

  void _updatePage() {
    if (!pageController.hasClients) return;
    final position = pageController.position;
    final pixels =
        pageController.offset +
        (_animation.value - pageController.page!) *
            position.viewportDimension *
            pageController.viewportFraction;
    pageController.jumpTo(
      pixels.clamp(position.minScrollExtent, position.maxScrollExtent),
    );
  }

  void stop() => _animation.stop();

  void dispose() => _animation.dispose();
}
