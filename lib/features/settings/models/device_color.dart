import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:flutter/cupertino.dart';

@immutable
class DeviceColorStyle {
  final double noiseOpacity;
  final List<Color> frameGradientColors;
  final Color? solidFrameColor;
  final Color controlBackgroundColor;
  final Color controlBorderColor;
  final List<Color> innerButtonGradientColors;
  final Color buttonAccentColor;
  final Color buttonIconColor;
  final bool isDark;

  const DeviceColorStyle({
    required this.noiseOpacity,
    required this.frameGradientColors,
    this.solidFrameColor,
    required this.controlBackgroundColor,
    required this.controlBorderColor,
    required this.innerButtonGradientColors,
    required this.buttonAccentColor,
    required this.buttonIconColor,
    required this.isDark,
  });
}

enum DeviceColor {
  silver,
  black,
  oledBlack,
  red,
  orange,
  yellow,
  gold,
  lime,
  green,
  blue,
  pink,
  purple,
  brown;

  static DeviceColor fromName(String raw) {
    switch (raw) {
      case 'lightRed':
      case 'darkRed':
      case 'red':
        return DeviceColor.red;
      case 'gold':
        return DeviceColor.gold;
      case 'lime':
      case 'lightGreen':
        return DeviceColor.lime;
      case 'green':
      case 'darkGreen':
        return DeviceColor.green;
      case 'blue':
      case 'lightBlue':
      case 'darkBlue':
        return DeviceColor.blue;
      case 'violet':
        return DeviceColor.purple;
      default:
        try {
          return DeviceColor.values.byName(raw);
        } catch (_) {
          return DeviceColor.silver;
        }
    }
  }

  String title(BuildContext context) {
    switch (this) {
      case silver:
        return context.localization.silverDeviceColor;
      case black:
        return context.localization.blackDeviceColor;
      case oledBlack:
        return context.localization.oledBlackDeviceColor;
      case red:
        return context.localization.redDeviceColor;
      case orange:
        return context.localization.orangeDeviceColor;
      case yellow:
        return context.localization.yellowDeviceColor;
      case gold:
        return context.localization.goldDeviceColor;
      case lime:
        return context.localization.limeDeviceColor;
      case green:
        return context.localization.greenDeviceColor;
      case blue:
        return context.localization.blueDeviceColor;
      case pink:
        return context.localization.pinkDeviceColor;
      case purple:
        return context.localization.purpleDeviceColor;
      case brown:
        return context.localization.brownDeviceColor;
    }
  }

