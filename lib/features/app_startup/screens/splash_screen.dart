import 'package:classipod/core/alerts/dialogs.dart';
import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/constants/assets.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/repositories/library/library_progress.dart';
import 'package:classipod/core/services/audio_files_service.dart';
import 'package:classipod/features/app_startup/controllers/splash_controller.dart';
import 'package:classipod/features/app_startup/widgets/library_loading_progress.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final startup = ref.watch(splashControllerProvider);
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
                .localization
                .audioAccessPermissionPermanentlyDeniedTitle,
            content: context
                .localization
                .audioAccessPermissionPermanentlyDeniedContent,
          );
          await openAppSettings();
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
                if (!startup.hasError)
                  LibraryLoadingProgress(
                    progress: ref.watch(libraryProgressProvider),
                  ),
                if (startup.hasError) ...[
                  Text(
                    context.localization.libraryLoadError,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: CupertinoColors.white),
                  ),
                  CupertinoButton(
                    onPressed: () {
                      ref.invalidate(audioFilesServiceProvider);
                      ref.invalidate(splashControllerProvider);
                    },
                    child: Text(context.localization.libraryRetry),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
