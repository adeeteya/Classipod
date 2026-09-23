import 'dart:collection';

import 'package:classipod/core/constants/online_audio_files_metadata.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/repositories/library/library_progress.dart';
import 'package:classipod/core/repositories/library/library_provider.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final audioFilesServiceProvider =
    AsyncNotifierProvider<
      AudioFilesServiceNotifier,
      UnmodifiableListView<MusicMetadata>
    >(AudioFilesServiceNotifier.new);

class AudioFilesServiceNotifier
    extends AsyncNotifier<UnmodifiableListView<MusicMetadata>> {
  void replaceMetadata(MusicMetadata song) {
    final current = state.value;
    if (current != null) {
      state = AsyncData(
        UnmodifiableListView([
          for (final item in current)
            if (item.identity == song.identity) song else item,
        ]),
      );
    }
  }

  @override
  Future<UnmodifiableListView<MusicMetadata>> build() async {
    return getAudioFilesMetadata();
  }

  Future<UnmodifiableListView<MusicMetadata>> getAudioFilesMetadata() async {
    state = const AsyncLoading();
    if (ref.read(settingsPreferencesControllerProvider).fetchOnlineMusic) {
      return UnmodifiableListView(onlineDemoAudioFilesMetaData);
    }
    final songs = await ref
        .read(libraryRepositoryProvider)
        .load(ref.read(libraryProgressProvider.notifier).report);
    return UnmodifiableListView(songs);
  }
}
