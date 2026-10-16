import 'dart:async';

import 'package:classipod/core/constants/constants.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/utils/library_filter.dart';
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
          // Só as pastas padrão (Music/, Podcasts/) entram de início. O resto
          // nasce excluído, e o usuário reativa o que quiser na tela de
          // exclusões.
          isExcluded: isExcludedByDefault(musicMetadata.parentDirectoryPath),
        );
        await _excludeDirectoryBox.add(newExcludeDirectoryModel);
        changed = true;
      }
    }
    changed = await _applyDefaultInclusionToExisting() || changed;
    if (changed && ref.mounted) state = _excludeDirectoryBox.values.toList();
  }

  /// Aplica a regra de inclusão padrão às entradas já persistidas que ainda
  /// estão no default. `createDefaultDirectories` só adiciona diretórios
  /// novos e nunca revisita os existentes, então sem isso uma instalação
  /// anterior à regra continuaria lendo tudo.
  ///
  /// Diretórios com [ExcludeDirectoryModel.isUserCustomized] são pulados: se
  /// o usuário incluiu ou excluiu aquela pasta na mão, a decisão dele vence e
  /// a regra nunca a re-exclui numa indexação seguinte.
  Future<bool> _applyDefaultInclusionToExisting() async {
    // Fora do Android nada é excluído por padrão, então não há o que
    // reconciliar (ver `isExcludedByDefault`).
    if (isExcludedByDefault('/')) return false;
    var changed = false;
    for (final key in _excludeDirectoryBox.keys.toList()) {
      final existing = _excludeDirectoryBox.get(key);
      if (existing == null || existing.isExcluded) continue;
      if (existing.isUserCustomized) continue;
      if (!isExcludedByDefault(existing.directoryPath)) continue;
      await _excludeDirectoryBox.put(key, existing.copyWith(isExcluded: true));
      changed = true;
    }
    return changed;
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
          excludeDirectory.copyWith(
            isExcluded: !excludeDirectory.isExcluded,
            // Marca a escolha do usuário para que a regra de inclusão padrão
            // não a reverta na próxima indexação.
            isUserCustomized: true,
          ),
        );
        state = _excludeDirectoryBox.values.toList();
      }
    }
  }
}
