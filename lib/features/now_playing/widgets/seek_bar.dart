import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SeekBar extends ConsumerWidget {
  final double max;
  final double value;
  const SeekBar({
    super.key,
    required this.max,
    required this.value,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
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
                        .seekToDuration(
                          targetSeekValue.floor(),
                        );
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
              IgnorePointer(
                child: AnimatedContainer(
                  height: 20,
                  width: (value / max) * constraints.maxWidth,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  duration: const Duration(milliseconds: 10),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppPalette.nowProgressBarGradientColor1,
                        AppPalette.nowProgressBarGradientColor2,
                        AppPalette.nowProgressBarGradientColor1,
                        AppPalette.nowProgressBarGradientColor3,
                        AppPalette.nowProgressBarGradientColor4,
                        AppPalette.nowProgressBarGradientColor5,
                        AppPalette.nowProgressBarGradientColor6,
                        AppPalette.nowProgressBarGradientColor7,
                        AppPalette.nowProgressBarGradientColor8,
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppPalette.nowProgressBarShadowColor,
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 8),
                      ),
                    ],
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
