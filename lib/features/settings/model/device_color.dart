import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:flutter/cupertino.dart';

enum DeviceColor {
  silver,
  black;

  String title(BuildContext context) {
    switch (this) {
      case silver:
        return context.localization.silverDeviceColor;
      case black:
        return context.localization.blackDeviceColor;
    }
  }
}
