import 'dart:ui';

import 'package:classipod/features/status_bar/widgets/status_bar.dart';
import 'package:flutter/cupertino.dart';

class OptionsModalPage<T> extends Page<T> {
  final BuildContext context;
  final WidgetBuilder builder;
  final String title;
  final ImageFilter? filter;
  final Color barrierColor;
  final bool barrierDismissible;
  final bool useRootNavigator;
  final bool semanticsDismissible;
  final RouteSettings? routeSettings;
  final Offset? anchorPoint;

  const OptionsModalPage({
    required this.context,
    required this.builder,
    required this.title,
    this.filter,
    this.barrierColor = kCupertinoModalBarrierColor,
    this.barrierDismissible = true,
    this.useRootNavigator = true,
    this.semanticsDismissible = false,
    this.routeSettings,
    this.anchorPoint,
  });

  @override
  Route<T> createRoute(BuildContext context) => OptionsModalPopupRoute<T>(
    settings: this,
    builder: builder,
    title: title,
    filter: filter,
    barrierColor: CupertinoDynamicColor.resolve(barrierColor, context),
    barrierDismissible: barrierDismissible,
    semanticsDismissible: semanticsDismissible,
    anchorPoint: anchorPoint,
  );
}

class OptionsModalPopupRoute<T> extends PopupRoute<T> {
  OptionsModalPopupRoute({
    required this.builder,
    required this.title,
    this.barrierLabel = 'Dismiss',
    this.barrierColor = kCupertinoModalBarrierColor,
    bool barrierDismissible = true,
    bool semanticsDismissible = false,
    super.filter,
    super.settings,
    super.requestFocus,
    this.anchorPoint,
  }) : _barrierDismissible = barrierDismissible,
       _semanticsDismissible = semanticsDismissible;

  final WidgetBuilder builder;

  final String title;

  final bool _barrierDismissible;

  final bool _semanticsDismissible;

  @override
  final String barrierLabel;

  @override
  final Color? barrierColor;

  @override
  bool get barrierDismissible => _barrierDismissible;

  @override
  bool get semanticsDismissible => _semanticsDismissible;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  CurvedAnimation? _animation;

  late Tween<Offset> _offsetTween;

  final Offset? anchorPoint;

  @override
  Animation<double> createAnimation() {
    assert(_animation == null);
    _animation = CurvedAnimation(
      parent: super.createAnimation(),
      curve: Curves.linearToEaseOut,
      reverseCurve: Curves.linearToEaseOut.flipped,
    );
    _offsetTween = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: Offset.zero,
    );
    return _animation!;
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return CupertinoUserInterfaceLevel(
      data: CupertinoUserInterfaceLevelData.elevated,
      child: DisplayFeatureSubScreen(
        anchorPoint: anchorPoint,
        child: Builder(builder: builder),
      ),
    );
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          if (animation.status != AnimationStatus.reverse)
            StatusBar(title: title),
          FractionalTranslation(
            translation: _offsetTween.evaluate(_animation!),
            child: child,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animation?.dispose();
    super.dispose();
  }
}
