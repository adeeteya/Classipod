import 'dart:io';

import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/providers/filtered_audio_files_provider.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/features/music/album/providers/album_details_provider.dart';
import 'package:classipod/features/music/artists/providers/artist_names_provider.dart';
import 'package:classipod/features/music/genres/providers/genres_provider.dart';
import 'package:classipod/features/music/playlist/providers/playlists_provider.dart';
import 'package:classipod/features/music/songs/provider/songs_provider.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:classipod/features/tutorial/controller/tutorial_controller.dart';
import 'package:flutter/foundation.dart';
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
      if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
        final PermissionStatus audioPermission =
            await Permission.audio.request();
        final PermissionStatus genericStoragePermission =
            await Permission.storage.request();
        if (audioPermission.isDenied && genericStoragePermission.isDenied) {
          throw const AudioPermissionDeniedException();
        }
        if (audioPermission.isPermanentlyDenied &&
            genericStoragePermission.isPermanentlyDenied) {
          throw const AudioPermissionPermanentlyDeniedException();
        }
      }

      await initializeApp();
    });
  }

  Future<void> initializeApp() async {
    // Load the filtered audio files metadata
    final filteredAudioFilesMetadata = await ref
        .read(filteredAudioFilesProvider.future)
        .then((value) => value.toList());

    // Set the audio source
    await ref
        .read(audioPlayerServiceProvider.notifier)
        .setAudioSource(musicMetadataList: filteredAudioFilesMetadata);

    // Set the initial loop mode
    await ref
        .read(settingsPreferencesControllerProvider.notifier)
        .setInitialRepeatMode();

    // Invalidate the providers that depend on the audio files metadata
    ref.invalidate(albumDetailsProvider);
    ref.invalidate(artistNamesProvider);
    ref.invalidate(songsProvider);
    ref.invalidate(playlistsProvider);
    ref.invalidate(genresProvider);
    ref.invalidate(tutorialControllerProvider);

    // Load the playlists
    ref.read(playlistsProvider.notifier).refreshProvider();

    // Navigate to the menu screen
    ref.read(routerProvider).goNamed(Routes.menu.name);
  }
}

class AudioPermissionDeniedException implements Exception {
  const AudioPermissionDeniedException();
}

class AudioPermissionPermanentlyDeniedException implements Exception {
  const AudioPermissionPermanentlyDeniedException();
}
