import 'dart:async';

import 'package:classipod/core/constants/constants.dart';
import 'package:classipod/core/services/audio_files_service.dart';
import 'package:classipod/features/settings/models/exclude_directory_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

final excludedDirectoriesProvider =
    NotifierProvider<ExcludeDirectoryNotifier, List<ExcludeDirectoryModel>>(
      ExcludeDirectoryNotifier.new,
    );

class ExcludeDirectoryNotifier extends Notifier<List<ExcludeDirectoryModel>> {
  final Box<ExcludeDirectoryModel> _excludeDirectoryBox =
      Hive.box<ExcludeDirectoryModel>(Constants.excludedDirectoriesBoxName);

  @override
  List<ExcludeDirectoryModel> build() {
    return _excludeDirectoryBox.values.toList();
  }

  List<String> get _parentDirectoryPaths {
    return _excludeDirectoryBox.values
        .map((excludeDirectoryModel) => excludeDirectoryModel.directoryPath)
        .toList();
  }

  Future<void> createDefaultDirectories() async {
    final audioFiles = ref.read(audioFilesServiceProvider).requireValue;
    for (final musicMetadata in audioFiles) {
      if (musicMetadata.parentDirectoryPath != null &&
          !_parentDirectoryPaths.contains(musicMetadata.parentDirectoryPath)) {
        final newExcludeDirectoryModel = ExcludeDirectoryModel(
          directoryPath: musicMetadata.parentDirectoryPath!,
          isExcluded: false,
        );
        await _excludeDirectoryBox.add(newExcludeDirectoryModel);
      }
    }
    state = _excludeDirectoryBox.values.toList();
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
