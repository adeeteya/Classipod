import 'package:classipod/core/constants.dart';
import 'package:classipod/core/providers.dart';
import 'package:classipod/models/settings_details.dart';
import 'package:classipod/providers/music_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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

  @override
  SettingsDetails build() {
    return getSettingsPreferences();
  }

  SettingsDetails getSettingsPreferences() {
    final bool isDarkMode = ref
            .read(sharedPreferencesWithCacheProvider)
            .getBool(SharedPreferencesKeys.darkMode.name) ??
        false;
    final bool repeat = ref
            .read(sharedPreferencesWithCacheProvider)
            .getBool(SharedPreferencesKeys.repeat.name) ??
        false;
    final bool vibrate = ref
            .read(sharedPreferencesWithCacheProvider)
            .getBool(SharedPreferencesKeys.vibrate.name) ??
        true;
    final bool clickWheelSound = ref
            .read(sharedPreferencesWithCacheProvider)
            .getBool(SharedPreferencesKeys.clickWheelSound.name) ??
        false;
    final bool immersiveMode = ref
            .read(sharedPreferencesWithCacheProvider)
            .getBool(SharedPreferencesKeys.immersiveMode.name) ??
        false;
    final String musicFolderPath = ref
            .read(sharedPreferencesWithCacheProvider)
            .getString(SharedPreferencesKeys.musicFolderPath.name) ??
        kDefaultMusicFolderPath;

    setSystemUiMode(immersiveMode);

    return SettingsDetails(
      isDarkMode: isDarkMode,
      repeat: repeat,
      vibrate: vibrate,
      clickWheelSound: clickWheelSound,
      immersiveMode: immersiveMode,
      musicFolderPath: musicFolderPath,
    );
  }

  Future<void> setSystemUiMode(bool setImmersive) async {
    if (setImmersive) {
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    } else {
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
  }

  Future<void> toggleTheme() async {
    await ref
        .read(sharedPreferencesWithCacheProvider)
        .setBool(SharedPreferencesKeys.darkMode.name, !state.isDarkMode);
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  Future<void> toggleRepeat() async {
    await ref
        .read(sharedPreferencesWithCacheProvider)
        .setBool(SharedPreferencesKeys.repeat.name, !state.repeat);
    state = state.copyWith(repeat: !state.repeat);
    await ref.read(musicProvider.notifier).setLoopMode();
  }

  Future<void> toggleVibrate() async {
    await ref
        .read(sharedPreferencesWithCacheProvider)
        .setBool(SharedPreferencesKeys.vibrate.name, !state.vibrate);
    state = state.copyWith(vibrate: !state.vibrate);
  }

  Future<void> toggleClickWheelSound(BuildContext context) async {
    await ref
        .read(sharedPreferencesWithCacheProvider)
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
    await ref.read(sharedPreferencesWithCacheProvider).setBool(
        SharedPreferencesKeys.immersiveMode.name, !state.immersiveMode);
    state = state.copyWith(immersiveMode: !state.immersiveMode);
    await setSystemUiMode(state.immersiveMode);
  }

  void restartApp() {
    ref.read(musicProvider.notifier).setLoading(true);
    ref.read(musicProvider.notifier).getAllAudioFiles();
  }

  Future<void> getMusicFolderPath() async {
    final String newMusicFolderPath =
        await FilePicker.platform.getDirectoryPath() ?? '/';
    if (newMusicFolderPath != '/' &&
        newMusicFolderPath != state.musicFolderPath) {
      state = state.copyWith(musicFolderPath: newMusicFolderPath);
      await ref.read(sharedPreferencesWithCacheProvider).setString(
          SharedPreferencesKeys.musicFolderPath.name, state.musicFolderPath);
      restartApp();
    }
  }
}

final settingsProvider = NotifierProvider<SettingsNotifier, SettingsDetails>(
  () => SettingsNotifier(),
);
