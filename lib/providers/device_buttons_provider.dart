import 'package:classipod/models/device_action.dart';
import 'package:classipod/features/settings/settings_preferences_provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibration/vibration.dart';

class DeviceButtonNotifier extends Notifier<DeviceAction?> {
  @override
  DeviceAction? build() {
    return null;
  }

  Future<void> buttonPressVibrate() async {
    if (ref.read(settingsPreferencesProvider).vibrate) {
      await Vibration.vibrate(duration: 2);
    }
  }

  Future<void> clickWheelSound() async {
    if (ref.read(settingsPreferencesProvider).clickWheelSound) {
      await SystemSound.play(SystemSoundType.click);
    }
  }

  Future<void> setDeviceAction(DeviceAction action) async {
    await buttonPressVibrate();
    await clickWheelSound();
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
