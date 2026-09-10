import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:flutter/cupertino.dart';

/// How the device frame is painted, on top of whichever colour is in use.
enum DeviceFinish {
  /// The original look: a vertical gradient covered by the noise texture.
  classic,

  /// A single solid colour, with neither gradient nor texture.
  flat,

  /// A solid colour covered by a bundled or user supplied texture.
  texture;

  static DeviceFinish fromName(String raw) {
    try {
      return DeviceFinish.values.byName(raw);
    } catch (_) {
      return DeviceFinish.classic;
    }
  }

  String title(BuildContext context) {
    switch (this) {
      case classic:
        return context.localization.classicDeviceFinish;
      case flat:
        return context.localization.flatDeviceFinish;
      case texture:
        return context.localization.textureDeviceFinish;
    }
  }
}
