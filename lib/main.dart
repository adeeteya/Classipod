import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retropod/core/constants.dart';
import 'package:retropod/core/routes.dart';
import 'package:retropod/providers/settings_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: transparentColor,
      statusBarColor: transparentColor,
    ),
  );
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(const ProviderScope(child: RetroPodApp()));
}

class RetroPodApp extends ConsumerWidget {
  const RetroPodApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark =
        ref.watch(settingsProvider.select((value) => value.isDarkMode));
    return CupertinoApp.router(
      title: 'RetroPod',
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        brightness: (isDark) ? Brightness.dark : Brightness.light,
        textTheme: const CupertinoTextThemeData(
          textStyle: TextStyle(fontFamily: 'Myriad'),
        ),
      ),
      routerConfig: router,
    );
  }
}
