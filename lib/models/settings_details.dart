class SettingsDetails {
  final bool isDarkMode;
  final bool repeat;

  SettingsDetails({required this.isDarkMode, required this.repeat});

  SettingsDetails copyWith({bool? isDarkMode, bool? repeat}) {
    return SettingsDetails(
        isDarkMode: isDarkMode ?? this.isDarkMode,
        repeat: repeat ?? this.repeat);
  }
}
