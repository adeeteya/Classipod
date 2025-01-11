class SettingsPreferences {
  final bool isDarkMode;
  final bool repeat;
  final bool vibrate;
  final bool clickWheelSound;
  final bool immersiveMode;
  final String musicFolderPath;

  SettingsPreferences({
    required this.isDarkMode,
    required this.repeat,
    required this.vibrate,
    required this.clickWheelSound,
    required this.immersiveMode,
    required this.musicFolderPath,
  });

  SettingsPreferences copyWith({
    bool? isDarkMode,
    bool? repeat,
    bool? vibrate,
    bool? clickWheelSound,
    bool? immersiveMode,
    String? musicFolderPath,
  }) {
    return SettingsPreferences(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      repeat: repeat ?? this.repeat,
      vibrate: vibrate ?? this.vibrate,
      clickWheelSound: clickWheelSound ?? this.clickWheelSound,
      immersiveMode: immersiveMode ?? this.immersiveMode,
      musicFolderPath: musicFolderPath ?? this.musicFolderPath,
    );
  }
}
