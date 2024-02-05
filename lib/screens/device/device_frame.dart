import 'package:flutter/cupertino.dart';
import 'package:retropod/core/constants.dart';
import 'package:retropod/core/extensions.dart';

class DeviceFrame extends StatelessWidget {
  final Widget child;
  const DeviceFrame({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                        color: CupertinoColors.black,
                        blurRadius: 100,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ),
              )),
          Positioned(
              bottom: 0,
              child: SizedBox(
                height: 20,
                width: size.width,
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: CupertinoColors.black,
                        blurRadius: 100,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ),
              )),
          Positioned(
              left: 0,
              child: SizedBox(
                height: size.height,
                width: 20,
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: CupertinoColors.black,
                        blurRadius: 100,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ),
              )),
          Positioned(
              right: 0,
              child: SizedBox(
                height: size.height,
                width: 20,
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: CupertinoColors.black,
                        blurRadius: 100,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ),
              )),
          SafeArea(
            minimum: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: child,
          ),
        ],
      ),
    );
  }
}
