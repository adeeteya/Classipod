import 'package:classipod/features/settings/model/device_color.dart';
import 'package:classipod/features/settings/model/repeat_mode.dart';

class SettingsPreferences {
  final String languageLocaleCode;
  final DeviceColor deviceColor;
  final bool isTouchScreenEnabled;
  final RepeatMode repeatMode;
  final bool vibrate;
  final bool clickWheelSound;
  final bool splitScreenEnabled;
  final bool immersiveMode;
  final String musicFolderPath;

  SettingsPreferences({
    required this.languageLocaleCode,
    required this.deviceColor,
    required this.isTouchScreenEnabled,
    required this.repeatMode,
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
    RepeatMode? repeatMode,
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
      repeatMode: repeatMode ?? this.repeatMode,
      vibrate: vibrate ?? this.vibrate,
      clickWheelSound: clickWheelSound ?? this.clickWheelSound,
      splitScreenEnabled: splitScreenEnabled ?? this.splitScreenEnabled,
      immersiveMode: immersiveMode ?? this.immersiveMode,
      musicFolderPath: musicFolderPath ?? this.musicFolderPath,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SettingsPreferences &&
        other.languageLocaleCode == languageLocaleCode &&
        other.deviceColor == deviceColor &&
        other.isTouchScreenEnabled == isTouchScreenEnabled &&
        other.repeatMode == repeatMode &&
        other.vibrate == vibrate &&
        other.clickWheelSound == clickWheelSound &&
        other.splitScreenEnabled == splitScreenEnabled &&
        other.immersiveMode == immersiveMode &&
        other.musicFolderPath == musicFolderPath;
  }

  @override
  int get hashCode => Object.hash(
        languageLocaleCode,
        deviceColor,
        isTouchScreenEnabled,
        repeatMode,
        vibrate,
        clickWheelSound,
        splitScreenEnabled,
        immersiveMode,
        musicFolderPath,
      );
}
