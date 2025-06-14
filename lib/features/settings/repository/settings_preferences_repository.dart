import 'package:classipod/core/constants/constants.dart';
import 'package:classipod/core/models/shared_preference_keys.dart';
import 'package:classipod/core/providers/shared_preferences_with_cache_provider.dart';
import 'package:classipod/features/settings/models/click_wheel_sensitivity.dart';
import 'package:classipod/features/settings/models/click_wheel_size.dart';
import 'package:classipod/features/settings/models/device_color.dart';
import 'package:classipod/features/settings/models/repeat_mode.dart';
import 'package:classipod/features/settings/models/volume_mode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    return _sharedPreferencesWithCache.getString(
          SharedPreferencesKeys.languageLocaleCode.name,
        ) ??
        Constants.defaultLanguageLocaleCode;
  }

  String getDeviceColor() {
    return _sharedPreferencesWithCache.getString(
          SharedPreferencesKeys.deviceColor.name,
        ) ??
        DeviceColor.silver.name;
  }

  String getClickWheelSize() {
    return _sharedPreferencesWithCache.getString(
          SharedPreferencesKeys.clickWheelSize.name,
        ) ??
        ClickWheelSize.medium.name;
  }

  String getClickWheelSensitivity() {
    return _sharedPreferencesWithCache.getString(
          SharedPreferencesKeys.clickWheelSensitivity.name,
        ) ??
        ClickWheelSensitivity.medium.name;
  }

  bool getTouchScreenEnabled() {
    return _sharedPreferencesWithCache.getBool(
          SharedPreferencesKeys.isTouchScreenEnabled.name,
        ) ??
        true;
  }

  String getRepeatMode() {
    return _sharedPreferencesWithCache.getString(
          SharedPreferencesKeys.repeatMode.name,
        ) ??
        RepeatMode.off.name;
  }

  bool getVibrate() {
    return _sharedPreferencesWithCache.getBool(
          SharedPreferencesKeys.vibrate.name,
        ) ??
        true;
  }

  bool getSplitScreenEnabled() {
    return _sharedPreferencesWithCache.getBool(
          SharedPreferencesKeys.splitScreenEnabled.name,
        ) ??
        true;
  }

  bool getClickWheelSound() {
    return _sharedPreferencesWithCache.getBool(
          SharedPreferencesKeys.clickWheelSound.name,
        ) ??
        false;
  }

  String getVolumeMode() {
    return _sharedPreferencesWithCache.getString(
          SharedPreferencesKeys.volumeMode.name,
        ) ??
        VolumeMode.app.name;
  }

  bool getImmersiveMode() {
    return _sharedPreferencesWithCache.getBool(
          SharedPreferencesKeys.immersiveMode.name,
        ) ??
        false;
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

  Future<void> setClickWheelSize({required String clickWheelSizeName}) async {
    return _sharedPreferencesWithCache.setString(
      SharedPreferencesKeys.clickWheelSize.name,
      clickWheelSizeName,
    );
  }

  Future<void> setClickWheelSensitivity({
    required String clickWheelSensitivityName,
  }) async {
    return _sharedPreferencesWithCache.setString(
      SharedPreferencesKeys.clickWheelSensitivity.name,
      clickWheelSensitivityName,
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

  Future<void> setVolumeMode({required String volumeModeName}) async {
    return _sharedPreferencesWithCache.setString(
      SharedPreferencesKeys.volumeMode.name,
      volumeModeName,
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
}
