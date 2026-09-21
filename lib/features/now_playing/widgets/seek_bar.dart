import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SeekBar extends ConsumerWidget {
  final double max;
  final double value;

  const SeekBar({super.key, required this.max, required this.value});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme =
        CupertinoTheme.of(context).brightness == Brightness.dark;
    final inactiveGradientColors = isDarkTheme
        ? const [
            AppPalette.darkSliderGradientColor1,
            AppPalette.darkSliderGradientColor2,
          ]
        : const [
            AppPalette.inActiveSliderGradientColor1,
            AppPalette.inActiveSliderGradientColor2,
          ];
    final borderColor = isDarkTheme
        ? AppPalette.darkSliderBorderColor
        : AppPalette.sliderBorderColor;
    final progressShadowColor = isDarkTheme
        ? AppPalette.darkNowProgressBarShadowColor
        : AppPalette.nowProgressBarShadowColor;

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
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: inactiveGradientColors,
                        ),
                        border: Border.all(color: borderColor),
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
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
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
                        color: progressShadowColor,
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(0, 8),
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
