import 'package:classipod/models/settings_details.dart';
import 'package:classipod/providers/display_provider.dart';
import 'package:classipod/providers/music_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharedPreferencesKeys {
  darkMode,
  repeat,
  vibrate,
  clickWheelSound,
  immersiveMode,
  musicFolderPath,
}

class SettingsNotifier extends Notifier<SettingsDetails> {
  SettingsNotifier() : super();
  late final SharedPreferencesWithCache _sharedPreferences;
  final List<String> settingsListTiles = [
    "About",
    "Dark Mode",
    "Repeat",
    "Vibrate",
    "Click Wheel Sound",
    "Immersive Mode",
    "Change Directory",
    "Donate",
  ];

  @override
  SettingsDetails build() {
    getSettingsPreferences();
    return SettingsDetails(
      isDarkMode: true,
      repeat: false,
      vibrate: true,
      clickWheelSound: false,
      immersiveMode: false,
      musicFolderPath: "/storage/emulated/0/Music",
    );
  }

  Future<void> getSettingsPreferences() async {
    _sharedPreferences = await SharedPreferencesWithCache.create(
      cacheOptions: SharedPreferencesWithCacheOptions(),
    );
    bool isDarkMode =
        _sharedPreferences.getBool(SharedPreferencesKeys.darkMode.name) ??
            false;
    bool repeat =
        _sharedPreferences.getBool(SharedPreferencesKeys.repeat.name) ?? false;
    bool vibrate =
        _sharedPreferences.getBool(SharedPreferencesKeys.vibrate.name) ?? true;
    bool clickWheelSound = _sharedPreferences
            .getBool(SharedPreferencesKeys.clickWheelSound.name) ??
        false;
    bool immersiveMode =
        _sharedPreferences.getBool(SharedPreferencesKeys.immersiveMode.name) ??
            false;
    String musicFolderPath = _sharedPreferences
            .getString(SharedPreferencesKeys.musicFolderPath.name) ??
        state.musicFolderPath;

    state = state.copyWith(
      isDarkMode: isDarkMode,
      repeat: repeat,
      vibrate: vibrate,
      clickWheelSound: clickWheelSound,
      immersiveMode: immersiveMode,
      musicFolderPath: musicFolderPath,
    );

    await setSystemUiMode();
  }

  Future<void> setSystemUiMode() async {
    if (state.immersiveMode) {
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    } else {
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
  }

  Future<void> toggleTheme() async {
    await _sharedPreferences.setBool(
        SharedPreferencesKeys.darkMode.name, !state.isDarkMode);
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  Future<void> toggleRepeat() async {
    await _sharedPreferences.setBool(
        SharedPreferencesKeys.repeat.name, !state.repeat);
    state = state.copyWith(repeat: !state.repeat);
    await ref.read(musicProvider.notifier).setLoopMode();
  }

  Future<void> toggleVibrate() async {
    await _sharedPreferences.setBool(
        SharedPreferencesKeys.vibrate.name, !state.vibrate);
    state = state.copyWith(vibrate: !state.vibrate);
  }

  Future<void> toggleClickWheelSound(BuildContext context) async {
    await _sharedPreferences
        .setBool(
            SharedPreferencesKeys.clickWheelSound.name, !state.clickWheelSound)
        .then((value) async {
      state = state.copyWith(clickWheelSound: !state.clickWheelSound);
      if (state.clickWheelSound && context.mounted) {
        await showCupertinoDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) => CupertinoAlertDialog(
            title: const Text("Touch Sounds"),
            content: const Text(
                "Please Enable Touch Sounds from System Settings to hear the click wheel sounds"),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () => context.pop(),
                child: const Text("OK"),
              )
            ],
          ),
        );
      }
    });
  }

  Future<void> toggleImmersiveMode() async {
    await _sharedPreferences.setBool(
        SharedPreferencesKeys.immersiveMode.name, !state.immersiveMode);
    state = state.copyWith(immersiveMode: !state.immersiveMode);
    await setSystemUiMode();
  }

  Future<void> getMusicFolderPath(BuildContext context) async {
    String newMusicFolderPath =
        await FilePicker.platform.getDirectoryPath() ?? '/';
    if (newMusicFolderPath != '/' &&
        newMusicFolderPath != state.musicFolderPath) {
      state = state.copyWith(musicFolderPath: newMusicFolderPath);
      await _sharedPreferences.setString(
          SharedPreferencesKeys.musicFolderPath.name, state.musicFolderPath);
      if (context.mounted) {
        ref.read(displayProvider.notifier).restartApp(context);
      }
    }
  }

  bool? isOn(int index) {
    switch (index) {
      case 1:
        return state.isDarkMode;
      case 2:
        return state.repeat;
      case 3:
        return state.vibrate;
      case 4:
        return state.clickWheelSound;
      case 5:
        return state.immersiveMode;
      default:
        return null;
    }
  }
}

final settingsProvider = NotifierProvider<SettingsNotifier, SettingsDetails>(
  () => SettingsNotifier(),
);
