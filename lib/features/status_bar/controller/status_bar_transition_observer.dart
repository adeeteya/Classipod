import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final statusBarTransitionObserverProvider = Provider((ref) {
  final observer = StatusBarTransitionObserver();
  ref.onDispose(observer.dispose);
  return observer;
});

class StatusBarTransitionObserver extends NavigatorObserver
    with ChangeNotifier {
  PageRoute<dynamic>? outgoing;
  PageRoute<dynamic>? incoming;
  Animation<double>? animation;
  bool _disposed = false;
  bool isPopping = false;
  int revision = 0;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route is PageRoute && previousRoute is PageRoute) {
      isPopping = false;
      outgoing = previousRoute;
      incoming = route;
      animation = route.animation;
      _notifyAfterNavigation();
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route is PageRoute && previousRoute is PageRoute) {
      isPopping = true;
      outgoing = route;
      incoming = previousRoute;
      animation = route.animation;
      _notifyAfterNavigation();
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    animation = null;
    outgoing = null;
    incoming = null;
    _notifyAfterNavigation();
  }

  void _notifyAfterNavigation() {
    revision++;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_disposed) notifyListeners();
    });
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
