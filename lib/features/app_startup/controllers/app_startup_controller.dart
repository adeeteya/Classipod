import 'dart:async';
import 'dart:io';

import 'package:classipod/core/constants/constants.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/providers/shared_preferences_with_cache_provider.dart';
import 'package:classipod/core/providers/temp_directory_provider.dart';
import 'package:classipod/features/music/playlist/models/playlist_model.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:classipod/hive/hive_registrar.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:just_audio_background/just_audio_background.dart';

final appStartupControllerProvider = FutureProvider<void>((ref) async {
  await Future.wait([
    if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) ...[
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]),
      JustAudioBackground.init(
        androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
        androidNotificationChannelName: 'ClassiPod Audio playback',
        androidNotificationChannelDescription:
            'Notification to control the currently playing music files',
        androidNotificationOngoing: true,
        androidNotificationIcon: 'drawable/ic_stat_name',
      ),
      ref.watch(tempDirectoryProvider.future),
    ],
    ref.watch(sharedPreferencesWithCacheProvider.future),
    Hive.initFlutter(),
  ]);
  Hive.registerAdapters();
  await Hive.openBox<MusicMetadata>(Constants.metadataBoxName);
  await Hive.openBox<PlaylistModel>(Constants.playlistBoxName);
  ref
      .read(settingsPreferencesControllerProvider.notifier)
      .setAudioSource(
        isOnlineAudioSource: kIsWeb || Platform.isWindows || Platform.isLinux,
      );
  unawaited(
    ref.read(settingsPreferencesControllerProvider.notifier).setSystemUiMode(),
  );
});
