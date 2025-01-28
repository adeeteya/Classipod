import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/constants/assets.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/features/app_startup/screens/app_startup_screen.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
    ProviderScope(
      child: DevicePreview(
        tools: const [
          ...DevicePreview.defaultTools,
          DebuggerToolsSection(),
        ],
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
    final languageLocaleCode = ref.watch(
      currentSettingsPreferencesProvider
          .select((value) => value.languageLocaleCode),
    );
    final router = ref.watch(routerProvider);
    final debuggerTools = ref.watch(debuggerToolsProvider);
    debugRepaintRainbowEnabled = debuggerTools.debugRepaintRainbowEnabled;
    debugPaintSizeEnabled = debuggerTools.debugPaintSizeEnabled;
    debugPaintBaselinesEnabled = debuggerTools.debugPaintBaselinesEnabled;
    debugPaintPointersEnabled = debuggerTools.debugPaintPointersEnabled;
    debugPaintLayerBordersEnabled = debuggerTools.debugPaintLayerBordersEnabled;

    return CupertinoApp.router(
      locale: Locale(languageLocaleCode),
      builder: DevicePreview.appBuilder,
      onGenerateTitle: (context) => context.localization.appTitle,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      showPerformanceOverlay: debuggerTools.showPerformanceOverlay,
      showSemanticsDebugger: debuggerTools.showSemanticsDebugger,
      checkerboardOffscreenLayers: debuggerTools.checkerboardOffscreenLayers,
      checkerboardRasterCacheImages:
          debuggerTools.checkerboardRasterCacheImages,
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

final debuggerToolsProvider = StateProvider<DebuggerToolsModel>(
  (ref) => DebuggerToolsModel(),
);

class DebuggerToolsModel {
  final bool showPerformanceOverlay;
  final bool showSemanticsDebugger;
  final bool checkerboardOffscreenLayers;
  final bool checkerboardRasterCacheImages;
  final bool debugRepaintRainbowEnabled;
  final bool debugPaintSizeEnabled;
  final bool debugPaintBaselinesEnabled;
  final bool debugPaintPointersEnabled;
  final bool debugPaintLayerBordersEnabled;

  DebuggerToolsModel({
    this.showPerformanceOverlay = false,
    this.showSemanticsDebugger = false,
    this.checkerboardOffscreenLayers = false,
    this.checkerboardRasterCacheImages = false,
    this.debugRepaintRainbowEnabled = false,
    this.debugPaintSizeEnabled = false,
    this.debugPaintBaselinesEnabled = false,
    this.debugPaintPointersEnabled = false,
    this.debugPaintLayerBordersEnabled = false,
  });

  DebuggerToolsModel copyWith({
    bool? showPerformanceOverlay,
    bool? showSemanticsDebugger,
    bool? checkerboardOffscreenLayers,
    bool? checkerboardRasterCacheImages,
    bool? debugRepaintRainbowEnabled,
    bool? debugPaintSizeEnabled,
    bool? debugPaintBaselinesEnabled,
    bool? debugPaintPointersEnabled,
    bool? debugPaintLayerBordersEnabled,
  }) {
    return DebuggerToolsModel(
      showPerformanceOverlay:
          showPerformanceOverlay ?? this.showPerformanceOverlay,
      showSemanticsDebugger:
          showSemanticsDebugger ?? this.showSemanticsDebugger,
      checkerboardOffscreenLayers:
          checkerboardOffscreenLayers ?? this.checkerboardOffscreenLayers,
      checkerboardRasterCacheImages:
          checkerboardRasterCacheImages ?? this.checkerboardRasterCacheImages,
      debugRepaintRainbowEnabled:
          debugRepaintRainbowEnabled ?? this.debugRepaintRainbowEnabled,
      debugPaintSizeEnabled:
          debugPaintSizeEnabled ?? this.debugPaintSizeEnabled,
      debugPaintBaselinesEnabled:
          debugPaintBaselinesEnabled ?? this.debugPaintBaselinesEnabled,
      debugPaintPointersEnabled:
          debugPaintPointersEnabled ?? this.debugPaintPointersEnabled,
      debugPaintLayerBordersEnabled:
          debugPaintLayerBordersEnabled ?? this.debugPaintLayerBordersEnabled,
    );
  }
}

class DebuggerToolsSection extends ConsumerWidget {
  const DebuggerToolsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final debuggerModel = ref.watch(debuggerToolsProvider);
    return ToolPanelSection(
      title: 'Debugger Tools',
      children: [
        ListTile(
          key: const Key('performanceOverlay'),
          title: const Text('Show Performance Overlay'),
          trailing: Text(debuggerModel.showPerformanceOverlay ? 'ON' : 'OFF'),
          onTap: () {
            ref.read(debuggerToolsProvider.notifier).state =
                debuggerModel.copyWith(
              showPerformanceOverlay: !debuggerModel.showPerformanceOverlay,
            );
          },
        ),
        ListTile(
          key: const Key('semanticsDebugger'),
          title: const Text('Show Semantics Debugger'),
          trailing: Text(debuggerModel.showSemanticsDebugger ? 'ON' : 'OFF'),
          onTap: () {
            ref.read(debuggerToolsProvider.notifier).state =
                debuggerModel.copyWith(
              showSemanticsDebugger: !debuggerModel.showSemanticsDebugger,
            );
          },
        ),
        ListTile(
          key: const Key('checkerboardOffscreenLayers'),
          title: const Text('Checkerboard Offscreen Layers'),
          trailing:
              Text(debuggerModel.checkerboardOffscreenLayers ? 'ON' : 'OFF'),
          onTap: () {
            ref.read(debuggerToolsProvider.notifier).state =
                debuggerModel.copyWith(
              checkerboardOffscreenLayers:
                  !debuggerModel.checkerboardOffscreenLayers,
            );
          },
        ),
        ListTile(
          key: const Key('checkerboardRasterCacheImages'),
          title: const Text('Checkerboard Raster Cache Images'),
          trailing:
              Text(debuggerModel.checkerboardRasterCacheImages ? 'ON' : 'OFF'),
          onTap: () {
            ref.read(debuggerToolsProvider.notifier).state =
                debuggerModel.copyWith(
              checkerboardRasterCacheImages:
                  !debuggerModel.checkerboardRasterCacheImages,
            );
          },
        ),
        ListTile(
          key: const Key('debugRepaintRainbow'),
          title: const Text('Debug Repaint Rainbow'),
          trailing:
              Text(debuggerModel.debugRepaintRainbowEnabled ? 'ON' : 'OFF'),
          onTap: () {
            ref.read(debuggerToolsProvider.notifier).state =
                debuggerModel.copyWith(
              debugRepaintRainbowEnabled:
                  !debuggerModel.debugRepaintRainbowEnabled,
            );
          },
        ),
        ListTile(
          key: const Key('debugPaintSize'),
          title: const Text('Debug Paint Size'),
          trailing: Text(debuggerModel.debugPaintSizeEnabled ? 'ON' : 'OFF'),
          onTap: () {
            ref.read(debuggerToolsProvider.notifier).state =
                debuggerModel.copyWith(
              debugPaintSizeEnabled: !debuggerModel.debugPaintSizeEnabled,
            );
          },
        ),
        ListTile(
          key: const Key('debugPaintBaselines'),
          title: const Text('Debug Paint Baselines'),
          trailing:
              Text(debuggerModel.debugPaintBaselinesEnabled ? 'ON' : 'OFF'),
          onTap: () {
            ref.read(debuggerToolsProvider.notifier).state =
                debuggerModel.copyWith(
              debugPaintBaselinesEnabled:
                  !debuggerModel.debugPaintBaselinesEnabled,
            );
          },
        ),
        ListTile(
          key: const Key('debugPaintPointers'),
          title: const Text('Debug Paint Pointers'),
          trailing:
              Text(debuggerModel.debugPaintPointersEnabled ? 'ON' : 'OFF'),
          onTap: () {
            ref.read(debuggerToolsProvider.notifier).state =
                debuggerModel.copyWith(
              debugPaintPointersEnabled:
                  !debuggerModel.debugPaintPointersEnabled,
            );
          },
        ),
        ListTile(
          key: const Key('debugPaintLayerBorders'),
          title: const Text('Debug Paint Layer Borders'),
          trailing:
              Text(debuggerModel.debugPaintLayerBordersEnabled ? 'ON' : 'OFF'),
          onTap: () {
            ref.read(debuggerToolsProvider.notifier).state =
                debuggerModel.copyWith(
              debugPaintLayerBordersEnabled:
                  !debuggerModel.debugPaintLayerBordersEnabled,
            );
          },
        ),
      ],
    );
  }
}
