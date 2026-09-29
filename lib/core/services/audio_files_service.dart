import 'dart:collection';

import 'package:classipod/core/constants/online_audio_files_metadata.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/repositories/library/library_progress.dart';
import 'package:classipod/core/repositories/library/library_provider.dart';
import 'package:classipod/core/subsonic/subsonic_controller.dart';
import 'package:classipod/features/settings/controller/hide_local_music_controller.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localLibraryProvider = FutureProvider<List<MusicMetadata>>(
  retry: (_, _) => null,
  (ref) async {
    if (kIsWeb ||
        ref.read(settingsPreferencesControllerProvider).fetchOnlineMusic) {
      return [];
    }
    return ref
        .read(libraryRepositoryProvider)
        .load(ref.read(libraryProgressProvider.notifier).report);
  },
);

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
  Future<UnmodifiableListView<MusicMetadata>> build() =>
      getAudioFilesMetadata();

  Future<UnmodifiableListView<MusicMetadata>> getAudioFilesMetadata() async {
    final remoteFuture = ref.watch(
      subsonicControllerProvider.selectAsync(
        (remote) => (enabled: remote.enabled, songs: remote.songs),
      ),
    );
    final localFuture = ref
        .watch(localLibraryProvider.future)
        .catchError((Object _) => <MusicMetadata>[]);
    final demo = ref
        .read(settingsPreferencesControllerProvider)
        .fetchOnlineMusic;
    final hideLocalMusic = ref.watch(hideLocalMusicProvider);
    final remote = await remoteFuture;
    List<MusicMetadata> songs;
    if (kIsWeb || demo) {
      songs = remote.enabled ? [] : onlineDemoAudioFilesMetaData;
    } else {
      songs = await localFuture;
    }
    return UnmodifiableListView([
      if (!remote.enabled || !hideLocalMusic) ...songs,
      if (remote.enabled) ...remote.songs,
    ]);
  }
}
