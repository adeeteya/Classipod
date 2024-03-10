import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retropod/models/settings_details.dart';
import 'package:retropod/providers/display_provider.dart';
import 'package:retropod/providers/music_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsNotifier extends Notifier<SettingsDetails> {
  SettingsNotifier() : super();
  late final SharedPreferences _sharedPreferences;
  final List<String> settingsListTiles = [
    "Dark Mode",
    "Repeat",
    "Vibrate",
    "Change Directory"
  ];

  @override
  SettingsDetails build() {
    getSettingsPreferences();
    return SettingsDetails(
      isDarkMode: true,
      repeat: false,
      vibrate: true,
      musicFolderPath: "/storage/emulated/0/Music",
    );
  }

  Future<void> getSettingsPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    bool isDarkMode = _sharedPreferences.getBool("isDarkMode") ?? false;
    bool repeat = _sharedPreferences.getBool("repeat") ?? false;
    bool vibrate = _sharedPreferences.getBool("vibrate") ?? true;
    String musicFolderPath = _sharedPreferences.getString("musicFolderPath") ??
        state.musicFolderPath;

    state = state.copyWith(
        isDarkMode: isDarkMode,
        repeat: repeat,
        vibrate: vibrate,
        musicFolderPath: musicFolderPath);
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

  Future<void> getMusicFolderPath(BuildContext context) async {
    String newMusicFolderPath =
        await FilePicker.platform.getDirectoryPath() ?? '/';
    if (newMusicFolderPath != '/' &&
        newMusicFolderPath != state.musicFolderPath) {
      state = state.copyWith(musicFolderPath: newMusicFolderPath);
      await _sharedPreferences
          .setString("musicFolderPath", state.musicFolderPath)
          .then((_) => ref.read(displayProvider.notifier).restartApp(context));
    }
  }

  bool? isOn(int index) {
    switch (index) {
      case 0:
        return state.isDarkMode;
      case 1:
        return state.repeat;
      case 2:
        return state.vibrate;
      default:
        return null;
    }
  }
}

final settingsProvider = NotifierProvider<SettingsNotifier, SettingsDetails>(
    () => SettingsNotifier());