  DeviceColorStyle get style {
    switch (this) {
      case DeviceColor.silver:
        return const DeviceColorStyle(
          noiseOpacity: 1,
          frameGradientColors: [
            AppPalette.lightDeviceFrameGradientColor1,
            AppPalette.lightDeviceFrameGradientColor2,
          ],
          controlBackgroundColor: CupertinoColors.white,
          controlBorderColor: AppPalette.lightDeviceControlBorderColor,
          innerButtonGradientColors: [
            AppPalette.lightDeviceControlInnerButtonGradientColor1,
            AppPalette.lightDeviceControlInnerButtonGradientColor2,
          ],
          buttonAccentColor: AppPalette.lightDeviceButtonColor,
          buttonIconColor: AppPalette.lightDeviceButtonColor,
          isDark: false,
        );
      case DeviceColor.black:
        return const DeviceColorStyle(
          noiseOpacity: 0.3,
          frameGradientColors: [
            AppPalette.darkDeviceFrameGradientColor1,
            AppPalette.darkDeviceFrameGradientColor2,
          ],
          controlBackgroundColor: AppPalette.darkDeviceControlBackgroundColor,
          controlBorderColor: CupertinoColors.black,
          innerButtonGradientColors: [
            AppPalette.darkDeviceControlInnerButtonGradientColor1,
            AppPalette.darkDeviceControlInnerButtonGradientColor2,
          ],
          buttonAccentColor: CupertinoColors.white,
          buttonIconColor: CupertinoColors.white,
          isDark: true,
        );
      case DeviceColor.oledBlack:
        return const DeviceColorStyle(
          noiseOpacity: 0,
          frameGradientColors: [CupertinoColors.black, CupertinoColors.black],
          solidFrameColor: CupertinoColors.black,
          controlBackgroundColor: AppPalette.darkDeviceControlBackgroundColor,
          controlBorderColor: CupertinoColors.black,
          innerButtonGradientColors: [
            AppPalette.darkDeviceControlInnerButtonGradientColor1,
            AppPalette.darkDeviceControlInnerButtonGradientColor2,
          ],
          buttonAccentColor: CupertinoColors.white,
          buttonIconColor: CupertinoColors.white,
          isDark: true,
        );
      case DeviceColor.red:
        return const DeviceColorStyle(
          noiseOpacity: 1,
          frameGradientColors: [
            AppPalette.redDeviceFrameGradientColor1,
            AppPalette.redDeviceFrameGradientColor2,
          ],
          controlBackgroundColor: AppPalette.redDeviceControlBackgroundColor,
          controlBorderColor: AppPalette.redDeviceControlBorderColor,
          innerButtonGradientColors: [
            AppPalette.redDeviceControlInnerButtonGradientColor1,
            AppPalette.redDeviceControlInnerButtonGradientColor2,
          ],
          buttonAccentColor: AppPalette.redDeviceButtonAccentColor,
          buttonIconColor: AppPalette.redDeviceButtonAccentColor,
          isDark: false,
        );
      case DeviceColor.orange:
        return const DeviceColorStyle(
          noiseOpacity: 1,
          frameGradientColors: [
            AppPalette.orangeDeviceFrameGradientColor1,
            AppPalette.orangeDeviceFrameGradientColor2,
          ],
          controlBackgroundColor: CupertinoColors.white,
          controlBorderColor: AppPalette.orangeDeviceControlBorderColor,
          innerButtonGradientColors: [
            AppPalette.orangeDeviceControlInnerButtonGradientColor1,
            AppPalette.orangeDeviceControlInnerButtonGradientColor2,
          ],
          buttonAccentColor: AppPalette.orangeDeviceButtonColor,
          buttonIconColor: AppPalette.orangeDeviceButtonColor,
          isDark: false,
        );
      case DeviceColor.yellow:
        return const DeviceColorStyle(
          noiseOpacity: 1,
          frameGradientColors: [
            AppPalette.yellowDeviceFrameGradientColor1,
            AppPalette.yellowDeviceFrameGradientColor2,
          ],
          controlBackgroundColor: AppPalette.yellowDeviceControlBackgroundColor,
          controlBorderColor: AppPalette.yellowDeviceControlBorderColor,
          innerButtonGradientColors: [
            AppPalette.yellowDeviceControlInnerButtonGradientColor1,
            AppPalette.yellowDeviceControlInnerButtonGradientColor2,
          ],
          buttonAccentColor: AppPalette.yellowDeviceButtonColor,
          buttonIconColor: AppPalette.yellowDeviceButtonColor,
          isDark: false,
        );
      case DeviceColor.gold:
        return const DeviceColorStyle(
          noiseOpacity: 1,
          frameGradientColors: [
            AppPalette.goldDeviceFrameGradientColor1,
            AppPalette.goldDeviceFrameGradientColor2,
          ],
          controlBackgroundColor: AppPalette.goldDeviceControlBackgroundColor,
          controlBorderColor: AppPalette.goldDeviceControlBorderColor,
          innerButtonGradientColors: [
            AppPalette.goldDeviceControlInnerButtonGradientColor1,
            AppPalette.goldDeviceControlInnerButtonGradientColor2,
          ],
          buttonAccentColor: AppPalette.goldDeviceButtonColor,
          buttonIconColor: AppPalette.goldDeviceButtonColor,
          isDark: false,
        );
      case DeviceColor.lime:
        return const DeviceColorStyle(
          noiseOpacity: 1,
          frameGradientColors: [
            AppPalette.limeDeviceFrameGradientColor1,
            AppPalette.limeDeviceFrameGradientColor2,
          ],
          controlBackgroundColor: CupertinoColors.white,
          controlBorderColor: AppPalette.limeDeviceControlBorderColor,
          innerButtonGradientColors: [
            AppPalette.limeDeviceControlInnerButtonGradientColor1,
            AppPalette.limeDeviceControlInnerButtonGradientColor2,
          ],
          buttonAccentColor: AppPalette.limeDeviceButtonColor,
          buttonIconColor: AppPalette.limeDeviceButtonColor,
          isDark: false,
        );
      case DeviceColor.green:
        return const DeviceColorStyle(
          noiseOpacity: 0.6,
          frameGradientColors: [
            AppPalette.greenDeviceFrameGradientColor1,
            AppPalette.greenDeviceFrameGradientColor2,
          ],
          controlBackgroundColor: AppPalette.greenDeviceControlBackgroundColor,
          controlBorderColor: AppPalette.greenDeviceControlBorderColor,
          innerButtonGradientColors: [
            AppPalette.greenDeviceControlInnerButtonGradientColor1,
            AppPalette.greenDeviceControlInnerButtonGradientColor2,
          ],
          buttonAccentColor: AppPalette.greenDeviceButtonAccentColor,
          buttonIconColor: AppPalette.greenDeviceButtonAccentColor,
          isDark: true,
        );
      case DeviceColor.blue:
        return const DeviceColorStyle(
          noiseOpacity: 0.8,
          frameGradientColors: [
            AppPalette.blueDeviceFrameGradientColor1,
            AppPalette.blueDeviceFrameGradientColor2,
          ],
          controlBackgroundColor: AppPalette.blueDeviceControlBackgroundColor,
          controlBorderColor: AppPalette.blueDeviceControlBorderColor,
          innerButtonGradientColors: [
            AppPalette.blueDeviceControlInnerButtonGradientColor1,
            AppPalette.blueDeviceControlInnerButtonGradientColor2,
          ],
          buttonAccentColor: AppPalette.blueDeviceButtonAccentColor,
          buttonIconColor: AppPalette.blueDeviceButtonAccentColor,
          isDark: true,
        );
      case DeviceColor.pink:
        return const DeviceColorStyle(
          noiseOpacity: 1,
          frameGradientColors: [
            AppPalette.pinkDeviceFrameGradientColor1,
            AppPalette.pinkDeviceFrameGradientColor2,
          ],
          controlBackgroundColor: CupertinoColors.white,
          controlBorderColor: AppPalette.pinkDeviceControlBorderColor,
          innerButtonGradientColors: [
            AppPalette.pinkDeviceControlInnerButtonGradientColor1,
            AppPalette.pinkDeviceControlInnerButtonGradientColor2,
          ],
          buttonAccentColor: AppPalette.pinkDeviceButtonColor,
          buttonIconColor: AppPalette.pinkDeviceButtonColor,
          isDark: false,
        );
      case DeviceColor.purple:
        return const DeviceColorStyle(
          noiseOpacity: 1,
          frameGradientColors: [
            AppPalette.purpleDeviceFrameGradientColor1,
            AppPalette.purpleDeviceFrameGradientColor2,
          ],
          controlBackgroundColor: AppPalette.purpleDeviceControlBackgroundColor,
          controlBorderColor: AppPalette.purpleDeviceControlBorderColor,
          innerButtonGradientColors: [
            AppPalette.purpleDeviceControlInnerButtonGradientColor1,
            AppPalette.purpleDeviceControlInnerButtonGradientColor2,
          ],
          buttonAccentColor: AppPalette.purpleDeviceButtonColor,
          buttonIconColor: AppPalette.purpleDeviceButtonColor,
          isDark: false,
        );
      case DeviceColor.brown:
        return const DeviceColorStyle(
          noiseOpacity: 0.8,
          frameGradientColors: [
            AppPalette.brownDeviceFrameGradientColor1,
            AppPalette.brownDeviceFrameGradientColor2,
          ],
          controlBackgroundColor: AppPalette.brownDeviceControlBackgroundColor,
          controlBorderColor: AppPalette.brownDeviceControlBorderColor,
          innerButtonGradientColors: [
            AppPalette.brownDeviceControlInnerButtonGradientColor1,
            AppPalette.brownDeviceControlInnerButtonGradientColor2,
          ],
          buttonAccentColor: AppPalette.brownDeviceButtonAccentColor,
          buttonIconColor: AppPalette.brownDeviceButtonAccentColor,
          isDark: true,
        );
    }
  }
}
