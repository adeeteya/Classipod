import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:classipod/features/settings/models/device_appearance.dart';
import 'package:classipod/features/settings/models/device_texture.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Single source of truth for how the device is painted, so the frame, the
/// controls and the settings previews cannot drift apart.
final deviceAppearanceProvider = Provider<DeviceAppearance>((ref) {
  final settings = ref.watch(settingsPreferencesControllerProvider);
  final int? customColorValue = settings.customDeviceColorValue;

  return DeviceAppearance.resolve(
    deviceColor: settings.deviceColor,
    customColor: customColorValue == null ? null : Color(customColorValue),
    finish: settings.deviceFinish,
    texture: DeviceTexture.fromStored(settings.deviceTexture),
  );
});
