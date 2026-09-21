import 'package:classipod/core/constants/assets.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
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
        return const CupertinoThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: CupertinoColors.white,
          barBackgroundColor: CupertinoColors.white,
          primaryColor: CupertinoColors.activeBlue,
          textTheme: CupertinoTextThemeData(
            textStyle: TextStyle(
              color: CupertinoColors.black,
              fontFamily: Assets.helveticaFont,
            ),
          ),
        );
      case AppTheme.dark:
        return const CupertinoThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Color(0xFF1F1F21),
          barBackgroundColor: Color(0xFF2C2C2E),
          primaryColor: CupertinoColors.activeBlue,
          textTheme: CupertinoTextThemeData(
            textStyle: TextStyle(
              color: CupertinoColors.white,
              fontFamily: Assets.helveticaFont,
            ),
          ),
        );
    }
  }
}
