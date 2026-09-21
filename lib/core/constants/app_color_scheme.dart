import 'package:classipod/core/constants/app_palette.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

class AppColorScheme {
  AppColorScheme._();

  static const CupertinoDynamicColor screenBackground =
      CupertinoDynamicColor.withBrightness(
        color: CupertinoColors.white,
        darkColor: Color(0xFF0F1115),
      );

  static const CupertinoDynamicColor surface =
      CupertinoDynamicColor.withBrightness(
        color: CupertinoColors.white,
        darkColor: Color(0xFF1C1D21),
      );

  static const CupertinoDynamicColor primaryText =
      CupertinoDynamicColor.withBrightness(
        color: CupertinoColors.black,
        darkColor: Color(0xFFE6E7EA),
      );

  static const CupertinoDynamicColor secondaryText =
      CupertinoDynamicColor.withBrightness(
        color: AppPalette.hintTextColor,
        darkColor: Color(0xFF9FA4B5),
      );

  static const CupertinoDynamicColor inverseText =
      CupertinoDynamicColor.withBrightness(
        color: CupertinoColors.white,
        darkColor: Color(0xFF101214),
      );

  static const CupertinoDynamicColor outline =
      CupertinoDynamicColor.withBrightness(
        color: AppPalette.sliderBorderColor,
        darkColor: Color(0xFF2F2F33),
      );

  static const CupertinoDynamicColor deviceScreenBorder =
      CupertinoDynamicColor.withBrightness(
        color: AppPalette.deviceScreenBorderColor,
        darkColor: AppPalette.deviceScreenBorderColor,
      );

  static const CupertinoDynamicColor deviceScreenBackground =
      CupertinoDynamicColor.withBrightness(
        color: CupertinoColors.white,
        darkColor: AppPalette.darkDeviceScreenColor,
      );

  static const CupertinoDynamicColor controlSurface =
      CupertinoDynamicColor.withBrightness(
        color: CupertinoColors.white,
        darkColor: AppPalette.darkDeviceControlBackgroundColor,
      );

  static const CupertinoDynamicColor iconEmphasis =
      CupertinoDynamicColor.withBrightness(
        color: CupertinoColors.black,
        darkColor: CupertinoColors.white,
      );

  static const CupertinoDynamicColor iconMuted =
      CupertinoDynamicColor.withBrightness(
        color: CupertinoColors.white,
        darkColor: Color(0xFF1A1C1F),
      );
}
