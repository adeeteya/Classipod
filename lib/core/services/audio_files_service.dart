import 'dart:async';
import 'dart:collection';

import 'package:classipod/core/constants/constants.dart';
import 'package:classipod/core/constants/online_audio_files_metadata.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/repositories/metadata_reader_repository.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

final audioFilesServiceProvider = AsyncNotifierProvider<
  AudioFilesServiceNotifier,
  UnmodifiableListView<MusicMetadata>
>(AudioFilesServiceNotifier.new);

class AudioFilesServiceNotifier
    extends AsyncNotifier<UnmodifiableListView<MusicMetadata>> {
  @override
  Future<UnmodifiableListView<MusicMetadata>> build() async {
    return getAudioFilesMetadata();
  }

  Future<UnmodifiableListView<MusicMetadata>> getAudioFilesMetadata() async {
    state = const AsyncLoading();
    try {
      if (ref.read(settingsPreferencesControllerProvider).fetchOnlineMusic) {
        return UnmodifiableListView(onlineDemoAudioFilesMetaData);
      } else {
        final Box<MusicMetadata> metadataBox = Hive.box<MusicMetadata>(
          Constants.metadataBoxName,
        );
        if (metadataBox.isEmpty) {
          final result = await compute(
            ref
                .read(metadataReaderRepositoryProvider)
                .extractAudioFilesMetadata,
            ref.read(settingsPreferencesControllerProvider).musicFolderPath,
          );
          await metadataBox.addAll(result);
          return UnmodifiableListView(result);
        } else {
          return UnmodifiableListView(metadataBox.values);
        }
      }
    } catch (e) {
      return UnmodifiableListView([]);
    }
  }
}
