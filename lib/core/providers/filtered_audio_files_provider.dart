import 'dart:collection';

import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/services/audio_files_service.dart';
import 'package:classipod/features/settings/controller/exclude_directories_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filteredAudioFilesProvider = FutureProvider<
  UnmodifiableListView<MusicMetadata>
>((ref) async {
  // Load the audio files metadata
  final audioFilesMetadata = await ref.refresh(
    audioFilesServiceProvider.future,
  );

  // Create Excluded Directories if they don't exist
  await ref
      .read(excludedDirectoriesProvider.notifier)
      .createDefaultDirectories();

  final excludedParentDirectories =
      ref
          .watch(excludedDirectoriesProvider)
          .where((excludeDirectoryModel) => excludeDirectoryModel.isExcluded)
          .map((excludedDirectoryModel) => excludedDirectoryModel.directoryPath)
          .toList();
  final List<MusicMetadata> filteredList = [];
  for (final audioFileMetadata in audioFilesMetadata) {
    if (!excludedParentDirectories.contains(
      audioFileMetadata.parentDirectoryPath,
    )) {
      filteredList.add(audioFileMetadata);
    }
  }

  return UnmodifiableListView(filteredList);
});
