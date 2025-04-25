import 'package:classipod/features/app_startup/controllers/app_startup_controller.dart';
import 'package:classipod/features/app_startup/screens/app_startup_error_screen.dart';
import 'package:classipod/features/app_startup/screens/app_startup_loading_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppStartupScreen extends ConsumerWidget {
  final Widget app;

  const AppStartupScreen({super.key, required this.app});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStartupState = ref.watch(appStartupControllerProvider);
    return appStartupState.when(
      skipLoadingOnReload: false,
      loading: () => const AppStartupLoading(),
      error:
          (e, _) => AppStartupError(
            error: e,
            onRetry: () => ref.invalidate(appStartupControllerProvider),
          ),
      data: (_) => app,
    );
  }
}
