import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:classipod/core/services/playback/library_audio_handler.dart';
import 'package:flutter/foundation.dart';

Future<void> initializeMediaSession(LibraryAudioHandler handler) async {
  if (kIsWeb || Platform.isAndroid || Platform.isIOS || Platform.isMacOS) {
    await AudioService.init(
      builder: () => handler,
      config: const AudioServiceConfig(
        androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
        androidNotificationChannelName: 'ClassiPod Audio playback',
        androidNotificationChannelDescription:
            'Notification to control the currently playing music files',
        androidNotificationOngoing: true,
        androidNotificationIcon: 'drawable/ic_stat_name',
      ),
    );
  }
}
