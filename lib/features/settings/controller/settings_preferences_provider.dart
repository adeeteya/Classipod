import 'package:classipod/features/settings/model/settings_preferences.dart';
import 'package:classipod/features/settings/repository/settings_preferences_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingsPreferencesProvider = Provider<SettingsPreferences>(
  (ref) {
    final settingsPreferencesRepository =
        ref.read(settingsPreferencesRepositoryProvider);
    return SettingsPreferences(
      isDarkMode: settingsPreferencesRepository.getThemeMode(),
      repeat: settingsPreferencesRepository.getRepeat(),
      vibrate: settingsPreferencesRepository.getVibrate(),
      clickWheelSound: settingsPreferencesRepository.getClickWheelSound(),
      immersiveMode: settingsPreferencesRepository.getImmersiveMode(),
      musicFolderPath: settingsPreferencesRepository.getMusicFolderPath(),
    );
  },
);
