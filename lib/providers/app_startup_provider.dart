import 'dart:async';

import 'package:classipod/controllers/settings_preferences_controller.dart';
import 'package:classipod/providers/shared_preferences_with_cache_provider.dart';
import 'package:classipod/providers/temp_directory_provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio_background/just_audio_background.dart';

final appStartupProvider = FutureProvider<void>((ref) async {
  ref.onDispose(() {
    ref.invalidate(sharedPreferencesWithCacheProvider);
  });

  await Future.wait([
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    ),
    JustAudioBackground.init(
      androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
      androidNotificationChannelName: 'Audio playback',
      androidNotificationChannelDescription: 'Classipod Audio Notification',
      androidNotificationOngoing: true,
    ),
    ref.watch(tempDirectoryProvider.future),
    ref.watch(sharedPreferencesWithCacheProvider.future),
  ]);
  unawaited(ref.read(settingsPreferencesControllerProvider.future));
});
