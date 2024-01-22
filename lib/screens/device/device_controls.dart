import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:retropod/core/constants.dart';
import 'package:retropod/core/extensions.dart';
import 'package:retropod/models/display_details.dart';
import 'package:retropod/providers/display_provider.dart';
import 'package:retropod/providers/music_provider.dart';

class DeviceControls extends ConsumerWidget {
  const DeviceControls({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onPanUpdate: (dragUpdateDetails) {
        double radius = (size.width * 0.61) / 2;

        /// Pan location on the wheel
        bool onTop = dragUpdateDetails.localPosition.dy <= radius;
        bool onLeftSide = dragUpdateDetails.localPosition.dx <= radius;
        bool onRightSide = !onLeftSide;
        bool onBottom = !onTop;

        /// Pan movements
        bool panUp = dragUpdateDetails.delta.dy <= 0.0;
        bool panLeft = dragUpdateDetails.delta.dx <= 0.0;
        bool panRight = !panLeft;
        bool panDown = !panUp;

        /// Absolute change on axis
        double yChange = dragUpdateDetails.delta.dy.abs();
        double xChange = dragUpdateDetails.delta.dx.abs();

        /// Directional change on wheel
        double verticalRotation =
            (onRightSide && panDown) || (onLeftSide && panUp)
                ? yChange
                : yChange * -1;

        double horizontalRotation = (onTop && panRight) || (onBottom && panLeft)
            ? xChange
            : xChange * -1;

        // Total computed change
        double rotationalChange = (verticalRotation + horizontalRotation) *
            (dragUpdateDetails.delta.distance * 0.1);

        if (rotationalChange > 8) {
          if (ref.read(displayProvider).displayScreenType ==
              DisplayScreenType.nowPlaying) {
            ref.read(musicProvider.notifier).seekForward();
          } else if (ref.read(displayProvider).displayScreenType ==
              DisplayScreenType.settings) {
            //Do Nothing for now because not enough elements
          } else {
            ref.read(displayProvider.notifier).seekForwardButton(size.height);
          }
        } else if (rotationalChange < -8) {
          if (ref.read(displayProvider).displayScreenType ==
              DisplayScreenType.nowPlaying) {
            ref.read(musicProvider.notifier).seekBackward();
          } else if (ref.read(displayProvider).displayScreenType ==
              DisplayScreenType.settings) {
            //Do Nothing for now because not enough elements
          } else {
            ref.read(displayProvider.notifier).seekBackButton();
          }
        }
      },
      child: Container(
        height: size.width * 0.61,
        width: size.width * 0.61,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.isDarkMode
              ? darkDeviceControlBackgroundColor
              : CupertinoColors.white,
          border: Border.all(
            color: context.isDarkMode
                ? transparentColor
                : lightDeviceControlBorderColor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: GestureDetector(
                onTap: () =>
                    ref.read(displayProvider.notifier).navigateToMenu(context),
                child: SizedBox(
                  width: 50,
                  height: 40,
                  child: Text(
                    "MENU",
                    style: TextStyle(
                      color: context.isDarkMode
                          ? CupertinoColors.white
                          : lightDeviceButtonColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SF Pro Text',
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: ref.read(displayProvider.notifier).seekBackButton,
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: SvgPicture.asset(
                      context.isDarkMode
                          ? "assets/icons/last.svg"
                          : "assets/icons/last-grey.svg",
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () =>
                      ref.read(displayProvider.notifier).selectButton(context),
                  child: Container(
                    height: size.width * 0.2175,
                    width: size.width * 0.2175,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: context.isDarkMode
                            ? CupertinoColors.black
                            : lightDeviceControlBorderColor,
                      ),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/noise.png"),
                        fit: BoxFit.cover,
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: context.isDarkMode
                            ? [
                                darkDeviceControlInnerButtonGradientColor1,
                                darkDeviceControlInnerButtonGradientColor2
                              ]
                            : [
                                lightDeviceControlInnerButtonGradientColor1,
                                lightDeviceControlInnerButtonGradientColor2
                              ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => ref
                      .read(displayProvider.notifier)
                      .seekForwardButton(size.height),
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: SvgPicture.asset(
                      context.isDarkMode
                          ? "assets/icons/next.svg"
                          : "assets/icons/next-grey.svg",
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: GestureDetector(
                onTap: ref.read(musicProvider.notifier).togglePlayback,
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: SvgPicture.asset(
                    context.isDarkMode
                        ? "assets/icons/play.svg"
                        : "assets/icons/play-grey.svg",
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
