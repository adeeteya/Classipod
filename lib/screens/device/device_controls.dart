import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:retropod/core/constants.dart';
import 'package:retropod/core/extensions.dart';
import 'package:retropod/providers/display_provider.dart';
import 'package:retropod/providers/music_provider.dart';

class DeviceControls extends ConsumerWidget {
  const DeviceControls({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onPanUpdate: (dragUpdateDetails) => ref
          .read(displayProvider.notifier)
          .onClickWheelScroll(
              dragUpdateDetails, (size.width * 0.61) / 2, size.height),
      child: Container(
        height: size.width * 0.61,
        width: size.width * 0.61,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.isDarkMode
              ? darkDeviceControlBackgroundColor
              : CupertinoColors.white,
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () =>
                    ref.read(displayProvider.notifier).menuButton(context),
                child: ColoredBox(
                  color: context.isDarkMode
                      ? darkDeviceControlBackgroundColor
                      : CupertinoColors.white,
                  child: Center(
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
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: ref.read(displayProvider.notifier).seekBackButton,
                    child: SizedBox(
                      height: size.width * 0.2175,
                      child: ColoredBox(
                        color: context.isDarkMode
                            ? darkDeviceControlBackgroundColor
                            : CupertinoColors.white,
                        child: SvgPicture.asset(
                          context.isDarkMode
                              ? "assets/icons/last.svg"
                              : "assets/icons/last-grey.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () =>
                      ref.read(displayProvider.notifier).selectButton(context),
                  child: SizedBox(
                    height: size.width * 0.2175,
                    width: size.width * 0.2175,
                    child: DecoratedBox(
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
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => ref
                        .read(displayProvider.notifier)
                        .seekForwardButton(size.height),
                    child: SizedBox(
                      height: size.width * 0.2175,
                      child: ColoredBox(
                        color: context.isDarkMode
                            ? darkDeviceControlBackgroundColor
                            : CupertinoColors.white,
                        child: SvgPicture.asset(
                          context.isDarkMode
                              ? "assets/icons/next.svg"
                              : "assets/icons/next-grey.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: GestureDetector(
                onTap: ref.read(musicProvider.notifier).togglePlayback,
                child: ColoredBox(
                  color: context.isDarkMode
                      ? darkDeviceControlBackgroundColor
                      : CupertinoColors.white,
                  child: Center(
                    child: SvgPicture.asset(
                      context.isDarkMode
                          ? "assets/icons/play.svg"
                          : "assets/icons/play-grey.svg",
                      fit: BoxFit.scaleDown,
                    ),
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
