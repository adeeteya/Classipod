import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:flutter/cupertino.dart';

enum ClickWheelSensitivity {
  low,
  medium,
  high;

  String title(BuildContext context) {
    switch (this) {
      case low:
        return context.localization.low;
      case medium:
        return context.localization.medium;
      case high:
        return context.localization.high;
    }
  }
}
