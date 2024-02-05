import 'package:flutter/cupertino.dart';
import 'package:retropod/core/constants.dart';

class BoxProgressBar extends StatelessWidget {
  final double min;
  final double max;
  final double value;
  const BoxProgressBar(
      {super.key, this.min = 0, this.max = 1, this.value = 0.5});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
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
              height: 19,
              width: (value / (max - min)) * constraints.maxWidth,
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              duration: const Duration(milliseconds: 10),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    primaryBlueGradientColor1,
                    primaryBlueGradientColor2
                  ],
                  stops: [0.5, 1],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
