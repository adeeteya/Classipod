import 'package:classipod/models/settings_details.dart';
import 'package:classipod/repositories/settings_preferences_repository.dart';
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
