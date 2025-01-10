import 'package:classipod/core/constants.dart';
import 'package:classipod/providers/shared_preferences_with_cache_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharedPreferencesKeys {
  darkMode,
  repeat,
  vibrate,
  clickWheelSound,
  immersiveMode,
  musicFolderPath,
}

final settingsPreferencesRepositoryProvider =
    Provider.autoDispose<SettingsPreferencesRepository>((ref) {
  return SettingsPreferencesRepository(
    ref.read(sharedPreferencesWithCacheProvider).requireValue,
  );
});

class SettingsPreferencesRepository {
  final SharedPreferencesWithCache _sharedPreferencesWithCache;

  SettingsPreferencesRepository(this._sharedPreferencesWithCache);

  bool getThemeMode() {
    return _sharedPreferencesWithCache
            .getBool(SharedPreferencesKeys.darkMode.name) ??
        false;
  }

  bool getRepeat() {
    return _sharedPreferencesWithCache
            .getBool(SharedPreferencesKeys.repeat.name) ??
        false;
  }

  bool getVibrate() {
    return _sharedPreferencesWithCache
            .getBool(SharedPreferencesKeys.vibrate.name) ??
        true;
  }

  bool getClickWheelSound() {
    return _sharedPreferencesWithCache
            .getBool(SharedPreferencesKeys.clickWheelSound.name) ??
        false;
  }

  bool getImmersiveMode() {
    return _sharedPreferencesWithCache
            .getBool(SharedPreferencesKeys.immersiveMode.name) ??
        false;
  }

  String getMusicFolderPath() {
    return _sharedPreferencesWithCache
            .getString(SharedPreferencesKeys.musicFolderPath.name) ??
        kDefaultMusicFolderPath;
  }

  Future<void> setThemeMode({required bool isDarkMode}) async {
    return _sharedPreferencesWithCache.setBool(
      SharedPreferencesKeys.darkMode.name,
      isDarkMode,
    );
  }

  Future<void> setRepeat({required bool isRepeat}) async {
    return _sharedPreferencesWithCache.setBool(
      SharedPreferencesKeys.repeat.name,
      isRepeat,
    );
  }

  Future<void> setVibrate({required bool isVibrateEnabled}) async {
    return _sharedPreferencesWithCache.setBool(
      SharedPreferencesKeys.vibrate.name,
      isVibrateEnabled,
    );
  }

  Future<void> setClickWheelSound({
    required bool isClickWheelSoundEnabled,
  }) async {
    return _sharedPreferencesWithCache.setBool(
      SharedPreferencesKeys.clickWheelSound.name,
      isClickWheelSoundEnabled,
    );
  }

  Future<void> setImmersiveMode({required bool isImmersiveModeEnabled}) async {
    return _sharedPreferencesWithCache.setBool(
      SharedPreferencesKeys.immersiveMode.name,
      isImmersiveModeEnabled,
    );
  }

  Future<void> setMusicFolderPath({required String musicFolderPath}) async {
    return _sharedPreferencesWithCache.setString(
      SharedPreferencesKeys.musicFolderPath.name,
      musicFolderPath,
    );
  }
}
