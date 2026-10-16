import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

enum ClickWheelSensitivity {
  veryLow,
  low,
  medium,
  mediumHigh,
  high;

  String title(BuildContext context) {
    switch (this) {
      case veryLow:
        return context.localization.veryLow;
      case low:
        return context.localization.low;
      case medium:
        return context.localization.medium;
      case mediumHigh:
        return context.localization.mediumHigh;
      case high:
        return context.localization.high;
    }
  }
}
