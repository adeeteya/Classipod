import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:classipod/core/constants/keys.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/models/playback_shuffle_mode.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/core/services/playback/library_audio_handler.dart';
import 'package:classipod/features/device/models/device_action.dart';
import 'package:classipod/features/device/services/device_buttons_service_provider.dart';
import 'package:classipod/features/device/widgets/device_controls.dart';
import 'package:classipod/features/now_playing/models/now_playing_model.dart';
import 'package:classipod/features/now_playing/provider/now_playing_details_provider.dart';
import 'package:classipod/features/now_playing/screen/now_playing_screen.dart';
import 'package:classipod/features/now_playing/widgets/now_playing_bottom_bar.dart';
import 'package:classipod/features/now_playing/widgets/scrubber_bar.dart';
import 'package:classipod/features/now_playing/widgets/shuffle_segmented_control.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:classipod/features/settings/models/click_wheel_sensitivity.dart';
import 'package:classipod/features/settings/models/click_wheel_size.dart';
import 'package:classipod/features/settings/models/device_color.dart';
import 'package:classipod/features/settings/models/settings_preferences_model.dart';
import 'package:classipod/features/settings/models/volume_mode.dart';
import 'package:classipod/features/tutorial/controller/tutorial_controller.dart';
import 'package:classipod/features/tutorial/models/tutorial_model.dart';
import 'package:classipod/l10n/generated/app_localizations.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';

class _Handler extends BaseAudioHandler implements LibraryAudioHandler {
  @override
  Duration get displayPosition => const Duration(seconds: 20);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _Player extends Fake implements AudioPlayer {
  double level = 0.5;

  @override
  double get volume => level;

  @override
  Future<void> setVolume(double value) async {
    level = value;
  }

  @override
  Stream<double> get volumeStream => Stream.value(0.5);
}

class _Details extends NowPlayingDetailsNotifier {
  _Details(this.hasLyrics);

  final bool hasLyrics;
  int ratingIncreases = 0;
  int ratingDecreases = 0;

  void changeTrack() {
    state = state.copyWith(currentIndex: state.currentIndex + 1);
  }

  @override
  NowPlayingModel build() {
    final song = MusicMetadata(
      trackName: 'Song',
      trackDuration: 60000,
      lyrics: hasLyrics ? 'Line one\nLine two' : null,
    );
    return NowPlayingModel(
      currentIndex: 0,
      isPlaying: false,
      nowPlayingType: NowPlayingType.songs,
      currentMetadata: song,
      metadataList: [song],
      shuffleMode: PlaybackShuffleMode.off,
      loopMode: LoopMode.off,
    );
  }

  @override
  Future<void> increaseCurrentMetadataRating() async {
    ratingIncreases++;
    await setCurrentMetadataRating(
      ((state.currentMetadata?.rating ?? 0) + 1).clamp(0, 5),
    );
  }

  @override
  Future<void> decreaseCurrentMetadataRating() async {
    ratingDecreases++;
    await setCurrentMetadataRating(
      ((state.currentMetadata?.rating ?? 0) - 1).clamp(0, 5),
    );
  }

  @override
  Future<void> setCurrentMetadataRating(int value) async {
    state = state.copyWith(
      currentMetadata: state.currentMetadata!.copyWith(rating: value),
    );
  }
}

class _AudioService extends AudioPlayerServiceNotifier {
  PlaybackShuffleMode? _appliedShuffle;
  int _playbackToggles = 0;
  int _nextSongCalls = 0;
  int _previousSongCalls = 0;
  final List<int> seeks = [];
  Completer<void>? seekCompletion;

  @override
  Future<void> seekToDuration(int targetDurationInSeconds) async {
    seeks.add(targetDurationInSeconds);
    await seekCompletion?.future;
  }

  @override
  Future<void> nextSong() async {
    _nextSongCalls++;
  }

  @override
  Future<void> seekBackwards() async {
    _previousSongCalls++;
  }

  @override
  Future<void> togglePlayback() async {
    _playbackToggles++;
  }

  @override
  Future<void> build() async {}

