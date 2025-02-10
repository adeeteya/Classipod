import 'dart:async';
import 'dart:collection';

import 'package:classipod/core/constants/constants.dart';
import 'package:classipod/core/models/metadata.dart';
import 'package:classipod/core/repositories/metadata_reader_repository.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

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

  bool isSupportedAudioFormat(String path) {
    if (path.endsWith('.mp3') ||
        path.endsWith('.ogg') ||
        path.endsWith('.wav') ||
        path.endsWith('.flac') ||
        path.endsWith('.m4a') ||
        path.endsWith('.aac')) {
      return true;
    } else {
      return false;
    }
  }

  Future<UnmodifiableListView<Metadata>> getAudioFilesMetadata() async {
    try {
      final Box<Metadata> metadataBox =
          Hive.box<Metadata>(Constants.metadataBoxName);
      if (metadataBox.isEmpty) {
        final result = await compute(
          ref.read(metadataReaderRepositoryProvider).extractAudioFilesMetadata,
          ref.read(settingsPreferencesControllerProvider).musicFolderPath,
        );
        await metadataBox.addAll(result);
        return UnmodifiableListView(result);
      } else {
        return UnmodifiableListView(metadataBox.values);
      }
    } catch (e) {
      return UnmodifiableListView([]);
    }
  }
}
