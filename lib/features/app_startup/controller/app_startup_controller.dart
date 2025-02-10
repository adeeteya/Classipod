import 'dart:async';

import 'package:classipod/core/constants/constants.dart';
import 'package:classipod/core/models/metadata.dart';
import 'package:classipod/core/providers/shared_preferences_with_cache_provider.dart';
import 'package:classipod/core/providers/temp_directory_provider.dart';
import 'package:classipod/features/music/playlist/models/playlist_model.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:classipod/hive/hive_registrar.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

final appStartupControllerProvider = FutureProvider<void>((ref) async {
  await Future.wait([
    ref.watch(tempDirectoryProvider.future),
    ref.watch(sharedPreferencesWithCacheProvider.future),
    Hive.initFlutter(),
  ]);
  Hive.registerAdapters();
  await Hive.openBox<Metadata>(Constants.metadataBoxName);
  await Hive.openBox<PlaylistModel>(Constants.playlistBoxName);
  unawaited(
    ref.read(settingsPreferencesControllerProvider.notifier).setSystemUiMode(),
  );
});
