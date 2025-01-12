import 'package:classipod/classipod_app.dart';
import 'package:classipod/features/app_startup/controller/app_startup_controller.dart';
import 'package:classipod/features/app_startup/screens/app_startup_error_screen.dart';
import 'package:classipod/features/app_startup/screens/app_startup_loading_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppStartupScreen extends ConsumerWidget {
  const AppStartupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStartupState = ref.watch(appStartupControllerProvider);
    return appStartupState.when(
      loading: () => const AppStartupLoading(),
      error: (e, _) => AppStartupError(
        error: e,
        onRetry: () => ref.invalidate(appStartupControllerProvider),
      ),
      data: (_) => const ClassipodApp(),
    );
  }
}
