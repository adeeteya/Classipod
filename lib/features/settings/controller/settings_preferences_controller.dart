import 'package:classipod/core/alerts/dialogs.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/features/settings/model/settings_preferences.dart';
import 'package:classipod/features/settings/repository/settings_preferences_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

final settingsPreferencesControllerProvider = AutoDisposeAsyncNotifierProvider<
    SettingsPreferencesControllerNotifier, void>(
  SettingsPreferencesControllerNotifier.new,
);

final currentSettingsPreferencesProvider = Provider<SettingsPreferences>(
  (ref) {
    final settingsPreferencesRepository =
        ref.read(settingsPreferencesRepositoryProvider);
    return SettingsPreferences(
      languageLocaleCode: settingsPreferencesRepository.getLanguageLocaleCode(),
      isDarkMode: settingsPreferencesRepository.getThemeMode(),
      isTouchScreenEnabled:
          settingsPreferencesRepository.getTouchScreenEnabled(),
      repeat: settingsPreferencesRepository.getRepeat(),
      vibrate: settingsPreferencesRepository.getVibrate(),
      clickWheelSound: settingsPreferencesRepository.getClickWheelSound(),
      splitScreenEnabled: settingsPreferencesRepository.getSplitScreenEnabled(),
      immersiveMode: settingsPreferencesRepository.getImmersiveMode(),
      musicFolderPath: settingsPreferencesRepository.getMusicFolderPath(),
    );
  },
);

class SettingsPreferencesControllerNotifier
    extends AutoDisposeAsyncNotifier<void> {
  SettingsPreferencesControllerNotifier() : super();

  @override
  Future<void> build() async {}

  Future<void> setSystemUiMode() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final bool setImmersive =
          ref.read(currentSettingsPreferencesProvider).immersiveMode;
      if (setImmersive) {
        await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      } else {
        await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      }
    });
  }

  Future<void> setLanguage(Locale locale) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref
          .read(settingsPreferencesRepositoryProvider)
          .setLanguageLocaleCode(languageLocaleCode: locale.languageCode);
      ref.invalidate(currentSettingsPreferencesProvider);
    });
  }

  Future<void> toggleTheme() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final bool isDarkMode =
          ref.read(currentSettingsPreferencesProvider).isDarkMode;
      await ref
          .read(settingsPreferencesRepositoryProvider)
          .setThemeMode(isDarkMode: !isDarkMode);
      ref.invalidate(currentSettingsPreferencesProvider);
    });
  }

  Future<void> toggleTouchScreen() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final bool isTouchScreenEnabled =
          ref.read(currentSettingsPreferencesProvider).isTouchScreenEnabled;
      await ref
          .read(settingsPreferencesRepositoryProvider)
          .setTouchScreenEnabled(isTouchScreenEnabled: !isTouchScreenEnabled);
      ref.invalidate(currentSettingsPreferencesProvider);
    });
  }

  Future<void> toggleRepeat() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      bool isRepeat = ref.read(currentSettingsPreferencesProvider).repeat;
      await ref
          .read(settingsPreferencesRepositoryProvider)
          .setRepeat(isRepeat: !isRepeat);
      isRepeat = ref.refresh(currentSettingsPreferencesProvider).repeat;
      if (isRepeat) {
        await ref
            .read(audioPlayerServiceProvider.notifier)
            .setLoopMode(LoopMode.all);
      } else {
        await ref
            .read(audioPlayerServiceProvider.notifier)
            .setLoopMode(LoopMode.off);
      }
    });
  }

  Future<void> toggleVibrate() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final bool isVibrateEnabled =
          ref.read(currentSettingsPreferencesProvider).vibrate;
      await ref
          .read(settingsPreferencesRepositoryProvider)
          .setVibrate(isVibrateEnabled: !isVibrateEnabled);
      ref.invalidate(currentSettingsPreferencesProvider);
    });
  }

  Future<void> toggleClickWheelSound(BuildContext context) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      bool isClickWheelSoundEnabled =
          ref.read(currentSettingsPreferencesProvider).clickWheelSound;
      await ref.read(settingsPreferencesRepositoryProvider).setClickWheelSound(
            isClickWheelSoundEnabled: !isClickWheelSoundEnabled,
          );

      isClickWheelSoundEnabled =
          ref.refresh(currentSettingsPreferencesProvider).clickWheelSound;

      if (isClickWheelSoundEnabled && context.mounted) {
        await Dialogs.showInfoDialog(
          context: context,
          title: context.localization.touchSoundsDialogTitle,
          content: context.localization.touchSoundsDialogContent,
        );
      }
    });
  }

  Future<void> toggleSplitScreen() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final bool isSplitScreenEnabled =
          ref.read(currentSettingsPreferencesProvider).splitScreenEnabled;
      await ref
          .read(settingsPreferencesRepositoryProvider)
          .setSplitScreenEnabled(isSplitScreenEnabled: !isSplitScreenEnabled);
      ref.invalidate(currentSettingsPreferencesProvider);
    });
  }

  Future<void> toggleImmersiveMode() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final bool isImmersiveModeEnabled =
          ref.read(currentSettingsPreferencesProvider).immersiveMode;
      await ref
          .read(settingsPreferencesRepositoryProvider)
          .setImmersiveMode(isImmersiveModeEnabled: !isImmersiveModeEnabled);
      ref.invalidate(currentSettingsPreferencesProvider);
      await setSystemUiMode();
    });
  }

  Future<void> setNewMusicFolderPath() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final oldMusicFolderPath =
          ref.read(currentSettingsPreferencesProvider).musicFolderPath;
      final String newMusicFolderPath =
          await FilePicker.platform.getDirectoryPath() ?? '/';

      if (newMusicFolderPath != '/' &&
          newMusicFolderPath != oldMusicFolderPath) {
        await ref
            .read(settingsPreferencesRepositoryProvider)
            .setMusicFolderPath(musicFolderPath: newMusicFolderPath);
        ref.invalidate(currentSettingsPreferencesProvider);
        ref.read(routerProvider).goNamed(Routes.splash.name);
      }
    });
  }
}
