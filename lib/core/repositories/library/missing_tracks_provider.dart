import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/repositories/library/library_repository.dart';
import 'package:classipod/core/services/audio_files_service.dart';
import 'package:classipod/core/utils/directory_exclusion.dart';
import 'package:classipod/features/settings/controller/exclude_directories_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';

class MissingTrack {
  final MusicMetadata song;
  final bool artworkOnly;

  const MissingTrack(this.song, {required this.artworkOnly});

  String get location => song.filePath ?? song.contentUri ?? song.identity;
}

final missingTracksProvider = Provider<List<MissingTrack>>((ref) {
  ref.watch(localLibraryProvider);
  final excludedPaths = ref
      .watch(excludedDirectoriesProvider)
      .where((directory) => directory.isExcluded)
      .map((directory) => directory.directoryPath)
      .toSet();
  final nameFilters = ref.watch(excludedNameFiltersProvider);
  if (!Hive.isBoxOpen(LibraryRepository.boxName)) return [];
  final snapshot = Hive.box<dynamic>(LibraryRepository.boxName).get('snapshot');
  if (snapshot is! Map) return [];
  return [
    for (final row in snapshot['records'] as List? ?? [])
      if ((row['readSuccess'] == false || row['artworkReadFailed'] == true) &&
          !isDirectoryExcluded(
            directoryPath: (row['music'] as MusicMetadata).parentDirectoryPath,
            excludedDirectoryPaths: excludedPaths,
            nameFilters: nameFilters,
          ))
        MissingTrack(
          row['music'] as MusicMetadata,
          artworkOnly: row['readSuccess'] != false,
        ),
  ];
});
