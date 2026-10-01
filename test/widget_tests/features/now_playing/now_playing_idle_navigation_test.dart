import 'dart:async';

import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/models/playback_shuffle_mode.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/features/device/models/device_action.dart';
import 'package:classipod/features/device/services/device_buttons_service_provider.dart';
import 'package:classipod/features/menu/screens/split_screen_placeholder.dart';
import 'package:classipod/features/now_playing/models/now_playing_model.dart';
import 'package:classipod/features/now_playing/provider/now_playing_details_provider.dart';
import 'package:classipod/features/now_playing/widgets/now_playing_idle_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';

class _Playback extends NowPlayingDetailsNotifier {
  @override
  NowPlayingModel build() => NowPlayingModel(
    currentIndex: 0,
    isPlaying: true,
    nowPlayingType: NowPlayingType.songs,
    currentMetadata: MusicMetadata(trackName: 'Song'),
    metadataList: [],
    shuffleMode: PlaybackShuffleMode.off,
    loopMode: LoopMode.off,
  );

  void pause() => state = state.copyWith(isPlaying: false);
  void play() => state = state.copyWith(isPlaying: true);
}

class _Buttons extends DeviceButtonsServiceNotifier {
  void rotate() {
    state = null;
    state = DeviceAction.rotateForward;
  }
}

class _SplitController extends SplitScreenViewController {
  int closeCalls = 0;
  int openCalls = 0;

  @override
  Future<void> closeSplitView() async {
    closeCalls++;
  }

  @override
  Future<void> openSplitView() async {
    openCalls++;
  }
}

void main() {
  late GoRouter router;
  late ProviderContainer container;
  late _SplitController splitController;

  Future<void> mount(WidgetTester tester, {String route = 'menu'}) async {
    splitController = _SplitController();
    container = ProviderContainer(
      overrides: [
        splitScreenViewControllerProvider.overrideWithValue(splitController),
        nowPlayingDetailsProvider.overrideWith(_Playback.new),
        deviceButtonsServiceProvider.overrideWith(_Buttons.new),
      ],
    );
    router = GoRouter(
      initialLocation: '/$route',
      routes: [
        ShellRoute(
          builder: (_, _, child) => NowPlayingIdleNavigation(child: child),
          routes: [
            for (final name in [
              'menu',
              'songs',
              'search',
              'searchMoreOptions',
              'playlistRename',
              'settings',
              'songsMoreOptions',
              'nowPlaying',
            ])
              GoRoute(
                path: '/$name',
                name: name,
                builder: (_, _) =>
                    CupertinoPageScaffold(child: Center(child: Text(name))),
              ),
          ],
        ),
      ],
    );
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: CupertinoApp.router(routerConfig: router),
      ),
    );
    await tester.pumpAndSettle();
    addTearDown(() async {
      await tester.pumpWidget(const SizedBox());
      router.dispose();
      container.dispose();
      splitController.dispose();
    });
  }

  String location() => router.routerDelegate.currentConfiguration.uri.path;

  testWidgets('opens after ten seconds and preserves the back destination', (
    tester,
  ) async {
    await mount(tester);
    await tester.pump(const Duration(seconds: 9));
    expect(location(), '/menu');
    await tester.pump(const Duration(seconds: 1));
    await tester.pumpAndSettle();
    expect(find.text('nowPlaying'), findsOneWidget);
    router.pop();
    await tester.pumpAndSettle();
    expect(find.text('menu'), findsOneWidget);
  });

  for (final route in ['menu', 'songs']) {
    testWidgets('idle navigation from $route closes and restores split view', (
      tester,
    ) async {
      await mount(tester, route: route);
      await tester.pump(const Duration(seconds: 9));
      expect(splitController.closeCalls, 0);
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      expect(splitController.closeCalls, 1);
      expect(splitController.openCalls, 0);
      // This is the same fade-transition hint used by the main menu.
      expect(router.state.extra, Routes.menu.name);
      router.pop();
      await tester.pumpAndSettle();
      expect(find.text(route), findsOneWidget);
      expect(splitController.openCalls, 1);
    });
  }

  for (final route in [
    'search',
    'searchMoreOptions',
    'playlistRename',
    'settings',
    'songsMoreOptions',
    'nowPlaying',
  ]) {
    testWidgets('does not leave $route', (tester) async {
      await mount(tester, route: route);
      await tester.pump(const Duration(seconds: 20));
      expect(location(), '/$route');
    });
  }

  testWidgets('pause cancels the timer and resume starts a full interval', (
    tester,
  ) async {
    await mount(tester);
    await tester.pump(const Duration(seconds: 9));
    final playback =
        container.read(nowPlayingDetailsProvider.notifier) as _Playback;
    playback.pause();
    await tester.pump(const Duration(seconds: 20));
    expect(location(), '/menu');
    playback.play();
    await tester.pump(const Duration(seconds: 9));
    expect(location(), '/menu');
    await tester.pump(const Duration(seconds: 1));
    await tester.pumpAndSettle();
    expect(find.text('nowPlaying'), findsOneWidget);
  });

  for (final input in ['touch', 'wheel', 'keyboard', 'navigation']) {
    testWidgets('$input restarts the timer', (tester) async {
      await mount(tester);
      await tester.pump(const Duration(seconds: 9));
      switch (input) {
        case 'touch':
          await tester.tap(find.text('menu'));
        case 'wheel':
          (container.read(deviceButtonsServiceProvider.notifier) as _Buttons)
              .rotate();
        case 'keyboard':
          await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
        case 'navigation':
          router.goNamed('songs');
          await tester.pumpAndSettle();
      }
      await tester.pump(const Duration(seconds: 9));
      expect(find.text('nowPlaying'), findsNothing);
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      expect(find.text('nowPlaying'), findsOneWidget);
    });
  }

  testWidgets('held touch and background time do not count as inactivity', (
    tester,
  ) async {
    await mount(tester);
    final gesture = await tester.startGesture(
      tester.getCenter(find.text('menu')),
    );
    await tester.pump(const Duration(seconds: 20));
    expect(location(), '/menu');
    await gesture.up();
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
    await tester.pump(const Duration(seconds: 20));
    expect(location(), '/menu');
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pump(const Duration(seconds: 9));
    expect(location(), '/menu');
    await tester.pump(const Duration(seconds: 1));
    await tester.pumpAndSettle();
    expect(find.text('nowPlaying'), findsOneWidget);
  });

  testWidgets('root dialogs suppress navigation until dismissed', (
    tester,
  ) async {
    await mount(tester);
    final context = tester.element(find.text('menu'));
    unawaited(
      showCupertinoDialog<void>(
        context: context,
        builder: (_) => const CupertinoAlertDialog(title: Text('Dialog')),
      ),
    );
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 20));
    expect(location(), '/menu');
    Navigator.of(context, rootNavigator: true).pop();
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 10));
    await tester.pumpAndSettle();
    expect(find.text('nowPlaying'), findsOneWidget);
  });
}
