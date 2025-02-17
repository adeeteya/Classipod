import 'package:classipod/l10n/generated/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

extension BuildContextExtensions on BuildContext {
  Size get screenSize {
    return MediaQuery.sizeOf(this);
  }

  GoRouter get router {
    return GoRouter.of(this);
  }

  AppLocalizations get localization {
    return AppLocalizations.of(this)!;
  }
}
