import 'dart:io';

import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/features/device/models/device_action.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibration/vibration.dart';

final deviceButtonsServiceProvider =
    NotifierProvider<DeviceButtonsServiceNotifier, DeviceAction?>(
      DeviceButtonsServiceNotifier.new,
    );

class DeviceButtonsServiceNotifier extends Notifier<DeviceAction?> {
  @override
  DeviceAction? build() {
    return null;
  }

  Future<void> buttonPressVibrate() async {
    if (ref.read(settingsPreferencesControllerProvider).vibrate &&
        (kIsWeb || Platform.isAndroid || Platform.isIOS)) {
      await Vibration.vibrate(duration: 5);
    }
  }

  Future<void> clickWheelSound() async {
    if (!kIsWeb &&
        ref.read(settingsPreferencesControllerProvider).clickWheelSound) {
      await SystemSound.play(SystemSoundType.click);
    }
  }

  Future<void> setDeviceAction(DeviceAction action) async {
    await Future.wait([buttonPressVibrate(), clickWheelSound()]);
    state = null;
    state = action;
  }

  Future<void> playPauseButtonClick() async {
    await Future.wait([buttonPressVibrate(), clickWheelSound()]);
    await ref.read(audioPlayerServiceProvider.notifier).togglePlayback();
  }

  void resetDeviceAction() {
    state = null;
  }
}
