import 'package:classipod/core/constants/app_palette.dart';
import 'package:flutter/cupertino.dart';

class ScrubberBar extends StatelessWidget {
  final double min;
  final double max;
  final double value;
  const ScrubberBar({
    super.key,
    this.min = 0,
    this.max = 1,
    this.value = 0.5,
  }) : assert(max > min);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
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
              Positioned(
                top: 2,
                left: (value / (max - min)) * constraints.maxWidth,
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
