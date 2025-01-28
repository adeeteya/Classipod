import 'package:classipod/features/settings/model/device_color.dart';

class SettingsPreferences {
  final String languageLocaleCode;
  final DeviceColor deviceColor;
  final bool isTouchScreenEnabled;
  final bool repeat;
  final bool vibrate;
  final bool clickWheelSound;
  final bool splitScreenEnabled;
  final bool immersiveMode;
  final String musicFolderPath;

  SettingsPreferences({
    required this.languageLocaleCode,
    required this.deviceColor,
    required this.isTouchScreenEnabled,
    required this.repeat,
    required this.vibrate,
    required this.clickWheelSound,
    required this.splitScreenEnabled,
    required this.immersiveMode,
    required this.musicFolderPath,
  });

  SettingsPreferences copyWith({
    String? languageLocaleCode,
    DeviceColor? deviceColor,
    bool? isTouchScreenEnabled,
    bool? repeat,
    bool? vibrate,
    bool? clickWheelSound,
    bool? splitScreenEnabled,
    bool? immersiveMode,
    String? musicFolderPath,
  }) {
    return SettingsPreferences(
      languageLocaleCode: languageLocaleCode ?? this.languageLocaleCode,
      deviceColor: deviceColor ?? this.deviceColor,
      isTouchScreenEnabled: isTouchScreenEnabled ?? this.isTouchScreenEnabled,
      repeat: repeat ?? this.repeat,
      vibrate: vibrate ?? this.vibrate,
      clickWheelSound: clickWheelSound ?? this.clickWheelSound,
      splitScreenEnabled: splitScreenEnabled ?? this.splitScreenEnabled,
      immersiveMode: immersiveMode ?? this.immersiveMode,
      musicFolderPath: musicFolderPath ?? this.musicFolderPath,
    );
  }
}
