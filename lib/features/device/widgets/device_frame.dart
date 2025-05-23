import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/constants/assets.dart';
import 'package:classipod/core/constants/keys.dart';
import 'package:classipod/features/device/widgets/device_controls.dart';
import 'package:classipod/features/device/widgets/device_screen.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:classipod/features/settings/models/device_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeviceFrame extends ConsumerWidget {
  final Widget child;

  const DeviceFrame({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final deviceColor = ref.watch(
      settingsPreferencesControllerProvider.select((e) => e.deviceColor),
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage(Assets.noiseImage),
          fit: BoxFit.cover,
          opacity: deviceColor == DeviceColor.black ? 0.3 : 1,
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors:
              (deviceColor == DeviceColor.black)
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
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            child: SizedBox(
              height: 20,
              width: size.width,
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 100, spreadRadius: 1)],
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
                  boxShadow: [BoxShadow(blurRadius: 100, spreadRadius: 1)],
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
                  boxShadow: [BoxShadow(blurRadius: 100, spreadRadius: 1)],
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
                  boxShadow: [BoxShadow(blurRadius: 100, spreadRadius: 1)],
                ),
              ),
            ),
          ),
          SafeArea(
            minimum: const EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 800,
                  maxWidth: 450,
                ),
                child: Column(
                  children: [
                    DeviceScreen(key: deviceScreenGlobalKey, child: child),
                    const Spacer(flex: 2),
                    DeviceControls(key: deviceControlsGlobalKey),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
