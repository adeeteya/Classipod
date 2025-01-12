import 'dart:async';
import 'dart:collection';

import 'package:classipod/core/models/metadata.dart';
import 'package:classipod/core/providers/temp_directory_provider.dart';
import 'package:classipod/core/repositories/local_audio_files_repository.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final audioFilesServiceProvider = AsyncNotifierProvider<
    AudioFilesServiceNotifier, UnmodifiableListView<Metadata>>(
  AudioFilesServiceNotifier.new,
);

class AudioFilesServiceNotifier
    extends AsyncNotifier<UnmodifiableListView<Metadata>> {
  @override
  Future<UnmodifiableListView<Metadata>> build() async {
    return getAudioFilesMetadata();
  }

  Future<UnmodifiableListView<Metadata>> getAudioFilesMetadata() async {
    state = const AsyncLoading();
    try {
      final result = await ref
          .read(localAudioFileRepositoryProvider)
          .getAudioFilesMetadata(
            audioFileFolderPath:
                ref.read(currentSettingsPreferencesProvider).musicFolderPath,
            cacheParentDirectory:
                ref.read(tempDirectoryProvider).requireValue.path,
          );
      state = AsyncData(result);
      return result;
    } catch (e) {
      return UnmodifiableListView([]);
    }
  }
}
