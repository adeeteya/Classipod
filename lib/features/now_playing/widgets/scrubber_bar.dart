import 'dart:math' as math;

import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/core/theme/ipod_gradients.dart';
import 'package:classipod/core/widgets/subtle_reflection.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScrubberBar extends ConsumerWidget {
  final double max;
  final double value;

  const ScrubberBar({super.key, required this.max, required this.value});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme =
        CupertinoTheme.of(context).brightness == Brightness.dark;
    final gradient = isDarkTheme
        ? IpodGradients.darkSliderTrack
        : IpodGradients.sliderTrack;
    final borderColor = isDarkTheme
        ? AppPalette.darkSliderBorderColor
        : AppPalette.sliderBorderColor;
    final hasDuration = max.isFinite && max > 0;
    final progress = hasDuration && value.isFinite
        ? (value / max).clamp(0.0, 1.0)
        : 0.0;
    const markerSize = 12.5;
    const trackHeight = 20.0;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTapDown: !hasDuration
                  ? null
                  : (tapDownDetails) async {
                      final fraction =
                          (tapDownDetails.localPosition.dx /
                                  constraints.maxWidth)
                              .clamp(0.0, 1.0);
                      await ref
                          .read(audioPlayerServiceProvider.notifier)
                          .seekToDuration((fraction * max).floor());
                    },
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  SizedBox(
                    height: trackHeight,
                    width: constraints.maxWidth,
                    child: DecoratedBox(
                      decoration: BoxDecoration(gradient: gradient),
                    ),
                  ),
                  SubtleReflection(
                    height: trackHeight,
                    child: SizedBox(
                      height: trackHeight,
                      width: constraints.maxWidth,
                      child: ClipRect(
                        child: Stack(
                          children: [
                            Positioned(
                              top: (trackHeight - markerSize) / 2,
                              left:
                                  progress * constraints.maxWidth -
                                  markerSize / 2,
                              child: Transform.rotate(
                                angle: math.pi / 4,
                                child: const SizedBox(
                                  height: markerSize,
                                  width: markerSize,
                                  child: ColoredBox(
                                    color:
                                        AppPalette.nowProgressBarGradientColor8,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: IgnorePointer(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(color: borderColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
