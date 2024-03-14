class SettingsDetails {
  final bool isDarkMode;
  final bool repeat;
  final bool vibrate;
  final bool immersiveMode;
  final String musicFolderPath;

  SettingsDetails(
      {required this.isDarkMode,
      required this.repeat,
      required this.vibrate,
      required this.immersiveMode,
      required this.musicFolderPath});

  SettingsDetails copyWith(
      {bool? isDarkMode,
      bool? repeat,
      bool? vibrate,
      bool? immersiveMode,
      String? musicFolderPath}) {
    return SettingsDetails(
        isDarkMode: isDarkMode ?? this.isDarkMode,
        repeat: repeat ?? this.repeat,
        vibrate: vibrate ?? this.vibrate,
        immersiveMode: immersiveMode ?? this.immersiveMode,
        musicFolderPath: musicFolderPath ?? this.musicFolderPath);
  }
}
