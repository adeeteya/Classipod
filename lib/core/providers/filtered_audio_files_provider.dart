import 'dart:collection';

import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/services/audio_files_service.dart';
import 'package:classipod/features/settings/controller/exclude_directories_controller.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:classipod/features/settings/models/music_folder_node.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filteredAudioFilesProvider =
    FutureProvider<UnmodifiableListView<MusicMetadata>>((ref) async {
      // Load the audio files metadata
      final audioFilesMetadata = await ref.refresh(
        audioFilesServiceProvider.future,
      );

      // Create Excluded Directories if they don't exist
      await ref
          .read(excludedDirectoriesProvider.notifier)
          .createDefaultDirectories();

      final excludedParentDirectories = ref
          .watch(excludedDirectoriesProvider)
          .where((excludeDirectoryModel) => excludeDirectoryModel.isExcluded)
          .map((excludedDirectoryModel) => excludedDirectoryModel.directoryPath)
          .toList();
      final String? musicRootPath = ref.watch(
        settingsPreferencesControllerProvider.select(
          (settings) => settings.musicRootPath,
        ),
      );

      final List<MusicMetadata> filteredList = [];
      for (final audioFileMetadata in audioFilesMetadata) {
        final String? parentDirectoryPath =
            audioFileMetadata.parentDirectoryPath;
        // The chosen root applies to everything below it, unlike the excluded
        // folders which only match a track's own parent folder.
        if (musicRootPath != null &&
            (parentDirectoryPath == null ||
                !MusicFolderNode.isUnder(
                  filePath: parentDirectoryPath,
                  rootPath: musicRootPath,
                ))) {
          continue;
        }
        if (!excludedParentDirectories.contains(parentDirectoryPath)) {
          filteredList.add(audioFileMetadata);
        }
      }

      return UnmodifiableListView(filteredList);
    });
