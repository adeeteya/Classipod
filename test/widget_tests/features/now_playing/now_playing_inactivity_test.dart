import 'package:audio_service/audio_service.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/models/playback_shuffle_mode.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/core/services/playback/library_audio_handler.dart';
import 'package:classipod/features/device/models/device_action.dart';
import 'package:classipod/features/device/services/device_buttons_service_provider.dart';
import 'package:classipod/features/now_playing/models/now_playing_model.dart';
import 'package:classipod/features/now_playing/provider/now_playing_details_provider.dart';
import 'package:classipod/features/now_playing/screen/now_playing_screen.dart';
import 'package:classipod/features/now_playing/widgets/now_playing_bottom_bar.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
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
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _Player extends Fake implements AudioPlayer {
  @override
  Stream<double> get volumeStream => Stream.value(0.5);
}

class _Details extends NowPlayingDetailsNotifier {
  _Details(this.hasLyrics);

  final bool hasLyrics;
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
  Future<void> increaseCurrentMetadataRating() async {}
}

class _AudioService extends AudioPlayerServiceNotifier {
  PlaybackShuffleMode? appliedShuffle;
  int playbackToggles = 0;

  @override
  Future<void> togglePlayback() async {
    playbackToggles++;
  }

  @override
  Future<void> build() async {}

  @override
  Future<void> setShuffleMode(PlaybackShuffleMode mode) async {
    appliedShuffle = mode;
  }
}

class _SettingsModel extends Fake implements SettingsPreferencesModel {
  @override
  bool get vibrate => false;

  @override
  bool get clickWheelSound => false;

  @override
  VolumeMode get volumeMode => VolumeMode.app;
}

class _Settings extends SettingsPreferencesControllerNotifier {
  @override
  SettingsPreferencesModel build() => _SettingsModel();

  @override
  Future<void> increaseVolume() async {}
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
    expect(audio.appliedShuffle, PlaybackShuffleMode.values[1]);
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
        expect(audio.playbackToggles, 1);
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
