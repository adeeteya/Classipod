import 'package:classipod/core/constants.dart';
import 'package:classipod/core/providers.dart';
import 'package:classipod/core/routes.dart';
import 'package:classipod/providers/settings_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: transparentColor,
      statusBarColor: transparentColor,
    ),
  );
  try {
    await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );
    await JustAudioBackground.init(
      androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
      androidNotificationChannelName: 'Audio playback',
      androidNotificationChannelDescription: 'Classipod Audio Notification',
      androidNotificationOngoing: true,
    );
    final tempDirectory = await getTemporaryDirectory();
    final sharedPreferencesWithCache = await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(),
    );

    runApp(
      ProviderScope(
        overrides: [
          tempDirectoryPathProvider.overrideWithValue(tempDirectory.path),
          sharedPreferencesWithCacheProvider
              .overrideWithValue(sharedPreferencesWithCache),
        ],
        child: const ClassipodApp(),
      ),
    );
  } catch (e) {
    // ignore: missing_provider_scope
    runApp(
      CupertinoApp(
        home: CupertinoPageScaffold(
          child: Center(
            child: Text('Error: $e'),
          ),
        ),
      ),
    );
  }
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
        scaffoldBackgroundColor: CupertinoColors.white,
        textTheme: const CupertinoTextThemeData(
          textStyle:
              TextStyle(color: CupertinoColors.black, fontFamily: 'Myriad'),
        ),
      ),
      routerConfig: router,
    );
  }
}
