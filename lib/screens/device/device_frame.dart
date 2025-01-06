import 'package:classipod/core/constants.dart';
import 'package:classipod/core/extensions.dart';
import 'package:classipod/providers/music_provider.dart';
import 'package:classipod/screens/device/device_controls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vector_graphics/vector_graphics.dart';

class DeviceFrame extends ConsumerWidget {
  final Widget child;
  const DeviceFrame({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final isLoading = ref.watch(musicProvider.select((val) => val.isLoading));
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage("assets/images/noise.png"),
          fit: BoxFit.cover,
          opacity: context.isDarkMode ? 0.3 : 1,
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: (context.isDarkMode)
              ? [
                  darkDeviceFrameGradientColor1,
                  darkDeviceFrameGradientColor2,
                ]
              : [
                  lightDeviceFrameGradientColor1,
                  lightDeviceFrameGradientColor2,
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
                    height: size.height * kScreenHeightRatio,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: CupertinoColors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: context.isDarkMode
                            ? darkDeviceScreenColor
                            : lightDeviceScreenBorderColor,
                        width: 5,
                      ),
                    ),
                    child: (isLoading)
                        ? const Center(
                            child: VectorGraphic(
                              loader: AssetBytesLoader(
                                "assets/icons/apple_logo.svg",
                              ),
                            ),
                          )
                        : child,
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
