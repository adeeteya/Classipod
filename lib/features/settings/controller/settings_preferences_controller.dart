import 'package:classipod/core/alerts/dialogs.dart';
import 'package:classipod/core/constants/constants.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/models/metadata.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/features/music/playlist/models/playlist_model.dart';
import 'package:classipod/features/settings/model/device_color.dart';
import 'package:classipod/features/settings/model/repeat_mode.dart';
import 'package:classipod/features/settings/model/settings_preferences.dart';
import 'package:classipod/features/settings/repository/settings_preferences_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:just_audio/just_audio.dart';

final settingsPreferencesControllerProvider = NotifierProvider<
    SettingsPreferencesControllerNotifier, SettingsPreferences>(
  SettingsPreferencesControllerNotifier.new,
);

class SettingsPreferencesControllerNotifier
    extends Notifier<SettingsPreferences> {
  SettingsPreferencesControllerNotifier() : super();

  @override
  SettingsPreferences build() {
    final settingsPreferencesRepository =
        ref.read(settingsPreferencesRepositoryProvider);
    return SettingsPreferences(
      languageLocaleCode: settingsPreferencesRepository.getLanguageLocaleCode(),
      deviceColor: DeviceColor.values
          .byName(settingsPreferencesRepository.getDeviceColor()),
      isTouchScreenEnabled:
          settingsPreferencesRepository.getTouchScreenEnabled(),
      repeatMode: RepeatMode.values
          .byName(settingsPreferencesRepository.getRepeatMode()),
      vibrate: settingsPreferencesRepository.getVibrate(),
      clickWheelSound: settingsPreferencesRepository.getClickWheelSound(),
      splitScreenEnabled: settingsPreferencesRepository.getSplitScreenEnabled(),
      immersiveMode: settingsPreferencesRepository.getImmersiveMode(),
      musicFolderPath: settingsPreferencesRepository.getMusicFolderPath(),
    );
  }

  Future<void> setSystemUiMode() async {
    if (state.immersiveMode) {
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    } else {
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
  }

  Future<void> setInitialRepeatMode() async {
    switch (state.repeatMode) {
      case RepeatMode.off:
        await ref
            .read(audioPlayerServiceProvider.notifier)
            .setLoopMode(LoopMode.off);
        break;
      case RepeatMode.one:
        // in case app starts with repeat mode one, set the loop mode to all
        await ref
            .read(settingsPreferencesRepositoryProvider)
            .setRepeatMode(repeatModeName: RepeatMode.all.name);
        state = state.copyWith(repeatMode: RepeatMode.all);
      case RepeatMode.all:
        await ref
            .read(audioPlayerServiceProvider.notifier)
            .setLoopMode(LoopMode.all);
        break;
    }
  }

  Future<void> setLanguage(Locale locale) async {
    state = state.copyWith(languageLocaleCode: locale.languageCode);
    await ref
        .read(settingsPreferencesRepositoryProvider)
        .setLanguageLocaleCode(languageLocaleCode: locale.languageCode);
  }

  Future<void> toggleDeviceColor() async {
    switch (state.deviceColor) {
      case DeviceColor.silver:
        await ref
            .read(settingsPreferencesRepositoryProvider)
            .setDeviceColor(deviceColorName: DeviceColor.black.name);
        state = state.copyWith(deviceColor: DeviceColor.black);
        break;
      case DeviceColor.black:
        await ref
            .read(settingsPreferencesRepositoryProvider)
            .setDeviceColor(deviceColorName: DeviceColor.silver.name);
        state = state.copyWith(deviceColor: DeviceColor.silver);
        break;
    }
  }

  Future<void> toggleTouchScreen() async {
    state = state.copyWith(isTouchScreenEnabled: !state.isTouchScreenEnabled);

    await ref.read(settingsPreferencesRepositoryProvider).setTouchScreenEnabled(
          isTouchScreenEnabled: state.isTouchScreenEnabled,
        );
  }

  Future<void> toggleRepeatMode() async {
    switch (state.repeatMode) {
      case RepeatMode.off:
        state = state.copyWith(repeatMode: RepeatMode.one);
        await ref
            .read(settingsPreferencesRepositoryProvider)
            .setRepeatMode(repeatModeName: RepeatMode.one.name);
        break;
      case RepeatMode.one:
        state = state.copyWith(repeatMode: RepeatMode.all);
        await ref
            .read(settingsPreferencesRepositoryProvider)
            .setRepeatMode(repeatModeName: RepeatMode.all.name);
        break;
      case RepeatMode.all:
        state = state.copyWith(repeatMode: RepeatMode.off);
        await ref
            .read(settingsPreferencesRepositoryProvider)
            .setRepeatMode(repeatModeName: RepeatMode.off.name);
        break;
    }
    await ref
        .read(audioPlayerServiceProvider.notifier)
        .setLoopMode(state.repeatMode.toLoopMode());
  }

  Future<void> toggleVibrate() async {
    state = state.copyWith(vibrate: !state.vibrate);
    await ref
        .read(settingsPreferencesRepositoryProvider)
        .setVibrate(isVibrateEnabled: state.vibrate);
  }

  Future<void> toggleClickWheelSound(BuildContext context) async {
    state = state.copyWith(clickWheelSound: !state.clickWheelSound);

    await ref.read(settingsPreferencesRepositoryProvider).setClickWheelSound(
          isClickWheelSoundEnabled: state.clickWheelSound,
        );

    if (state.clickWheelSound && context.mounted) {
      await Dialogs.showInfoDialog(
        context: context,
        title: context.localization.touchSoundsDialogTitle,
        content: context.localization.touchSoundsDialogContent,
      );
    }
  }

  Future<void> toggleSplitScreen() async {
    state = state.copyWith(splitScreenEnabled: !state.splitScreenEnabled);
    await ref
        .read(settingsPreferencesRepositoryProvider)
        .setSplitScreenEnabled(isSplitScreenEnabled: state.splitScreenEnabled);
  }

  Future<void> toggleImmersiveMode() async {
    state = state.copyWith(immersiveMode: !state.immersiveMode);
    await ref
        .read(settingsPreferencesRepositoryProvider)
        .setImmersiveMode(isImmersiveModeEnabled: state.immersiveMode);
    await setSystemUiMode();
  }

  Future<void> rescanMusicFiles({bool clearPlaylists = false}) async {
    await Hive.box<Metadata>(Constants.metadataBoxName).clear();
    if (clearPlaylists) {
      await Hive.box<PlaylistModel>(Constants.playlistBoxName).clear();
    }
    ref.read(routerProvider).goNamed(Routes.splash.name);
  }

  Future<void> setNewMusicFolderPath() async {
    final String newMusicFolderPath =
        await FilePicker.platform.getDirectoryPath() ?? '/';

    if (newMusicFolderPath != '/' &&
        newMusicFolderPath != state.musicFolderPath) {
      state = state.copyWith(musicFolderPath: newMusicFolderPath);
      await ref
          .read(settingsPreferencesRepositoryProvider)
          .setMusicFolderPath(musicFolderPath: newMusicFolderPath);
      await rescanMusicFiles(clearPlaylists: true);
    }
  }

  Future<void> resetSettings() async {
    await ref
        .read(settingsPreferencesRepositoryProvider)
        .setLanguageLocaleCode(languageLocaleCode: 'en');
    await ref
        .read(settingsPreferencesRepositoryProvider)
        .setDeviceColor(deviceColorName: DeviceColor.silver.name);
    await ref
        .read(settingsPreferencesRepositoryProvider)
        .setTouchScreenEnabled(isTouchScreenEnabled: true);
    await ref
        .read(settingsPreferencesRepositoryProvider)
        .setRepeatMode(repeatModeName: RepeatMode.off.name);
    await ref
        .read(settingsPreferencesRepositoryProvider)
        .setVibrate(isVibrateEnabled: true);
    await ref
        .read(settingsPreferencesRepositoryProvider)
        .setClickWheelSound(isClickWheelSoundEnabled: false);
    await ref
        .read(settingsPreferencesRepositoryProvider)
        .setSplitScreenEnabled(isSplitScreenEnabled: true);
    await ref
        .read(settingsPreferencesRepositoryProvider)
        .setImmersiveMode(isImmersiveModeEnabled: false);
    await ref.read(settingsPreferencesRepositoryProvider).setMusicFolderPath(
          musicFolderPath: Constants.defaultMusicFolderPath,
        );
    ref.invalidateSelf();
  }
}
