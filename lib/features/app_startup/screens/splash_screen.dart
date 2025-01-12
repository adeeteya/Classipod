import 'dart:async';

import 'package:classipod/core/alerts/dialogs.dart';
import 'package:classipod/core/custom_painter/apple_logo_custom_painter.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/services/audio_files_service.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    unawaited(_requestStoragePermissions());
    super.initState();
  }

  Future<void> _requestStoragePermissions() async {
    final PermissionStatus audioPermission = await Permission.audio.request();
    if (audioPermission.isDenied && mounted) {
      await Dialogs.showInfoDialog(
        context: context,
        title: context.localization.audioAccessPermissionTitle,
        content: context.localization.audioAccessPermissionContent,
      );
      await _requestStoragePermissions();
      return;
    }
    if (audioPermission.isPermanentlyDenied && mounted) {
      await Dialogs.showInfoDialog(
        context: context,
        title: context.localization.audioAccessPermissionPermanentlyDeniedTitle,
        content:
            context.localization.audioAccessPermissionPermanentlyDeniedContent,
      );
      return;
    }

    await _fetchAndSetAudioSource();
  }

  Future<void> _fetchAndSetAudioSource() async {
    final audioFilesMetadata = await ref.read(audioFilesServiceProvider.future);
    await ref
        .read(audioPlayerServiceProvider.notifier)
        .setAudioSource(audioFilesMetadata);
    ref.read(routerProvider).goNamed(Routes.menu.name);
  }

  @override
  Widget build(BuildContext context) {
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
