import 'package:classipod/core/routes.dart';
import 'package:classipod/features/settings/settings_preferences_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClassipodApp extends ConsumerWidget {
  const ClassipodApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(
      settingsPreferencesProvider.select((value) => value.isDarkMode),
    );
    final router = ref.watch(routerProvider);
    return CupertinoApp.router(
      title: 'Classipod',
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        brightness: isDark ? Brightness.dark : Brightness.light,
        scaffoldBackgroundColor: CupertinoColors.white,
        textTheme: const CupertinoTextThemeData(
          textStyle: TextStyle(
            color: CupertinoColors.black,
            fontFamily: 'Myriad',
          ),
        ),
      ),
      routerConfig: router,
    );
  }
}
