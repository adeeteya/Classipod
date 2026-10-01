import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/theme/ipod_typography.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

enum AppTheme {
  light,
  dark;

  static AppTheme fromName(String value) {
    return AppTheme.values.firstWhere(
      (theme) => theme.name == value,
      orElse: () => AppTheme.light,
    );
  }

  String title(BuildContext context) {
    switch (this) {
      case AppTheme.light:
        return context.localization.lightThemeTitle;
      case AppTheme.dark:
        return context.localization.darkThemeTitle;
    }
  }

  CupertinoThemeData toCupertinoTheme() {
    switch (this) {
      case AppTheme.light:
        return CupertinoThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: CupertinoColors.white,
          barBackgroundColor: CupertinoColors.white,
          primaryColor: CupertinoColors.activeBlue,
          textTheme: CupertinoTextThemeData(
            navTitleTextStyle: IpodTypography.screenTitle.copyWith(
              color: CupertinoColors.black,
            ),
            navLargeTitleTextStyle: IpodTypography.title.copyWith(
              color: CupertinoColors.black,
            ),
            textStyle: IpodTypography.body.copyWith(
              color: CupertinoColors.black,
            ),
          ),
        );
      case AppTheme.dark:
        return CupertinoThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: AppPalette.darkScreenBackground,
          barBackgroundColor: AppPalette.darkSurface,
          primaryColor: CupertinoColors.activeBlue,
          textTheme: CupertinoTextThemeData(
            navTitleTextStyle: IpodTypography.screenTitle.copyWith(
              color: AppPalette.darkPrimaryText,
            ),
            navLargeTitleTextStyle: IpodTypography.title.copyWith(
              color: AppPalette.darkPrimaryText,
            ),
            textStyle: IpodTypography.body.copyWith(
              color: AppPalette.darkPrimaryText,
            ),
          ),
        );
    }
  }
}
