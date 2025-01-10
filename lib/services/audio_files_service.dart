import 'dart:async';

import 'package:classipod/models/metadata.dart';
import 'package:classipod/features/settings/settings_preferences_provider.dart';
import 'package:classipod/providers/temp_directory_provider.dart';
import 'package:classipod/repositories/local_audio_files_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final audioFilesServiceProvider =
    AsyncNotifierProvider<AudioFilesServiceNotifier, List<Metadata>>(
  AudioFilesServiceNotifier.new,
);

class AudioFilesServiceNotifier extends AsyncNotifier<List<Metadata>> {
  @override
  Future<List<Metadata>> build() async {
    return getAudioFilesMetadata();
  }

  Future<List<Metadata>> getAudioFilesMetadata() async {
    state = const AsyncLoading();
    try {
      final result = await ref
          .read(localAudioFileRepositoryProvider)
          .getAudioFilesMetadata(
            audioFileFolderPath:
                ref.read(settingsPreferencesProvider).musicFolderPath,
            cacheParentDirectory:
                ref.read(tempDirectoryProvider).requireValue.path,
          );
      state = AsyncData(result);
      return result;
    } catch (e) {
      return [];
    }
  }
}
