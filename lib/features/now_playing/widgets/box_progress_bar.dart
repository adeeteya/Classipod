import 'package:classipod/core/constants.dart';
import 'package:flutter/cupertino.dart';

class BoxProgressBar extends StatelessWidget {
  final double min;
  final double max;
  final double value;
  const BoxProgressBar({
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
                          inActiveSliderGradientColor1,
                          inActiveSliderGradientColor2,
                        ],
                      ),
                      border: Border.all(color: sliderBorderColor),
                    ),
                  ),
                ),
              ),
              AnimatedContainer(
                height: 20,
                width: (value / (max - min)) * constraints.maxWidth,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                duration: const Duration(milliseconds: 10),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      primaryBlueGradientColor1,
                      primaryBlueGradientColor2,
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
