import 'package:classipod/core/assets.dart';
import 'package:classipod/core/extensions.dart';
import 'package:classipod/core/routes.dart';
import 'package:classipod/features/settings/controller/settings_preferences_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
      onGenerateTitle: (context) => context.localization.appTitle,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: CupertinoThemeData(
        brightness: isDark ? Brightness.dark : Brightness.light,
        scaffoldBackgroundColor: CupertinoColors.white,
        textTheme: const CupertinoTextThemeData(
          textStyle: TextStyle(
            color: CupertinoColors.black,
            fontFamily: Assets.myriadFont,
          ),
        ),
      ),
    );
  }
}
