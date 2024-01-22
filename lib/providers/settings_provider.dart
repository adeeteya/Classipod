import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retropod/models/settings_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsNotifier extends Notifier<SettingsDetails> {
  SettingsNotifier() : super();
  late final SharedPreferences _sharedPreferences;

  @override
  SettingsDetails build() {
    getSettingsPreferences();
    return SettingsDetails(
      isDarkMode:
          PlatformDispatcher.instance.platformBrightness == Brightness.dark,
      repeat: false,
    );
  }

  Future<void> getSettingsPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    bool isDarkMode = _sharedPreferences.getBool("isDarkMode") ?? false;
    bool repeat = _sharedPreferences.getBool("repeat") ?? false;
    state = state.copyWith(isDarkMode: isDarkMode, repeat: repeat);
  }

  Future<void> toggleTheme() async {
    await _sharedPreferences.setBool("isDarkMode", !state.isDarkMode);
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  Future<void> toggleRepeat() async {
    await _sharedPreferences.setBool("repeat", !state.repeat);
    state = state.copyWith(repeat: !state.repeat);
  }
}

final settingsProvider = NotifierProvider<SettingsNotifier, SettingsDetails>(
    () => SettingsNotifier());
