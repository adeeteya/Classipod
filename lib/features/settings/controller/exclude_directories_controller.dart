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

final excludedNameFiltersProvider =
    NotifierProvider<ExcludedNameFiltersNotifier, List<String>>(
      ExcludedNameFiltersNotifier.new,
    );

class ExcludedNameFiltersNotifier extends Notifier<List<String>> {
  final Box<String> _nameFiltersBox = Hive.box<String>(
    Constants.excludedNameFiltersBoxName,
  );

  @override
  List<String> build() {
    return _nameFiltersBox.values.toList();
  }

  Future<void> addNameFilter(String rawName) async {
    final String name = rawName.trim();
    if (name.isEmpty) {
      return;
    }
    final bool alreadyExists = state.any(
      (filter) => filter.toLowerCase() == name.toLowerCase(),
    );
    if (alreadyExists) {
      return;
    }
    await _nameFiltersBox.add(name);
    state = _nameFiltersBox.values.toList();
  }

  Future<void> removeNameFilter(String name) async {
    final String target = name.toLowerCase();
    dynamic keyToRemove;
    for (final key in _nameFiltersBox.keys) {
      final String? value = _nameFiltersBox.get(key);
      if (value != null && value.toLowerCase() == target) {
        keyToRemove = key;
        break;
      }
    }
    if (keyToRemove != null) {
      await _nameFiltersBox.delete(keyToRemove);
      state = _nameFiltersBox.values.toList();
    }
  }
}

class ExcludeDirectoryNotifier extends Notifier<List<ExcludeDirectoryModel>> {
  final Box<ExcludeDirectoryModel> _excludeDirectoryBox =
      Hive.box<ExcludeDirectoryModel>(Constants.excludedDirectoriesBoxName);

  Set<String>? _exclusionsOnEntry;
  List<String>? _nameFiltersOnEntry;

  @override
  List<ExcludeDirectoryModel> build() {
    return _excludeDirectoryBox.values.toList();
  }

  Set<String> get _excludedPaths => _excludeDirectoryBox.values
      .where((directory) => directory.isExcluded)
      .map((directory) => directory.directoryPath)
      .toSet();

  Box<String> get _nameFiltersBox =>
      Hive.box<String>(Constants.excludedNameFiltersBoxName);

  void beginEditing() {
    _exclusionsOnEntry = _excludedPaths;
    _nameFiltersOnEntry = _nameFiltersBox.values.toList();
  }

  bool takeExclusionChanges() {
    final initial = _exclusionsOnEntry;
    final initialFilters = _nameFiltersOnEntry;
    _exclusionsOnEntry = null;
    _nameFiltersOnEntry = null;
    final bool pathsChanged =
        initial != null && !setEquals(initial, _excludedPaths);
    final bool filtersChanged =
        initialFilters != null &&
        !listEquals(initialFilters, _nameFiltersBox.values.toList());
    return pathsChanged || filtersChanged;
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
