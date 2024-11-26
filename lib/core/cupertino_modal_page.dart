import 'dart:ui';

import 'package:flutter/cupertino.dart';

class CupertinoModalPage<T> extends Page<T> {
  final BuildContext context;
  final WidgetBuilder builder;
  final ImageFilter? filter;
  final Color barrierColor;
  final bool barrierDismissible;
  final bool useRootNavigator;
  final bool semanticsDismissible;
  final RouteSettings? routeSettings;
  final Offset? anchorPoint;

  const CupertinoModalPage({
    required this.context,
    required this.builder,
    this.filter,
    this.barrierColor = kCupertinoModalBarrierColor,
    this.barrierDismissible = true,
    this.useRootNavigator = true,
    this.semanticsDismissible = false,
    this.routeSettings,
    this.anchorPoint,
  });

  @override
  Route<T> createRoute(BuildContext context) => CupertinoModalPopupRoute<T>(
        settings: this,
        builder: builder,
        filter: filter,
        barrierColor: CupertinoDynamicColor.resolve(barrierColor, context),
        barrierDismissible: barrierDismissible,
        semanticsDismissible: semanticsDismissible,
        anchorPoint: anchorPoint,
      );
}
