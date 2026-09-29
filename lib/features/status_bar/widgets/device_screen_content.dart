import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/features/menu/screens/split_screen_placeholder.dart';
import 'package:classipod/features/music/album/models/album_model.dart';
import 'package:classipod/features/music/playlist/providers/playlists_provider.dart';
import 'package:classipod/features/music/search/provider/search_provider.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:classipod/features/status_bar/controller/status_bar_entrance_controller.dart';
import 'package:classipod/features/status_bar/controller/status_bar_transition_observer.dart';
import 'package:classipod/features/status_bar/widgets/status_bar.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DeviceScreenContent extends ConsumerStatefulWidget {
  final Widget child;
  final StatusBarTransitionObserver transitionObserver;

  const DeviceScreenContent({
    super.key,
    required this.child,
    required this.transitionObserver,
  });

  @override
  ConsumerState<DeviceScreenContent> createState() =>
      _DeviceScreenContentState();
}

class _DeviceScreenContentState extends ConsumerState<DeviceScreenContent>
    with SingleTickerProviderStateMixin {
  late final StatusBarEntranceController _entrance =
      StatusBarEntranceController(vsync: this);

  @override
  void dispose() {
    _entrance.dispose();
    super.dispose();
  }

  _Header? _current;
  _Header? _previous;
  String? _location;
  String? _routeName;
  bool _changesLayout = false;
  bool _waitingForTransition = false;
  int _transitionRevision = -1;

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    final observer = widget.transitionObserver;
    return ListenableBuilder(
      listenable: Listenable.merge([router.routerDelegate, observer]),
      builder: (context, _) => Consumer(
        builder: (context, ref, _) {
          final state = router.state;
          final splitEnabled = ref.watch(
            settingsPreferencesControllerProvider.select(
              (settings) => settings.splitScreenEnabled,
            ),
          );
          final header = _Header(
            title: _title(context, ref, state),
            split: splitEnabled && _usesSplitScreen(state),
            visible: state.name != Routes.splash.name,
            delayedEntrance:
                state.name == Routes.coverFlow.name ||
                state.name == Routes.nowPlaying.name,
            splitController:
                splitEnabled &&
                    _usesSplitScreen(state) &&
                    state.name != Routes.sleepTimer.name
                ? ref.read(splitScreenViewControllerProvider)
                : null,
          );
          final location = '${state.pageKey}:${state.uri}';
          if (_location != location) {
            final preserveCoverFlowSelectionHeader =
                _routeName == Routes.coverFlowSelection.name &&
                (state.name == Routes.coverFlow.name ||
                    state.name == Routes.nowPlaying.name);
            _routeName = state.name;
            _previous = _current;
            _changesLayout =
                _previous != null &&
                _previous!.visible &&
                header.visible &&
                _previous!.split != header.split;
            _waitingForTransition =
                _changesLayout && _transitionRevision == observer.revision;
            _location = location;
            _entrance.cancelEntrance();
            if (preserveCoverFlowSelectionHeader) {
              _entrance.value = 1;
            } else if (header.delayedEntrance) {
              _entrance.prepare();
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (!mounted || _location != location) return;
                _entrance.startAfterTransition(observer.animation);
              });
            }
          }
          if (_transitionRevision != observer.revision) {
            _waitingForTransition = false;
          }
          _transitionRevision = observer.revision;
          _current = header;
          return ClipRect(
            child: Stack(
              fit: StackFit.expand,
              children: [
                widget.child,
                if (header.visible)
                  if (_waitingForTransition)
                    _bar(_previous!)
                  else if (_changesLayout && observer.animation != null)
                    AnimatedBuilder(
                      animation: observer.animation!,
                      builder: (context, _) {
                        final animation = observer.animation!;
                        if (animation.status == AnimationStatus.completed ||
                            animation.status == AnimationStatus.dismissed) {
                          return _bar(header);
                        }
                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            if (observer.isPopping) ...[
                              _transition(context, observer.incoming!, header),
                              _transition(
                                context,
                                observer.outgoing!,
                                _previous!,
                              ),
                            ] else ...[
                              _transition(
                                context,
                                observer.outgoing!,
                                _previous!,
                              ),
                              _transition(context, observer.incoming!, header),
                            ],
                          ],
                        );
                      },
                    )
                  else
                    _bar(header),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _bar(_Header header) => Align(
    alignment: Alignment.topLeft,
    child: FractionallySizedBox(
      widthFactor: header.split ? 0.5 : 1,
      child: header.splitController == null
          ? _statusBar(header)
          : AnimatedBuilder(
              animation: header.splitController!,
              child: StatusBar(title: header.title),
              builder: (context, child) => FractionalTranslation(
                translation: header.splitController!.leftSlideOffset,
                child: child,
              ),
            ),
    ),
  );

  Widget _statusBar(_Header header) {
    final bar = StatusBar(title: header.title);
    if (!header.delayedEntrance) return bar;
    return AnimatedBuilder(
      animation: _entrance,
      child: bar,
      builder: (context, child) => FractionalTranslation(
        translation: Offset(
          0,
          Curves.easeOutCubic.transform(_entrance.value) - 1,
        ),
        child: child,
      ),
    );
  }

  Widget _transition(
    BuildContext context,
    PageRoute<dynamic> route,
    _Header header,
  ) {
    final observer = widget.transitionObserver;
    final coveringRoute = observer.isPopping
        ? observer.outgoing!
        : observer.incoming!;
    final delegatedTransition = coveringRoute.delegatedTransition;
    final secondaryAnimation = route.secondaryAnimation!;
    if (route != coveringRoute &&
        delegatedTransition != null &&
        delegatedTransition != route.delegatedTransition &&
        !secondaryAnimation.isDismissed) {
      final child = route.buildTransitions(
        context,
        route.animation!,
        const AlwaysStoppedAnimation<double>(0),
        _bar(header),
      );
      return delegatedTransition(
            context,
            route.animation!,
            secondaryAnimation,
            route.allowSnapshotting,
            child,
          ) ??
          child;
    }
    return route.buildTransitions(
      context,
      route.animation!,
      secondaryAnimation,
      _bar(header),
    );
  }

  bool _usesSplitScreen(GoRouterState state) => {
    Routes.menu.name,
    Routes.musicMenu.name,
    Routes.settings.name,
    Routes.librarySettings.name,
    Routes.language.name,
    Routes.deviceColor.name,
    Routes.sleepTimer.name,
  }.contains(state.name);

  String _title(BuildContext context, WidgetRef ref, GoRouterState state) {
    final route = Routes.values.firstWhere(
      (route) => route.name == state.name,
      orElse: () => Routes.menu,
    );
    switch (route) {
      case Routes.artistAlbums:
        return state.pathParameters['artistName'] ?? '';
      case Routes.genreSongs:
        return state.pathParameters['genreName'] ?? '';
      case Routes.albumSongs:
        return (state.extra as AlbumModel).albumName;
      case Routes.playlistSongs:
        final key = int.tryParse(state.extra as String);
        final playlists = ref.watch(playlistsProvider);
        for (final playlist in playlists) {
          if (playlist.key == key) return playlist.name;
        }
        return route.title(context);
      case Routes.playlistRename:
        return state.extra as String;
      case Routes.search:
        final query = ref.watch(searchQueryProvider);
        final results = ref.watch(searchProvider(query));
        return results.isEmpty
            ? route.title(context)
            : '${context.localization.searchResultsText} ${results.length}';
      default:
        return route.title(context);
    }
  }
}

class _Header {
  final String title;
  final bool split;
  final bool visible;
  final bool delayedEntrance;
  final SplitScreenViewController? splitController;

  const _Header({
    required this.title,
    required this.split,
    required this.visible,
    required this.delayedEntrance,
    required this.splitController,
  });
}
