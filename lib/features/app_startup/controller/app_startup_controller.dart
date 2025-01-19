import 'dart:async';

import 'package:classipod/core/providers/shared_preferences_with_cache_provider.dart';
import 'package:classipod/core/providers/temp_directory_provider.dart';
import 'package:classipod/core/services/audio_files_service.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/features/music/album/album_details_provider.dart';
import 'package:classipod/features/music/artists/artist_names_provider.dart';
import 'package:classipod/features/music/songs/songs_provider.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appStartupControllerProvider = FutureProvider<void>((ref) async {
  ref.onDispose(() async {
    await ref.read(audioPlayerProvider).stop();
    await ref.read(audioPlayerProvider).dispose();
    ref.invalidate(sharedPreferencesWithCacheProvider);
    ref.invalidate(currentSettingsPreferencesProvider);
    ref.invalidate(audioFilesServiceProvider);
    ref.invalidate(albumDetailsProvider);
    ref.invalidate(artistNamesProvider);
    ref.invalidate(songsProvider);
  });

  await Future.wait([
    ref.watch(tempDirectoryProvider.future),
    ref.watch(sharedPreferencesWithCacheProvider.future),
  ]);
  unawaited(
    ref.read(settingsPreferencesControllerProvider.notifier).setSystemUiMode(),
  );
});
