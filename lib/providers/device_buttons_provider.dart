import 'package:classipod/models/device_action.dart';
import 'package:classipod/providers/settings_provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibration/vibration.dart';

class DeviceButtonNotifier extends Notifier<DeviceAction?> {
  @override
  DeviceAction? build() {
    return null;
  }

  void buttonPressVibrate() {
    if (ref.read(settingsProvider).vibrate) {
      Vibration.vibrate(duration: 2);
    }
  }

  Future<void> clickWheelSound() async {
    if (ref.read(settingsProvider).clickWheelSound) {
      await SystemSound.play(SystemSoundType.click);
    }
  }

  void setDeviceAction(DeviceAction action) {
    buttonPressVibrate();
    clickWheelSound();
    state = null;
    state = action;
  }

  void resetDeviceAction() {
    state = null;
  }
}

final deviceButtonProvider =
    NotifierProvider<DeviceButtonNotifier, DeviceAction?>(
  DeviceButtonNotifier.new,
);
