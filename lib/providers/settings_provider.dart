import 'package:classipod/models/settings_details.dart';
import 'package:classipod/providers/display_provider.dart';
import 'package:classipod/providers/music_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    bool isDarkMode = _sharedPreferences.getBool("isDarkMode") ?? false;
    bool repeat = _sharedPreferences.getBool("repeat") ?? false;
    bool vibrate = _sharedPreferences.getBool("vibrate") ?? true;
    bool clickWheelSound =
        _sharedPreferences.getBool("clickWheelSound") ?? false;
    bool immersiveMode = _sharedPreferences.getBool("immersiveMode") ?? false;
    String musicFolderPath = _sharedPreferences.getString("musicFolderPath") ??
        state.musicFolderPath;

    state = state.copyWith(
        isDarkMode: isDarkMode,
        repeat: repeat,
        vibrate: vibrate,
        clickWheelSound: clickWheelSound,
        immersiveMode: immersiveMode,
        musicFolderPath: musicFolderPath);

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
    await _sharedPreferences.setBool("isDarkMode", !state.isDarkMode);
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  Future<void> toggleRepeat() async {
    await _sharedPreferences.setBool("repeat", !state.repeat);
    state = state.copyWith(repeat: !state.repeat);
    await ref.read(musicProvider.notifier).setLoopMode();
  }

  Future<void> toggleVibrate() async {
    await _sharedPreferences.setBool("vibrate", !state.vibrate);
    state = state.copyWith(vibrate: !state.vibrate);
  }

  Future<void> toggleClickWheelSound(BuildContext context) async {
    await _sharedPreferences
        .setBool("clickWheelSound", !state.clickWheelSound)
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
    await _sharedPreferences.setBool("immersiveMode", !state.immersiveMode);
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
          "musicFolderPath", state.musicFolderPath);
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
