class SettingsDetails {
  final bool isDarkMode;
  final bool repeat;
  final bool vibrate;
  final String musicFolderPath;

  SettingsDetails(
      {required this.isDarkMode,
      required this.repeat,
      required this.vibrate,
      required this.musicFolderPath});

  SettingsDetails copyWith(
      {bool? isDarkMode,
      bool? repeat,
      bool? vibrate,
      String? musicFolderPath}) {
    return SettingsDetails(
        isDarkMode: isDarkMode ?? this.isDarkMode,
        repeat: repeat ?? this.repeat,
        vibrate: vibrate ?? this.vibrate,
        musicFolderPath: musicFolderPath ?? this.musicFolderPath);
  }
}
