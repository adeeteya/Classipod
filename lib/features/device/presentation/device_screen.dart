import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/constants/constants.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:classipod/features/settings/model/device_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeviceScreen extends ConsumerWidget {
  final Widget child;
  const DeviceScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTouchScreenEnabled = ref.watch(
      settingsPreferencesControllerProvider
          .select((e) => e.isTouchScreenEnabled),
    );

    final size = MediaQuery.sizeOf(context);
    final deviceColor = ref.watch(
      settingsPreferencesControllerProvider.select((e) => e.deviceColor),
    );

    late final double screenHeight;
    if (size.height < 800) {
      screenHeight = Constants.smallScreenHeightRatio;
    } else {
      screenHeight = Constants.screenHeightRatio;
    }

    return AbsorbPointer(
      absorbing: !isTouchScreenEnabled,
      child: Container(
        height: size.height * screenHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: deviceColor == DeviceColor.black
                ? AppPalette.darkDeviceScreenColor
                : AppPalette.lightDeviceScreenBorderColor,
            width: 5,
          ),
        ),
        child: child,
      ),
    );
  }
}
