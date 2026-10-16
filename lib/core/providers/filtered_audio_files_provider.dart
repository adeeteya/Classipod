import 'dart:collection';

import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/providers/library_context_provider.dart';
import 'package:classipod/core/services/audio_files_service.dart';
import 'package:classipod/core/utils/duplicate_tracks.dart';
import 'package:classipod/core/utils/library_filter.dart';
import 'package:classipod/features/settings/controller/exclude_directories_controller.dart';
import 'package:classipod/features/settings/controller/prevent_duplicate_tracks_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filteredAudioFilesProvider =
    FutureProvider<UnmodifiableListView<MusicMetadata>>((ref) async {
      final preventDuplicates = ref.watch(preventDuplicateTracksProvider);
      final libraryContext = ref.watch(libraryContextProvider);
      final metadataFuture = ref.watch(audioFilesServiceProvider.future);
      ref.listen(excludedDirectoriesProvider, (previous, next) {
        final before = previous
            ?.where((directory) => directory.isExcluded)
            .map((directory) => directory.directoryPath)
            .toSet();
        final after = next
            .where((directory) => directory.isExcluded)
            .map((directory) => directory.directoryPath)
            .toSet();
        if (!setEquals(before, after)) ref.invalidateSelf();
      });
      final excludedParentDirectories = ref
          .read(excludedDirectoriesProvider)
          .where((directory) => directory.isExcluded)
          .map((directory) => directory.directoryPath)
          .toSet();
      final directories = ref.read(excludedDirectoriesProvider.notifier);
      final audioFilesMetadata = await metadataFuture;
      if (ref.mounted) {
        await directories.createDefaultDirectories(audioFilesMetadata);
      }

      final List<MusicMetadata> filteredList = [];
      for (final audioFileMetadata in audioFilesMetadata) {
        if (audioFileMetadata.isSubsonic ||
            !excludedParentDirectories.contains(
              audioFileMetadata.parentDirectoryPath,
            )) {
          filteredList.add(audioFileMetadata);
        }
      }

      final List<MusicMetadata> libraryFilteredList = filteredList
          .where(
            (audioFileMetadata) =>
                libraryContextOfPath(audioFileMetadata.filePath) ==
                libraryContext,
          )
          .toList();

      return UnmodifiableListView(
        preventDuplicates
            ? withoutDuplicateFileNames(libraryFilteredList)
            : libraryFilteredList,
      );
    });
