import 'package:audio_service/audio_service.dart';

Future<void> initializeMediaSession(AudioHandler handler) async {
  await AudioService.init(
    builder: () => handler,
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'classipod',
      androidNotificationChannelName: 'ClassiPod Audio playback',
      androidNotificationChannelDescription:
          'Notification to control the currently playing music files',
      androidNotificationOngoing: true,
      androidNotificationIcon: 'drawable/ic_stat_name',
    ),
  );
}
