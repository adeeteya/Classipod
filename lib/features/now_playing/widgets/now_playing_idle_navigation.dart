import 'dart:async';

import 'package:classipod/core/extensions/go_router_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/features/device/services/device_buttons_service_provider.dart';
import 'package:classipod/features/now_playing/provider/now_playing_details_provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class NowPlayingIdleNavigation extends ConsumerStatefulWidget {
  const NowPlayingIdleNavigation({super.key, required this.child});

  final Widget child;

  @override
  ConsumerState<NowPlayingIdleNavigation> createState() =>
      _NowPlayingIdleNavigationState();
}

class _NowPlayingIdleNavigationState
    extends ConsumerState<NowPlayingIdleNavigation>
    with WidgetsBindingObserver {
  static final _browsingRoutes = {
    Routes.menu.name,
    Routes.musicMenu.name,
    Routes.coverFlow.name,
    Routes.coverFlowSelection.name,
    Routes.artists.name,
    Routes.artistAlbums.name,
    Routes.albums.name,
    Routes.albumSongs.name,
    Routes.playlists.name,
    Routes.playlistSongs.name,
    Routes.songs.name,
    Routes.genres.name,
    Routes.genreSongs.name,
  };

  GoRouter? _router;
  Timer? _timer;
  final Set<int> _pointers = {};
  bool _resumed = true;

  bool get _eligible {
    final playback = ref.read(nowPlayingDetailsProvider);
    final configuration = _router?.routerDelegate.currentConfiguration;
    if (configuration == null || configuration.isEmpty) return false;
    final route = configuration.last.route;
    return _resumed &&
        _pointers.isEmpty &&
        HardwareKeyboard.instance.logicalKeysPressed.isEmpty &&
        playback.isPlaying &&
        playback.currentMetadata != null &&
        _browsingRoutes.contains(route.name) &&
        ModalRoute.of(context)?.isCurrent == true;
  }

  void _restartTimer() {
    _timer?.cancel();
    if (!mounted || !_eligible) return;
    _timer = Timer(const Duration(seconds: 10), () {
      if (mounted && _eligible) {
        unawaited(_openNowPlaying());
      }
    });
  }

  Future<void> _openNowPlaying() async {
    final splitController = ref.read(splitScreenViewControllerProvider);
    unawaited(splitController.closeSplitView());
    await context.openUniqueNamed(
      Routes.nowPlaying.name,
      extra: Routes.menu.name,
    );
    if (!mounted) return;
    unawaited(splitController.openSplitView());
  }

  bool _onKey(KeyEvent event) {
    _restartTimer();
    return false;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _resumed =
        WidgetsBinding.instance.lifecycleState == null ||
        WidgetsBinding.instance.lifecycleState == AppLifecycleState.resumed;
    HardwareKeyboard.instance.addHandler(_onKey);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final router = GoRouter.of(context);
    if (_router != router) {
      _router?.routerDelegate.removeListener(_restartTimer);
      _router = router;
      router.routerDelegate.addListener(_restartTimer);
    }
    _restartTimer();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _resumed = state == AppLifecycleState.resumed;
    if (!_resumed) _pointers.clear();
    _restartTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _router?.routerDelegate.removeListener(_restartTimer);
    HardwareKeyboard.instance.removeHandler(_onKey);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      nowPlayingDetailsProvider.select(
        (value) => value.isPlaying && value.currentMetadata != null,
      ),
      (_, _) => _restartTimer(),
    );
    ref.listen(deviceButtonsServiceProvider, (_, _) => _restartTimer());
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (event) {
        _pointers.add(event.pointer);
        _restartTimer();
      },
      onPointerUp: (event) {
        _pointers.remove(event.pointer);
        _restartTimer();
      },
      onPointerCancel: (event) {
        _pointers.remove(event.pointer);
        _restartTimer();
      },
      onPointerMove: (_) => _restartTimer(),
      onPointerSignal: (_) => _restartTimer(),
      child: widget.child,
    );
  }
}
