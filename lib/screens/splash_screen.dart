import 'dart:async';

import 'package:classipod/core/dialogs.dart';
import 'package:classipod/core/routes.dart';
import 'package:classipod/services/audio_files_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vector_graphics/vector_graphics.dart';

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
        title: "Audio Access Permission Required",
        content:
            "Please grant audio files access to allow us to play your music files.",
      );
      await _requestStoragePermissions();
      return;
    }
    if (audioPermission.isPermanentlyDenied && mounted) {
      await Dialogs.showInfoDialog(
        context: context,
        title: "Audio Access Permission Denied",
        content:
            "Please grant audio files access for this app in the device settings to allow us to play your music files.",
      );
      return;
    }

    await ref.read(audioFilesServiceProvider.future);
    ref.read(routerProvider).goNamed(Routes.menu.name);
  }

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: Center(
        child: VectorGraphic(
          loader: AssetBytesLoader(
            "assets/icons/apple_logo.svg",
          ),
        ),
      ),
    );
  }
}
