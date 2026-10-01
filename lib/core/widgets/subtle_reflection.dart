import 'dart:math' as math;

import 'package:cupertino_ui/cupertino_ui.dart';

class SubtleReflection extends StatelessWidget {
  static const double visibleHeight = 15 / math.sqrt2;

  final Widget child;
  final double height;

  const SubtleReflection({
    super.key,
    required this.child,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        Positioned(
          top: height,
          left: 0,
          right: 0,
          height: visibleHeight,
          child: IgnorePointer(
            child: ExcludeSemantics(
              child: LayoutBuilder(
                builder: (context, constraints) => ShaderMask(
                  blendMode: BlendMode.dstIn,
                  shaderCallback: (bounds) => LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      CupertinoColors.white.withValues(
                        alpha: isDark ? 0.18 : 0.24,
                      ),
                      CupertinoColors.transparent,
                    ],
                  ).createShader(bounds),
                  child: ClipRect(
                    child: OverflowBox(
                      alignment: Alignment.topCenter,
                      minHeight: height,
                      maxHeight: height,
                      child: SizedBox(
                        width: constraints.maxWidth,
                        height: height,
                        child: Transform.flip(flipY: true, child: child),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
