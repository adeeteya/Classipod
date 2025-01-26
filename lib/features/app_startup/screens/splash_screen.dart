import 'package:classipod/core/alerts/dialogs.dart';
import 'package:classipod/core/custom_painter/apple_logo_custom_painter.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/features/app_startup/controller/splash_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(splashControllerProvider, (_, state) async {
      if (state.hasError) {
        if (state.error is AudioPermissionDeniedException) {
          await Dialogs.showInfoDialog(
            context: context,
            title: context.localization.audioAccessPermissionTitle,
            content: context.localization.audioAccessPermissionContent,
          );
        } else if (state.error is AudioPermissionPermanentlyDeniedException) {
          await Dialogs.showInfoDialog(
            context: context,
            title: context
                .localization.audioAccessPermissionPermanentlyDeniedTitle,
            content: context
                .localization.audioAccessPermissionPermanentlyDeniedContent,
          );
        }
        await ref
            .read(splashControllerProvider.notifier)
            .requestStoragePermissions();
      }
    });

    return CupertinoPageScaffold(
      child: Center(
        child: CustomPaint(
          size: const Size(64, 64),
          foregroundPainter: AppleCustomPainter(),
        ),
      ),
    );
  }
}
