import 'package:classipod/core/constants/constants.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

enum ClickWheelSize {
  small,
  medium,
  large;

  /// Diameter of the click wheel, as a ratio of the device width.
  double get radiusRatio {
    switch (this) {
      case small:
        return Constants.deviceClickWheelSmallRadiusRatio;
      case medium:
        return Constants.deviceClickWheelMediumRadiusRatio;
      case large:
        return Constants.deviceClickWheelLargeRadiusRatio;
    }
  }

  /// Diameter of the centre select button, as a ratio of the device width.
  double get selectButtonRadiusRatio {
    switch (this) {
      case small:
        return Constants.deviceSelectButtonSmallRadiusRatio;
      case medium:
        return Constants.deviceSelectButtonMediumRadiusRatio;
      case large:
        return Constants.deviceSelectButtonLargeRadiusRatio;
    }
  }

  String title(BuildContext context) {
    switch (this) {
      case small:
        return context.localization.small;
      case medium:
        return context.localization.medium;
      case large:
        return context.localization.large;
    }
  }
}
