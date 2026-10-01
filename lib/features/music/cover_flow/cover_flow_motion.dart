import 'package:flutter/widgets.dart';

abstract final class CoverFlowMotion {
  static const duration = Duration(milliseconds: 400);
  static const curve = Curves.easeOutSine;
  static const spring = SpringDescription(mass: 1, stiffness: 225, damping: 30);
}

class CoverFlowScrollPhysics extends PageScrollPhysics {
  const CoverFlowScrollPhysics({super.parent = const ClampingScrollPhysics()});

  @override
  SpringDescription get spring => CoverFlowMotion.spring;

  @override
  CoverFlowScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CoverFlowScrollPhysics(parent: buildParent(ancestor));
  }
}
