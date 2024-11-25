import 'package:classipod/models/device_action.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeviceButtonNotifier extends Notifier<DeviceAction?> {
  @override
  DeviceAction? build() {
    return null;
  }

  void setDeviceAction(DeviceAction action) {
    state = null;
    state = action;
  }

  void resetDeviceAction() {
    state = null;
  }
}

final deviceButtonProvider =
    NotifierProvider<DeviceButtonNotifier, DeviceAction?>(
        () => DeviceButtonNotifier());
