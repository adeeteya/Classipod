import 'dart:async';

import 'package:classipod/core/alerts/dialogs.dart';
import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/constants/assets.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/providers/battery_optimization_provider.dart';
import 'package:classipod/features/app_startup/controller/splash_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  bool _showScanningMusicText = false;
  late final Timer _timer;

  void _toggleScanningMusicText() {
    setState(() {
      _showScanningMusicText = true;
    });
  }

  @override
  void initState() {
    _timer = Timer(const Duration(seconds: 5), _toggleScanningMusicText);
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(splashControllerProvider, (_, state) async {
      if (state.hasError) {
        if (state.error is AudioPermissionDeniedException) {
          await Dialogs.showInfoDialog(
            context: context,
            title: context.localization.audioAccessPermissionTitle,
            content: context.localization.audioAccessPermissionContent,
          );
          await ref
              .read(splashControllerProvider.notifier)
              .requestStoragePermissions();
        } else if (state.error is AudioPermissionPermanentlyDeniedException) {
          await Dialogs.showInfoDialog(
            context: context,
            title: context
                .localization.audioAccessPermissionPermanentlyDeniedTitle,
            content: context
                .localization.audioAccessPermissionPermanentlyDeniedContent,
          );
          await ref
              .read(splashControllerProvider.notifier)
              .requestStoragePermissions();
        } else if (state.error is BatteryOptimizationEnabledException) {
          await Dialogs.showInfoDialog(
            context: context,
            title: context.localization.disableBatteryOptimizationTitle,
            content: context.localization.disableBatteryOptimizationContent,
          );
          await ref.read(batteryOptimizationProvider.notifier).openSettings();

          if (context.mounted) {
            context.goNamed(Routes.menu.name);
          }
        }
      }
    });
    return CupertinoPageScaffold(
      backgroundColor: AppPalette.darkScreenBackgroundGradient2,
      child: SizedBox(
        width: double.infinity,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppPalette.darkScreenBackgroundGradient1,
                AppPalette.darkScreenBackgroundGradient2,
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.appIcon,
                  height: 64,
                  width: 64,
                  color: CupertinoColors.white,
                ),
                if (_showScanningMusicText)
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          context.localization.scanningMusicFiles,
                          style: const TextStyle(
                            color: CupertinoColors.white,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const CupertinoActivityIndicator(
                          radius: 8,
                          color: CupertinoColors.white,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
