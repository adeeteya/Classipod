import 'package:classipod/core/constants/app_color_scheme.dart';
import 'package:classipod/l10n/generated/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

extension BuildContextExtensions on BuildContext {
  Size get screenSize {
    return MediaQuery.sizeOf(this);
  }

  TextStyle get appTextStyle => CupertinoTheme.of(this).textTheme.textStyle;

  GoRouter get router {
    return GoRouter.of(this);
  }

  AppLocalizations get localization {
    return AppLocalizations.of(this)!;
  }
}

extension BuildContextColorExtensions on BuildContext {
  Color get appBackgroundColor =>
      AppColorScheme.screenBackground.resolveFrom(this);

  Color get appSurfaceColor => AppColorScheme.surface.resolveFrom(this);

  Color get appPrimaryTextColor => AppColorScheme.primaryText.resolveFrom(this);

  Color get appSecondaryTextColor =>
      AppColorScheme.secondaryText.resolveFrom(this);

  Color get appInverseTextColor => AppColorScheme.inverseText.resolveFrom(this);

  Color get appOutlineColor => AppColorScheme.outline.resolveFrom(this);

  Color get appDeviceScreenBorderColor =>
      AppColorScheme.deviceScreenBorder.resolveFrom(this);

  Color get appDeviceScreenBackgroundColor =>
      AppColorScheme.deviceScreenBackground.resolveFrom(this);

  Color get appControlSurfaceColor =>
      AppColorScheme.controlSurface.resolveFrom(this);

  Color get appIconEmphasisColor =>
      AppColorScheme.iconEmphasis.resolveFrom(this);
}
