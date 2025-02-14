import 'dart:math' as math;

import 'package:flutter/cupertino.dart';

class AnimatedHandIcon extends StatefulWidget {
  const AnimatedHandIcon({super.key});

  @override
  State<AnimatedHandIcon> createState() => _AnimatedHandIconState();
}

class _AnimatedHandIconState extends State<AnimatedHandIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final double angle = _controller.value * 2 * math.pi;

        final double x = 80 * math.cos(angle);

        final double y = 80 * math.sin(angle);

        return Transform(
          transform: Matrix4.translationValues(x, y, 0),
          child: const Icon(
            CupertinoIcons.hand_draw,
            size: 50,
            color: CupertinoColors.black,
          ), // Replace with your image asset
        );
      },
    );
  }
}
