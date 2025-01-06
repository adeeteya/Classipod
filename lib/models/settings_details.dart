class SettingsDetails {
  final bool isDarkMode;
  final bool repeat;
  final bool vibrate;
  final bool clickWheelSound;
  final bool immersiveMode;
  final String musicFolderPath;

  SettingsDetails({
    required this.isDarkMode,
    required this.repeat,
    required this.vibrate,
    required this.clickWheelSound,
    required this.immersiveMode,
    required this.musicFolderPath,
  });

  SettingsDetails copyWith({
    bool? isDarkMode,
    bool? repeat,
    bool? vibrate,
    bool? clickWheelSound,
    bool? immersiveMode,
    String? musicFolderPath,
  }) {
    return SettingsDetails(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      repeat: repeat ?? this.repeat,
      vibrate: vibrate ?? this.vibrate,
      clickWheelSound: clickWheelSound ?? this.clickWheelSound,
      immersiveMode: immersiveMode ?? this.immersiveMode,
      musicFolderPath: musicFolderPath ?? this.musicFolderPath,
    );
  }
}
