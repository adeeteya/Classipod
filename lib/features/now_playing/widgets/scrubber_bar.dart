import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScrubberBar extends ConsumerWidget {
  final double max;
  final double value;

  const ScrubberBar({super.key, required this.max, required this.value});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  onTapDown: (tapDownDetails) async {
                    final targetSeekValue =
                        (tapDownDetails.localPosition.dx * max) /
                        constraints.maxWidth;
                    await ref
                        .read(audioPlayerServiceProvider.notifier)
                        .seekToDuration(targetSeekValue.floor());
                  },
                  child: SizedBox(
                    height: 20,
                    width: constraints.maxWidth,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppPalette.inActiveSliderGradientColor1,
                            AppPalette.inActiveSliderGradientColor2,
                          ],
                        ),
                        border: Border.all(color: AppPalette.sliderBorderColor),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 2,
                left: ((value / max) * (constraints.maxWidth - 30)).clamp(
                  0,
                  constraints.maxWidth - 30,
                ),
                child: Transform.rotate(
                  angle: 3.14 / 4,
                  child: const SizedBox(
                    height: 15,
                    width: 15,
                    child: ColoredBox(
                      color: AppPalette.nowProgressBarGradientColor8,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
