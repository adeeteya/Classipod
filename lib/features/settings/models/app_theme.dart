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
          scaffoldBackgroundColor: const Color(0xFF1F1F21),
          barBackgroundColor: const Color(0xFF2C2C2E),
          primaryColor: CupertinoColors.activeBlue,
          textTheme: CupertinoTextThemeData(
            navTitleTextStyle: IpodTypography.screenTitle.copyWith(
              color: CupertinoColors.white,
            ),
            navLargeTitleTextStyle: IpodTypography.title.copyWith(
              color: CupertinoColors.white,
            ),
            textStyle: IpodTypography.body.copyWith(
              color: CupertinoColors.white,
            ),
          ),
        );
    }
  }
}
