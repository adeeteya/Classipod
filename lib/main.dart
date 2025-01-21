import 'package:classipod/classipod_app.dart';
import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/features/app_startup/screens/app_startup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio_background/just_audio_background.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: AppPalette.transparentColor,
      statusBarColor: AppPalette.transparentColor,
    ),
  );

  await Future.wait([
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    ),
    JustAudioBackground.init(
      androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
      androidNotificationChannelName: 'ClassiPod Audio playback',
      androidNotificationChannelDescription:
          'Notification to control the currently playing music files',
      androidNotificationOngoing: true,
      androidNotificationIcon: 'drawable/ic_stat_name',
    ),
  ]);

  runApp(
    const ProviderScope(
      child: AppStartupScreen(
        app: ClassipodApp(),
      ),
    ),
  );
}
