import 'package:classipod/classipod_app.dart';
import 'package:classipod/providers/app_startup_provider.dart';
import 'package:classipod/screens/app_startup/app_startup_error.dart';
import 'package:classipod/screens/app_startup/app_startup_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppStartupWidget extends ConsumerWidget {
  const AppStartupWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStartupState = ref.watch(appStartupProvider);
    return appStartupState.when(
      loading: () => const AppStartupLoading(),
      error: (e, _) => AppStartupError(
        error: e,
        onRetry: () => ref.invalidate(appStartupProvider),
      ),
      data: (_) => const ClassipodApp(),
    );
  }
}
