import 'package:classipod/core/constants.dart';
import 'package:classipod/core/routes.dart';
import 'package:classipod/providers/settings_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio_background/just_audio_background.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: transparentColor,
      statusBarColor: transparentColor,
    ),
  );
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationChannelDescription: 'Classipod Music Player',
    androidNotificationOngoing: true,
  );
  runApp(const ProviderScope(child: ClassipodApp()));
}

class ClassipodApp extends ConsumerWidget {
  const ClassipodApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark =
        ref.watch(settingsProvider.select((value) => value.isDarkMode));
    return CupertinoApp.router(
      title: 'Classipod',
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        brightness: (isDark) ? Brightness.dark : Brightness.light,
        textTheme: const CupertinoTextThemeData(
          textStyle:
              TextStyle(color: CupertinoColors.black, fontFamily: 'Myriad'),
        ),
      ),
      routerConfig: router,
    );
  }
}
