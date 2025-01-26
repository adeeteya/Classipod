import 'dart:async';

import 'package:classipod/core/providers/shared_preferences_with_cache_provider.dart';
import 'package:classipod/core/providers/temp_directory_provider.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appStartupControllerProvider = FutureProvider<void>((ref) async {
  await Future.wait([
    ref.watch(tempDirectoryProvider.future),
    ref.watch(sharedPreferencesWithCacheProvider.future),
  ]);
  unawaited(
    ref.read(settingsPreferencesControllerProvider.notifier).setSystemUiMode(),
  );
});
