import 'dart:async';

import 'package:classipod/core/constants/constants.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/features/settings/models/exclude_directory_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

final excludedDirectoriesProvider =
    NotifierProvider<ExcludeDirectoryNotifier, List<ExcludeDirectoryModel>>(
      ExcludeDirectoryNotifier.new,
    );

class ExcludeDirectoryNotifier extends Notifier<List<ExcludeDirectoryModel>> {
  final Box<ExcludeDirectoryModel> _excludeDirectoryBox =
      Hive.box<ExcludeDirectoryModel>(Constants.excludedDirectoriesBoxName);

  Set<String>? _exclusionsOnEntry;

  @override
  List<ExcludeDirectoryModel> build() {
    return _excludeDirectoryBox.values.toList();
  }

  Set<String> get _excludedPaths => _excludeDirectoryBox.values
      .where((directory) => directory.isExcluded)
      .map((directory) => directory.directoryPath)
      .toSet();

  void beginEditing() {
    _exclusionsOnEntry = _excludedPaths;
  }

  bool takeExclusionChanges() {
    final initial = _exclusionsOnEntry;
    _exclusionsOnEntry = null;
    return initial != null && !setEquals(initial, _excludedPaths);
  }

  List<String> get _parentDirectoryPaths {
    return _excludeDirectoryBox.values
        .map((excludeDirectoryModel) => excludeDirectoryModel.directoryPath)
        .toList();
  }

  Future<void> createDefaultDirectories(
    Iterable<MusicMetadata> audioFiles,
  ) async {
    var changed = false;
    for (final musicMetadata in audioFiles) {
      if (!musicMetadata.isSubsonic &&
          musicMetadata.parentDirectoryPath != null &&
          !_parentDirectoryPaths.contains(musicMetadata.parentDirectoryPath)) {
        final newExcludeDirectoryModel = ExcludeDirectoryModel(
          directoryPath: musicMetadata.parentDirectoryPath!,
          isExcluded: false,
        );
        await _excludeDirectoryBox.add(newExcludeDirectoryModel);
        changed = true;
      }
    }
    if (changed && ref.mounted) state = _excludeDirectoryBox.values.toList();
  }

  Future<void> toggleExcludeDirectory({
    required dynamic excludeDirectoryModelKey,
  }) async {
    if (excludeDirectoryModelKey == null) {
      return;
    } else {
      final excludeDirectory = _excludeDirectoryBox.get(
        excludeDirectoryModelKey,
      );
      if (excludeDirectory != null) {
        await _excludeDirectoryBox.put(
          excludeDirectoryModelKey,
          excludeDirectory.copyWith(isExcluded: !excludeDirectory.isExcluded),
        );
        state = _excludeDirectoryBox.values.toList();
      }
    }
  }
}
