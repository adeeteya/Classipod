import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

extension GoRouterExtension on GoRouter {
  String get location {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    final String location = matchList.uri.toString();
    return location;
  }

  String get locationNamed {
    return location.split("/").last.split("?").first;
  }
}

final _pendingNavigation = Expando<Set<String>>();

extension UniqueRouteNavigation on BuildContext {
  Future<void> openUniqueNamed(
    String name, {
    Map<String, String> pathParameters = const {},
    Object? extra,
    bool replaceCurrent = false,
  }) async {
    final router = GoRouter.of(this);
    final pending = _pendingNavigation[router] ??= <String>{};
    if (!pending.add(name)) return;
    unawaited(
      WidgetsBinding.instance.endOfFrame.then((_) {
        pending.remove(name);
      }),
    );
    // Finish dispatching the current button event before revealing another page.
    await Future<void>.value();
    if (!mounted) return;

    RouteMatchBase? findExisting(List<RouteMatchBase> matches) {
      for (final match in matches) {
        final route = match.route;
        if (route is GoRoute && route.name == name) return match;
        if (match is ShellRouteMatch) {
          final nested = findExisting(match.matches);
          if (nested != null) return nested;
        }
      }
      return null;
    }

    final existing = findExisting(
      router.routerDelegate.currentConfiguration.matches,
    );
    var shouldReplace = replaceCurrent;

    if (existing != null) {
      while (router.routerDelegate.currentConfiguration.last != existing) {
        final before = router.routerDelegate.currentConfiguration;
        router.pop();
        if (identical(before, router.routerDelegate.currentConfiguration)) {
          return;
        }
      }
      final match = existing;
      final matches = match is ImperativeRouteMatch
          ? match.matches
          : router.routerDelegate.currentConfiguration;
      final destination = router.namedLocation(
        name,
        pathParameters: pathParameters,
      );
      if (matches.uri.toString() == destination &&
          (extra == null || matches.extra == extra)) {
        return;
      }
      shouldReplace = true;
    }

    if (shouldReplace) {
      await router.pushReplacementNamed<void>(
        name,
        pathParameters: pathParameters,
        extra: extra,
      );
    } else {
      await router.pushNamed<void>(
        name,
        pathParameters: pathParameters,
        extra: extra,
      );
    }
  }
}
