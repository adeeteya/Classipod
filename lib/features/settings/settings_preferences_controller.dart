import 'package:classipod/core/dialogs.dart';
import 'package:classipod/core/routes.dart';
import 'package:classipod/features/settings/settings_preferences_provider.dart';
import 'package:classipod/repositories/settings_preferences_repository.dart';
import 'package:classipod/services/audio_player_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

final settingsPreferencesControllerProvider =
    AsyncNotifierProvider<SettingsPreferencesControllerNotifier, void>(
  SettingsPreferencesControllerNotifier.new,
);

class SettingsPreferencesControllerNotifier extends AsyncNotifier<void> {
  SettingsPreferencesControllerNotifier() : super();

  @override
  Future<void> build() async {
    await setSystemUiMode();
  }

  Future<void> setSystemUiMode() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final bool setImmersive =
          ref.read(settingsPreferencesProvider).immersiveMode;
      if (setImmersive) {
        await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      } else {
        await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      }
    });
  }

  Future<void> toggleTheme() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final bool isDarkMode = ref.read(settingsPreferencesProvider).isDarkMode;
      await ref
          .read(settingsPreferencesRepositoryProvider)
          .setThemeMode(isDarkMode: !isDarkMode);
      ref.invalidate(settingsPreferencesProvider);
    });
  }

  Future<void> toggleRepeat() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      bool isRepeat = ref.read(settingsPreferencesProvider).repeat;
      await ref
          .read(settingsPreferencesRepositoryProvider)
          .setRepeat(isRepeat: !isRepeat);
      isRepeat = ref.refresh(settingsPreferencesProvider).repeat;
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
          ref.read(settingsPreferencesProvider).vibrate;
      await ref
          .read(settingsPreferencesRepositoryProvider)
          .setVibrate(isVibrateEnabled: !isVibrateEnabled);
      ref.invalidate(settingsPreferencesProvider);
    });
  }

  Future<void> toggleClickWheelSound(BuildContext context) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      bool isClickWheelSoundEnabled =
          ref.read(settingsPreferencesProvider).clickWheelSound;
      await ref.read(settingsPreferencesRepositoryProvider).setClickWheelSound(
            isClickWheelSoundEnabled: !isClickWheelSoundEnabled,
          );

      isClickWheelSoundEnabled =
          ref.refresh(settingsPreferencesProvider).clickWheelSound;

      if (isClickWheelSoundEnabled && context.mounted) {
        await Dialogs.showInfoDialog(
          context: context,
          title: "Touch Sounds",
          content:
              "Please Enable Touch Sounds from System Settings to hear the click wheel sounds",
        );
      }
    });
  }

  Future<void> toggleImmersiveMode() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final bool isImmersiveModeEnabled =
          ref.read(settingsPreferencesProvider).immersiveMode;
      await ref
          .read(settingsPreferencesRepositoryProvider)
          .setImmersiveMode(isImmersiveModeEnabled: !isImmersiveModeEnabled);
      ref.invalidate(settingsPreferencesProvider);
      await setSystemUiMode();
    });
  }

  Future<void> setNewMusicFolderPath() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final String newMusicFolderPath =
          await FilePicker.platform.getDirectoryPath() ?? '/';
      final oldMusicFolderPath =
          ref.read(settingsPreferencesProvider).musicFolderPath;
      if (newMusicFolderPath != '/' &&
          newMusicFolderPath != oldMusicFolderPath) {
        await ref
            .read(settingsPreferencesRepositoryProvider)
            .setMusicFolderPath(musicFolderPath: newMusicFolderPath);
        ref.invalidate(settingsPreferencesProvider);
        ref.read(routerProvider).goNamed(Routes.splash.name);
      }
    });
  }
}
