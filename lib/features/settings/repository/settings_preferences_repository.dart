import 'package:classipod/core/constants/constants.dart';
import 'package:classipod/core/providers/shared_preferences_with_cache_provider.dart';
import 'package:classipod/features/settings/models/device_color.dart';
import 'package:classipod/features/settings/models/repeat_mode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharedPreferencesKeys {
  languageLocaleCode,
  deviceColor,
  isTouchScreenEnabled,
  repeatMode,
  vibrate,
  clickWheelSound,
  splitScreenEnabled,
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

  String getLanguageLocaleCode() {
    return _sharedPreferencesWithCache
            .getString(SharedPreferencesKeys.languageLocaleCode.name) ??
        Constants.defaultLanguageLocaleCode;
  }

  String getDeviceColor() {
    return _sharedPreferencesWithCache
            .getString(SharedPreferencesKeys.deviceColor.name) ??
        DeviceColor.silver.name;
  }

  bool getTouchScreenEnabled() {
    return _sharedPreferencesWithCache
            .getBool(SharedPreferencesKeys.isTouchScreenEnabled.name) ??
        true;
  }

  String getRepeatMode() {
    return _sharedPreferencesWithCache
            .getString(SharedPreferencesKeys.repeatMode.name) ??
        RepeatMode.off.name;
  }

  bool getVibrate() {
    return _sharedPreferencesWithCache
            .getBool(SharedPreferencesKeys.vibrate.name) ??
        true;
  }

  bool getSplitScreenEnabled() {
    return _sharedPreferencesWithCache
            .getBool(SharedPreferencesKeys.splitScreenEnabled.name) ??
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
        Constants.defaultMusicFolderPath;
  }

  Future<void> setLanguageLocaleCode({
    required String languageLocaleCode,
  }) async {
    return _sharedPreferencesWithCache.setString(
      SharedPreferencesKeys.languageLocaleCode.name,
      languageLocaleCode,
    );
  }

  Future<void> setDeviceColor({required String deviceColorName}) async {
    return _sharedPreferencesWithCache.setString(
      SharedPreferencesKeys.deviceColor.name,
      deviceColorName,
    );
  }

  Future<void> setTouchScreenEnabled({
    required bool isTouchScreenEnabled,
  }) async {
    return _sharedPreferencesWithCache.setBool(
      SharedPreferencesKeys.isTouchScreenEnabled.name,
      isTouchScreenEnabled,
    );
  }

  Future<void> setRepeatMode({required String repeatModeName}) async {
    return _sharedPreferencesWithCache.setString(
      SharedPreferencesKeys.repeatMode.name,
      repeatModeName,
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

  Future<void> setSplitScreenEnabled({
    required bool isSplitScreenEnabled,
  }) async {
    return _sharedPreferencesWithCache.setBool(
      SharedPreferencesKeys.splitScreenEnabled.name,
      isSplitScreenEnabled,
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
