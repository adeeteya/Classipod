import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/constants/assets.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/features/app_startup/screens/app_startup_screen.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: AppPalette.transparentColor,
      statusBarColor: AppPalette.transparentColor,
    ),
  );

  runApp(
    ProviderScope(
      child: DevicePreview(
        builder: (context) => const AppStartupScreen(
          app: DevelopmentClassipodApp(),
        ),
      ),
    ),
  );
}

class DevelopmentClassipodApp extends ConsumerWidget {
  const DevelopmentClassipodApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(
      currentSettingsPreferencesProvider.select((value) => value.isDarkMode),
    );
    final router = ref.watch(routerProvider);
    return CupertinoApp.router(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
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
