// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:classipod/classipod_app.dart';
import 'package:classipod/core/constants/keys.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/extensions/go_router_extensions.dart';
import 'package:classipod/core/models/device_directory.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/providers/device_directory_provider.dart';
import 'package:classipod/core/providers/shared_preferences_with_cache_provider.dart';
import 'package:classipod/features/app_startup/controllers/app_startup_controller.dart';
import 'package:classipod/features/app_startup/controllers/splash_controller.dart';
import 'package:classipod/features/app_startup/screens/app_startup_screen.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

class SplashScreenControllerMockNotifier extends Fake
    implements SplashControllerNotifier {
  @override
  Future<void> build() async {
    await Future.delayed(const Duration(seconds: 1));
    ref.read(routerProvider).goNamed(Routes.menu.name);
  }
}

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
      splashControllerProvider.overrideWith(
        SplashScreenControllerMockNotifier.new,
      ),
    ],
  );

  testWidgets('Initial Location is Splash', (WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(300, 812));
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: providerContainer,
        child: const AppStartupScreen(app: ClassipodApp()),
      ),
    );
    await tester.pump();

    expect('splash', rootNavigatorKey.currentContext?.router.locationNamed);
  });
}
