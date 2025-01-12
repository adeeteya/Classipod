import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/constants/assets.dart';
import 'package:classipod/core/constants/constants.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/features/device/presentation/device_controls.dart';
import 'package:flutter/cupertino.dart';

class DeviceFrame extends StatelessWidget {
  final Widget child;
  const DeviceFrame({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage(Assets.noiseImage),
          fit: BoxFit.cover,
          opacity: context.isDarkMode ? 0.3 : 1,
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: (context.isDarkMode)
              ? [
                  AppPalette.darkDeviceFrameGradientColor1,
                  AppPalette.darkDeviceFrameGradientColor2,
                ]
              : [
                  AppPalette.lightDeviceFrameGradientColor1,
                  AppPalette.lightDeviceFrameGradientColor2,
                ],
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            child: SizedBox(
              height: 20,
              width: size.width,
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 100,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              height: 20,
              width: size.width,
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 100,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            child: SizedBox(
              height: size.height,
              width: 20,
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 100,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: SizedBox(
              height: size.height,
              width: 20,
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 100,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            minimum: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              children: [
                IgnorePointer(
                  child: Container(
                    height: size.height * Constants.screenHeightRatio,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: CupertinoColors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: context.isDarkMode
                            ? AppPalette.darkDeviceScreenColor
                            : AppPalette.lightDeviceScreenBorderColor,
                        width: 5,
                      ),
                    ),
                    child: child,
                  ),
                ),
                const Spacer(flex: 2),
                const DeviceControls(),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
