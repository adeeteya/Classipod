import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
