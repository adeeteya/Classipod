import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/providers/battery_optimization_provider.dart';
import 'package:classipod/core/services/audio_files_service.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/features/music/album/album_details_provider.dart';
import 'package:classipod/features/music/artists/artist_names_provider.dart';
import 'package:classipod/features/music/playlist/providers/playlists_provider.dart';
import 'package:classipod/features/music/songs/songs_provider.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

final splashControllerProvider =
    AsyncNotifierProvider.autoDispose<SplashControllerNotifier, void>(
  SplashControllerNotifier.new,
);

class SplashControllerNotifier extends AutoDisposeAsyncNotifier<void> {
  @override
  Future<void> build() async {
    await requestStoragePermissions();
  }

  Future<void> requestStoragePermissions() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final PermissionStatus audioPermission = await Permission.audio.request();
      if (audioPermission.isDenied) {
        throw const AudioPermissionDeniedException();
      }
      if (audioPermission.isPermanentlyDenied) {
        throw const AudioPermissionPermanentlyDeniedException();
      }

      await initializeApp();
    });
  }

  Future<void> initializeApp() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      // Load the audio files metadata
      final audioFilesMetadata =
          await ref.refresh(audioFilesServiceProvider.future);

      // Set the audio source
      await ref
          .read(audioPlayerServiceProvider.notifier)
          .setAudioSource(musicMetadataList: audioFilesMetadata);

      // Set the initial loop mode
      await ref
          .read(settingsPreferencesControllerProvider.notifier)
          .setInitialRepeatMode();

      // Invalidate the providers that depend on the audio files metadata
      ref.invalidate(albumDetailsProvider);
      ref.invalidate(artistNamesProvider);
      ref.invalidate(songsProvider);
      ref.invalidate(playlistsProvider);

      // Load the playlists
      await ref.read(playlistsProvider.notifier).init();

      final isBatteryOptimizationDisabled =
          await ref.read(batteryOptimizationProvider.future);
      if (!isBatteryOptimizationDisabled) {
        throw const BatteryOptimizationEnabledException();
      }

      // Navigate to the menu screen
      ref.read(routerProvider).goNamed(Routes.menu.name);
    });
  }
}

class AudioPermissionDeniedException implements Exception {
  const AudioPermissionDeniedException();
}

class AudioPermissionPermanentlyDeniedException implements Exception {
  const AudioPermissionPermanentlyDeniedException();
}

class BatteryOptimizationEnabledException implements Exception {
  const BatteryOptimizationEnabledException();
}
