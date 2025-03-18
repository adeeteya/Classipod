// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:classipod/classipod_app.dart';
import 'package:classipod/core/models/device_directory.dart';
import 'package:classipod/core/providers/device_directory_provider.dart';
import 'package:classipod/core/providers/shared_preferences_with_cache_provider.dart';
import 'package:classipod/features/app_startup/controllers/app_startup_controller.dart';
import 'package:classipod/features/app_startup/screens/app_startup_screen.dart';
import 'package:classipod/features/app_startup/screens/splash_screen.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final ProviderContainer providerContainer = ProviderContainer(
    overrides: [
      deviceDirectoryProvider.overrideWith(
        (_) => DeviceDirectory(
          cacheDirectory: Directory("${Directory.current.path}/test/cache"),
          documentsDirectory: Directory(
            "${Directory.current.path}/test/test_files/",
          ),
        ),
      ),
      appStartupControllerProvider.overrideWith((ref) async {
        await ref.read(deviceDirectoryProvider.future);
        SharedPreferencesAsyncPlatform.instance =
            InMemorySharedPreferencesAsync.empty();
        await ref.read(sharedPreferencesWithCacheProvider.future);
        ref
            .read(settingsPreferencesControllerProvider.notifier)
            .setAudioSource(isOnlineAudioSource: false);
      }),
    ],
  );

  setUpAll(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          const MethodChannel('plugins.flutter.io/path_provider'),
          (MethodCall methodCall) async {
            return "${Directory.current.path}/test/test_files/temp";
          },
        );
  });

  testWidgets('Displays Cupertino Loading Widget', (WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(300, 812));
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: providerContainer,
        child: const AppStartupScreen(app: ClassipodApp()),
      ),
    );
    expect(find.byType(CupertinoActivityIndicator), findsOne);
  });

  testWidgets('Displays Splash Screen', (WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(300, 812));
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: providerContainer,
        child: const AppStartupScreen(app: ClassipodApp()),
      ),
    );
    await tester.pump();
    expect(find.byType(SplashScreen), findsOne);
  });

  testWidgets('Displays Error Widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          deviceDirectoryProvider.overrideWith(
            (_) => throw Exception('Test Exception'),
          ),
        ],
        child: const AppStartupScreen(app: ClassipodApp()),
      ),
    );
    await tester.pumpAndSettle();
    await expectLater(find.textContaining('Test Exception'), findsOne);
  });
}