  @override
  Future<void> setShuffleMode(PlaybackShuffleMode mode) async {
    _appliedShuffle = mode;
  }
}

class _SettingsModel extends Fake implements SettingsPreferencesModel {
  @override
  DeviceColor get deviceColor => DeviceColor.values.first;

  @override
  ClickWheelSize get clickWheelSize => ClickWheelSize.medium;

  @override
  ClickWheelSensitivity get clickWheelSensitivity =>
      ClickWheelSensitivity.medium;

  @override
  bool get vibrate => false;

  @override
  bool get clickWheelSound => false;

  @override
  VolumeMode get volumeMode => VolumeMode.app;
}

class _Settings extends SettingsPreferencesControllerNotifier {
  int increases = 0;
  int decreases = 0;
  @override
  SettingsPreferencesModel build() => _SettingsModel();

  @override
  Future<void> increaseVolume() async {
    increases++;
    final player = ref.read(audioPlayerProvider);
    await player.setVolume((player.volume + 0.05).clamp(0, 1));
  }

  @override
  Future<void> decreaseVolume() async {
    decreases++;
    final player = ref.read(audioPlayerProvider);
    await player.setVolume((player.volume - 0.05).clamp(0, 1));
  }
}

class _Tutorial extends TutorialControllerNotifier {
  @override
  TutorialModel build() => TutorialModel(
    isMenuFirstTime: false,
    isNowPlayingFirstTime: false,
    isInputTextBarFirstTime: false,
  );
}

class _Buttons extends DeviceButtonsServiceNotifier {
  @override
  Future<void> setDeviceAction(DeviceAction action) async {
    state = null;
    state = action;
  }
}

void main() {
  late ProviderContainer container;
  late GoRouter router;
  late _AudioService audio;

  Future<void> mount(WidgetTester tester, {bool hasLyrics = true}) async {
    audio = _AudioService();
    container = ProviderContainer(
      overrides: [
        nowPlayingDetailsProvider.overrideWith(() => _Details(hasLyrics)),
        tutorialControllerProvider.overrideWith(_Tutorial.new),
        audioPlayerServiceProvider.overrideWith(() => audio),
        libraryAudioHandlerProvider.overrideWithValue(_Handler()),
        audioPlayerProvider.overrideWithValue(_Player()),
        settingsPreferencesControllerProvider.overrideWith(_Settings.new),
        deviceButtonsServiceProvider.overrideWith(_Buttons.new),
      ],
    );
    router = GoRouter(
      initialLocation: '/nowPlaying',
      routes: [
        GoRoute(
          path: '/nowPlaying',
          name: 'nowPlaying',
          builder: (_, _) => const NowPlayingScreen(),
        ),
      ],
    );
    addTearDown(router.dispose);
    addTearDown(container.dispose);
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: CupertinoApp.router(
          routerConfig: router,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  PageController controller(WidgetTester tester) =>
      tester.widget<PageView>(find.byType(PageView)).controller!;

  Future<void> input(WidgetTester tester, DeviceAction action) async {
    await container
        .read(deviceButtonsServiceProvider.notifier)
        .setDeviceAction(action);
    await tester.pump();
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 301));
    await tester.pump();
  }

  void wheelGesture(bool active) {
    container.read(clickWheelGestureProvider.notifier).active = active;
  }

  for (final forward in [true, false]) {
    testWidgets(
      'OK returns to progress after rating ${forward ? 'increase' : 'decrease'}',
      (tester) async {
        await mount(tester);
        await container
            .read(nowPlayingDetailsProvider.notifier)
            .setCurrentMetadataRating(3);
        await input(tester, DeviceAction.select);
        await input(tester, DeviceAction.select);
        await input(
          tester,
          forward ? DeviceAction.rotateForward : DeviceAction.rotateBackward,
        );
        await input(tester, DeviceAction.select);
        expect(controller(tester).page, 0);
        expect(
          container.read(nowPlayingDetailsProvider).currentMetadata?.rating,
          forward ? 4 : 2,
        );
        expect(audio.seeks, isEmpty);
        await tester.pumpWidget(const SizedBox.shrink());
      },
    );

    testWidgets(
      'OK returns to progress after volume ${forward ? 'increase' : 'decrease'}',
      (tester) async {
        await mount(tester);
        await input(
          tester,
          forward ? DeviceAction.rotateForward : DeviceAction.rotateBackward,
        );
        await input(tester, DeviceAction.select);
        expect(controller(tester).page, 0);
        expect(
          container.read(audioPlayerProvider).volume,
          closeTo(forward ? 0.55 : 0.45, 0.0001),
        );
        // Reopening must capture a fresh baseline.
        await input(
          tester,
          forward ? DeviceAction.rotateBackward : DeviceAction.rotateForward,
        );
        await input(tester, DeviceAction.select);
        expect(controller(tester).page, 0);
        expect(audio.seeks, isEmpty);
        await tester.pumpWidget(const SizedBox.shrink());
      },
    );
  }

  testWidgets('restoring the original rating still advances to shuffle', (
    tester,
  ) async {
    await mount(tester);
    await input(tester, DeviceAction.select);
    await input(tester, DeviceAction.select);
    await input(tester, DeviceAction.rotateForward);
    await input(tester, DeviceAction.rotateBackward);
    await input(tester, DeviceAction.select);
    expect(controller(tester).page, 3);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('restoring the original volume keeps its existing OK behavior', (
    tester,
  ) async {
    await mount(tester);
    await input(tester, DeviceAction.rotateForward);
    await input(tester, DeviceAction.rotateBackward);
    await input(tester, DeviceAction.select);
    expect(controller(tester).page, 1);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('volume clamped at maximum does not count as a change', (
    tester,
  ) async {
    await mount(tester);
    await container.read(audioPlayerProvider).setVolume(1);
    await input(tester, DeviceAction.rotateForward);
    await input(tester, DeviceAction.select);
    expect(controller(tester).page, 1);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('wheel gestures preserve volume and rating controls', (
    tester,
  ) async {
    await mount(tester);
    wheelGesture(true);
    await input(tester, DeviceAction.rotateForward);
    await input(tester, DeviceAction.rotateBackward);
    wheelGesture(false);
    final settings = container.read(
      settingsPreferencesControllerProvider.notifier,
    ) as _Settings;
    expect(settings.increases, 1);
    expect(settings.decreases, 1);
    await tester.pump(const Duration(seconds: 4));
    await tester.pumpAndSettle();
    await input(tester, DeviceAction.select);
    await input(tester, DeviceAction.select);
    wheelGesture(true);
    await input(tester, DeviceAction.rotateForward);
    await input(tester, DeviceAction.rotateBackward);
    wheelGesture(false);
    final details =
        container.read(nowPlayingDetailsProvider.notifier) as _Details;
    expect(details.ratingIncreases, 1);
    expect(details.ratingDecreases, 1);
    expect(audio.seeks, isEmpty);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('real wheel gestures preserve taps and emit release separately', (
    tester,
  ) async {
    await mount(tester);
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const CupertinoApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Center(child: SizedBox(width: 300, child: DeviceControls())),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 1));
    final actions = <DeviceAction>[];
    final subscription = container.listen(deviceButtonsServiceProvider, (
      _,
      action,
    ) {
      if (action != null) actions.add(action);
    });
    addTearDown(subscription.close);
    for (final entry in {
      menuButtonGlobalKey: DeviceAction.menu,
      previousButtonGlobalKey: DeviceAction.seekBackward,
      nextButtonGlobalKey: DeviceAction.seekForward,
      centerButtonGlobalKey: DeviceAction.select,
      playPauseButtonGlobalKey: DeviceAction.playPause,
    }.entries) {
      actions.clear();
      await tester.tap(find.byKey(entry.key));
      await tester.pump();
      expect(actions, [entry.value]);
      expect(container.read(clickWheelGestureProvider), isFalse);
    }
    expect(audio._playbackToggles, 1);
    actions.clear();
    final heldButton = await tester.startGesture(
      tester.getCenter(find.byKey(previousButtonGlobalKey)),
    );
    await tester.pump(const Duration(milliseconds: 600));
    expect(actions, [DeviceAction.seekBackwardLongPress]);
    await heldButton.up();
    await tester.pump();
    expect(actions, [
      DeviceAction.seekBackwardLongPress,
      DeviceAction.longPressEnd,
    ]);
    expect(container.read(clickWheelGestureProvider), isFalse);
    actions.clear();
    final gesture = await tester.startGesture(
      tester.getCenter(find.byKey(nextButtonGlobalKey)),
    );
    await tester.pump();
    expect(container.read(clickWheelGestureProvider), isTrue);
    expect(actions, isEmpty);
    await gesture.moveBy(const Offset(0, 30));
    await tester.pump();
    await gesture.moveBy(const Offset(0, 30));
    await tester.pump();
    expect(actions, contains(DeviceAction.rotateForward));
    await gesture.up();
    await tester.pump();
    expect(container.read(clickWheelGestureProvider), isFalse);
    expect(
      actions.every((action) => action == DeviceAction.rotateForward),
      isTrue,
    );
    final cancelled = await tester.startGesture(
      tester.getCenter(find.byKey(nextButtonGlobalKey)),
    );
    await tester.pump();
    expect(container.read(clickWheelGestureProvider), isTrue);
    await cancelled.cancel();
    await tester.pump();
    expect(container.read(clickWheelGestureProvider), isFalse);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('scrubbing previews and seeks once one second after release', (
    tester,
  ) async {
    await mount(tester);
    await input(tester, DeviceAction.select);
    wheelGesture(true);
    await input(tester, DeviceAction.rotateForward);
    await input(tester, DeviceAction.rotateForward);
    await input(tester, DeviceAction.rotateBackward);
    final bar = tester
        .widgetList<NowPlayingBottomBar>(find.byType(NowPlayingBottomBar))
        .firstWhere((bar) => bar.showScrubber);
    expect(bar.scrubberController?.position, 21);
    expect(find.text('0:21'), findsOneWidget);
    await tester.pump(const Duration(seconds: 5));
    expect(audio.seeks, isEmpty);
    expect(controller(tester).page, 1);
    wheelGesture(false);
    await tester.pump(const Duration(milliseconds: 999));
    expect(audio.seeks, isEmpty);
    await tester.pump(const Duration(milliseconds: 1));
    expect(audio.seeks, [21]);
    await input(tester, DeviceAction.select);
    expect(controller(tester).page, 0);
    expect(audio.seeks, [21]);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('a new gesture cancels the release countdown', (tester) async {
    await mount(tester);
    await input(tester, DeviceAction.select);
    wheelGesture(true);
    await input(tester, DeviceAction.rotateForward);
    wheelGesture(false);
    await tester.pump(const Duration(milliseconds: 800));
    wheelGesture(true);
    await tester.pump(const Duration(seconds: 2));
    expect(audio.seeks, isEmpty);
    await input(tester, DeviceAction.rotateForward);
    wheelGesture(false);
    await tester.pump(const Duration(seconds: 1));
    expect(audio.seeks, [22]);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('OK awaits the pending seek before returning to progress', (
    tester,
  ) async {
    await mount(tester);
    await input(tester, DeviceAction.select);
    await input(tester, DeviceAction.rotateForward);
    audio.seekCompletion = Completer<void>();
    await input(tester, DeviceAction.select);
    expect(audio.seeks, [21]);
    expect(controller(tester).page, 1);
    audio.seekCompletion!.complete();
    await tester.pumpAndSettle();
    expect(controller(tester).page, 0);
    await tester.pump(const Duration(seconds: 2));
    expect(audio.seeks, [21]);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('reversing to the original position still advances to rating', (
    tester,
  ) async {
    await mount(tester);
    await input(tester, DeviceAction.select);
    await input(tester, DeviceAction.rotateForward);
    await input(tester, DeviceAction.rotateBackward);
    await input(tester, DeviceAction.select);
    expect(audio.seeks, isEmpty);
    expect(controller(tester).page, 2);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('disposing cancels an uncommitted scrub', (tester) async {
    await mount(tester);
    await input(tester, DeviceAction.select);
    await input(tester, DeviceAction.rotateForward);
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(seconds: 2));
    expect(audio.seeks, isEmpty);
  });

  testWidgets('changing track cancels an uncommitted scrub', (tester) async {
    await mount(tester);
    await input(tester, DeviceAction.select);
    await input(tester, DeviceAction.rotateForward);
    (container.read(nowPlayingDetailsProvider.notifier) as _Details)
        .changeTrack();
    await tester.pump(const Duration(seconds: 2));
    expect(audio.seeks, isEmpty);
    await input(tester, DeviceAction.select);
    expect(controller(tester).page, 2);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('scrub targets clamp to track boundaries', (tester) async {
    await mount(tester);
    await input(tester, DeviceAction.select);
    final scrubber = tester
        .widget<ScrubberBar>(find.byType(ScrubberBar))
        .controller!;
    scrubber.step(-100);
    await tester.pump(const Duration(seconds: 1));
    expect(audio.seeks, [0]);
    scrubber.step(500);
    await tester.pump(const Duration(seconds: 1));
    expect(audio.seeks, [0, 60]);
    expect(audio._playbackToggles, 0);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('scrubber long press also waits one second after release', (
    tester,
  ) async {
    await mount(tester);
    await input(tester, DeviceAction.select);
    await input(tester, DeviceAction.seekForwardLongPress);
    await tester.pump(const Duration(seconds: 2));
    expect(audio.seeks, isEmpty);
    await container
        .read(deviceButtonsServiceProvider.notifier)
        .setDeviceAction(DeviceAction.longPressEnd);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 999));
    expect(audio.seeks, isEmpty);
    await tester.pump(const Duration(milliseconds: 1));
    expect(audio.seeks, hasLength(1));
    expect(audio.seeks.single, greaterThan(20));
    await tester.pumpWidget(const SizedBox.shrink());
  });

  for (final entry in {
    'seeker': 1,
    'rating': 2,
    'shuffle': 3,
    'volume': 1,
    'shuffle without lyrics': 3,
  }.entries) {
    testWidgets(
      '${entry.key} returns after four seconds in one forward slide',
      (tester) async {
        await mount(tester, hasLyrics: entry.key != 'shuffle without lyrics');
        if (entry.key == 'volume') {
          await input(tester, DeviceAction.rotateForward);
        } else {
          for (var i = 0; i < entry.value; i++) {
            await input(tester, DeviceAction.select);
          }
        }
        final pager = controller(tester);
        expect(pager.page, entry.value.toDouble());
        await tester.pump(const Duration(milliseconds: 3999));
        expect(pager.page, entry.value.toDouble());
        await tester.pump(const Duration(milliseconds: 1));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 150));
        expect(pager.page, greaterThan(entry.value));
        expect(pager.page, lessThan(entry.value + 1));
        final progressBars = tester.widgetList<NowPlayingBottomBar>(
          find.byType(NowPlayingBottomBar),
        );
        expect(progressBars.any((bar) => !bar.showScrubber), isTrue);
        await tester.pump(const Duration(milliseconds: 151));
        await tester.pump();
        expect(pager.page, 0);
        // The normal sequence is restored after the temporary return page.
        await input(tester, DeviceAction.select);
        expect(pager.page, 1);
        await tester.pumpWidget(const SizedBox.shrink());
        expect(tester.takeException(), isNull);
      },
    );
  }

  testWidgets('lyrics stays open until manually advancing to progress', (
    tester,
  ) async {
    await mount(tester);
    for (var i = 0; i < 4; i++) {
      await input(tester, DeviceAction.select);
    }
    await tester.pump(const Duration(seconds: 10));
    expect(controller(tester).page, 4);
    await input(tester, DeviceAction.rotateForward);
    await tester.pump(const Duration(seconds: 10));
    expect(controller(tester).page, 4);
    await input(tester, DeviceAction.select);
    expect(controller(tester).page, 0);
    // Allow the title's entrance delay to finish after leaving lyrics.
    await tester.pump(const Duration(seconds: 1));
    await tester.pumpWidget(const SizedBox.shrink());
    expect(tester.takeException(), isNull);
  });

  testWidgets('wheel input resets rating inactivity', (tester) async {
    await mount(tester);
    await input(tester, DeviceAction.select);
    await input(tester, DeviceAction.select);
    await tester.pump(const Duration(seconds: 3));
    await input(tester, DeviceAction.rotateForward);
    await tester.pump(const Duration(seconds: 3));
    expect(controller(tester).page, 2);
    await tester.pump(const Duration(seconds: 1));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 301));
    await tester.pump();
    expect(controller(tester).page, 0);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('seek buttons move shuffle selection without changing songs', (
    tester,
  ) async {
    await mount(tester);
    for (var i = 0; i < 3; i++) {
      await input(tester, DeviceAction.select);
    }
    PlaybackShuffleMode selection() => tester
        .widget<ShuffleSegmentedControl>(find.byType(ShuffleSegmentedControl))
        .shuffleMode;

    await input(tester, DeviceAction.seekBackward);
    expect(selection(), PlaybackShuffleMode.values.first);
    await input(tester, DeviceAction.seekForward);
    expect(selection(), PlaybackShuffleMode.values[1]);
    await input(tester, DeviceAction.seekForward);
    expect(selection(), PlaybackShuffleMode.values.last);
    await input(tester, DeviceAction.seekForward);
    expect(selection(), PlaybackShuffleMode.values.last);
    await tester.pump(const Duration(seconds: 3));
    await input(tester, DeviceAction.seekBackward);
    expect(selection(), PlaybackShuffleMode.values[1]);
    await tester.pump(const Duration(seconds: 3));
    expect(controller(tester).page, 3);
    expect(audio._nextSongCalls, 0);
    expect(audio._previousSongCalls, 0);
    await tester.pump(const Duration(seconds: 1));
    await tester.pumpAndSettle();
    expect(audio._appliedShuffle, PlaybackShuffleMode.values[1]);
    expect(controller(tester).page, 0);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  for (final page in [0, 1, 2, 4]) {
    testWidgets('seek buttons retain playback behavior on page $page', (
      tester,
    ) async {
      await mount(tester);
      for (var i = 0; i < page; i++) {
        await input(tester, DeviceAction.select);
      }
      await input(tester, DeviceAction.seekForward);
      await input(tester, DeviceAction.seekBackward);
      expect(audio._nextSongCalls, 1);
      expect(audio._previousSongCalls, 1);
      await tester.pumpWidget(const SizedBox.shrink());
    });
  }

  testWidgets('shuffle selection is applied on inactivity', (tester) async {
    await mount(tester);
    for (var i = 0; i < 3; i++) {
      await input(tester, DeviceAction.select);
    }
    await input(tester, DeviceAction.rotateForward);
    await tester.pump(const Duration(seconds: 4));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 301));
    await tester.pump();
    expect(audio._appliedShuffle, PlaybackShuffleMode.values[1]);
    expect(controller(tester).page, 0);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  for (final touchInput in [true, false]) {
    testWidgets('${touchInput ? 'touch' : 'play/pause'} resets inactivity', (
      tester,
    ) async {
      await mount(tester);
      await input(tester, DeviceAction.select);
      await input(tester, DeviceAction.select);
      await tester.pump(const Duration(seconds: 3));
      if (touchInput) {
        final gesture = await tester.startGesture(const Offset(400, 20));
        await gesture.up();
      } else {
        await container
            .read(deviceButtonsServiceProvider.notifier)
            .playPauseButtonClick();
        expect(audio._playbackToggles, 1);
      }
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 3999));
      expect(controller(tester).page, 2);
      await tester.pump(const Duration(milliseconds: 1));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 301));
      await tester.pump();
      expect(controller(tester).page, 0);
      await tester.pumpWidget(const SizedBox.shrink());
    });
  }

  testWidgets('input during automatic return waits for the forward slide', (
    tester,
  ) async {
    await mount(tester);
    await input(tester, DeviceAction.select);
    await input(tester, DeviceAction.select);
    await tester.pump(const Duration(seconds: 4));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 150));
    await container
        .read(deviceButtonsServiceProvider.notifier)
        .setDeviceAction(DeviceAction.select);
    await tester.pumpAndSettle();
    expect(controller(tester).page, 1);
    await tester.pumpWidget(const SizedBox.shrink());
    expect(tester.takeException(), isNull);
  });
}
