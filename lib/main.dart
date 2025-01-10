import 'package:classipod/core/constants.dart';
import 'package:classipod/features/app_startup/app_startup_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: transparentColor,
      statusBarColor: transparentColor,
    ),
  );

  runApp(
    const ProviderScope(
      child: AppStartupWidget(),
    ),
  );

  // try {
  //   await SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  //   );
  //   await JustAudioBackground.init(
  //     androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
  //     androidNotificationChannelName: 'Audio playback',
  //     androidNotificationChannelDescription: 'Classipod Audio Notification',
  //     androidNotificationOngoing: true,
  //   );
  //   final tempDirectory = await getTemporaryDirectory();
  //   final sharedPreferencesWithCache = await SharedPreferencesWithCache.create(
  //     cacheOptions: const SharedPreferencesWithCacheOptions(),
  //   );
  //   final container = ProviderContainer(
  //     overrides: [
  //       tempDirectoryPathProvider.overrideWithValue(tempDirectory.path),
  //       sharedPreferencesWithCacheProvider
  //           .overrideWithValue(sharedPreferencesWithCache),
  //     ],
  //   );
  //
  //
  //   runApp(
  //     UncontrolledProviderScope(
  //       container: container,
  //       child: const ClassipodApp(),
  //     ),
  //   );
  // } catch (e) {
  //   // ignore: missing_provider_scope
  //   runApp(
  //     CupertinoApp(
  //       home: CupertinoPageScaffold(
  //         child: Center(
  //           child: Text('Error: $e'),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
