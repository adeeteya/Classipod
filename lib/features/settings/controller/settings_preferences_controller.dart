import 'dart:async';
import 'dart:io' as io;

import 'package:classipod/core/alerts/dialogs.dart';
import 'package:classipod/core/constants/constants.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/features/music/playlist/models/playlist_model.dart';
import 'package:classipod/features/settings/models/click_wheel_size.dart';
import 'package:classipod/features/settings/models/device_color.dart';
import 'package:classipod/features/settings/models/repeat_mode.dart';
import 'package:classipod/features/settings/models/settings_preferences_model.dart';
import 'package:classipod/features/settings/repository/settings_preferences_repository.dart';
import 'package:classipod/features/tutorial/controller/tutorial_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:just_audio/just_audio.dart';
import 'package:universal_html/html.dart';

final settingsPreferencesControllerProvider = NotifierProvider<
  SettingsPreferencesControllerNotifier,
  SettingsPreferencesModel
>(SettingsPreferencesControllerNotifier.new);

class SettingsPreferencesControllerNotifier
    extends Notifier<SettingsPreferencesModel> {
  SettingsPreferencesControllerNotifier() : super();

  @override
  SettingsPreferencesModel build() {
    final settingsPreferencesRepository = ref.read(
      settingsPreferencesRepositoryProvider,
    );
    return SettingsPreferencesModel(
      languageLocaleCode: settingsPreferencesRepository.getLanguageLocaleCode(),
      deviceColor: DeviceColor.values.byName(
        settingsPreferencesRepository.getDeviceColor(),
      ),
      clickWheelSize: ClickWheelSize.values.byName(
        settingsPreferencesRepository.getClickWheelSize(),
      ),
      isTouchScreenEnabled:
          settingsPreferencesRepository.getTouchScreenEnabled(),
      repeatMode: RepeatMode.values.byName(
        settingsPreferencesRepository.getRepeatMode(),
      ),
      vibrate: settingsPreferencesRepository.getVibrate(),
      clickWheelSound: settingsPreferencesRepository.getClickWheelSound(),
      splitScreenEnabled: settingsPreferencesRepository.getSplitScreenEnabled(),
      immersiveMode: settingsPreferencesRepository.getImmersiveMode(),
    );
  }

  Future<void> setSystemUiMode() async {
    if (kIsWeb) {
      if (state.immersiveMode) {
        // ignore: unawaited_futures
        document.documentElement?.requestFullscreen();
      } else {
        document.exitFullscreen();
      }
    } else if (io.Platform.isAndroid || io.Platform.isIOS) {
      if (state.immersiveMode) {
        await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      } else {
        await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      }
    }
  }

  void setAudioSource({required bool isOnlineAudioSource}) {
    if (isOnlineAudioSource) {
      state = state.copyWith(fetchOnlineMusic: true);
    } else {
      state = state.copyWith(fetchOnlineMusic: false);
    }
  }

  Future<void> showAppTutorial() async {
    await ref.read(tutorialControllerProvider.notifier).resetTutorials();
    ref.read(routerProvider).goNamed(Routes.menu.name);
    Future.delayed(const Duration(milliseconds: 500), () {
      ref.read(tutorialControllerProvider.notifier).playMenuTutorial();
    });
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

  Future<void> toggleClickWheelSize() async {
    switch (state.clickWheelSize) {
      case ClickWheelSize.small:
        await ref
            .read(settingsPreferencesRepositoryProvider)
            .setClickWheelSize(clickWheelSizeName: ClickWheelSize.medium.name);
        state = state.copyWith(clickWheelSize: ClickWheelSize.medium);
        break;
      case ClickWheelSize.medium:
        await ref
            .read(settingsPreferencesRepositoryProvider)
            .setClickWheelSize(clickWheelSizeName: ClickWheelSize.large.name);
        state = state.copyWith(clickWheelSize: ClickWheelSize.large);
        break;
      case ClickWheelSize.large:
        await ref
            .read(settingsPreferencesRepositoryProvider)
            .setClickWheelSize(clickWheelSizeName: ClickWheelSize.small.name);
        state = state.copyWith(clickWheelSize: ClickWheelSize.small);
        break;
    }
  }

  Future<void> toggleTouchScreen() async {
    state = state.copyWith(isTouchScreenEnabled: !state.isTouchScreenEnabled);

    await ref
        .read(settingsPreferencesRepositoryProvider)
        .setTouchScreenEnabled(
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

    await ref
        .read(settingsPreferencesRepositoryProvider)
        .setClickWheelSound(isClickWheelSoundEnabled: state.clickWheelSound);

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
    await Hive.box<MusicMetadata>(Constants.metadataBoxName).clear();
    if (clearPlaylists) {
      await Hive.box<PlaylistModel>(Constants.playlistBoxName).clear();
    }
    ref.read(routerProvider).goNamed(Routes.splash.name);
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
    ref.invalidateSelf();
  }
}
