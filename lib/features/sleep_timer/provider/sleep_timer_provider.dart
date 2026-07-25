import 'dart:async';

import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/features/sleep_timer/models/sleep_timer_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

typedef SleepTimerClock = DateTime Function();
typedef SleepTimerScheduler =
    Timer Function(Duration duration, void Function() callback);

abstract interface class SleepTimerPlayback {
  int? get currentIndex;
  Duration? get duration;
  bool get playing;
  Duration get position;
  double get speed;
  Stream<int?> get currentIndexStream;
  Stream<Duration?> get durationStream;
  Stream<bool> get playingStream;
  Stream<Duration> get positionStream;
  Stream<double> get speedStream;
  Future<void> pause();
}

final sleepTimerClockProvider = Provider<SleepTimerClock>((_) => DateTime.now);

final sleepTimerSchedulerProvider = Provider<SleepTimerScheduler>(
  (_) => Timer.new,
);

final sleepTimerPlaybackProvider = Provider<SleepTimerPlayback>((ref) {
  return _AudioPlayerSleepTimerPlayback(
    player: ref.read(audioPlayerProvider),
    pausePlayback: ref.read(audioPlayerServiceProvider.notifier).pause,
  );
});

final sleepTimerControllerProvider =
    NotifierProvider<SleepTimerController, SleepTimerState>(
      SleepTimerController.new,
    );

class SleepTimerController extends Notifier<SleepTimerState> {
  static const Duration _endBoundaryLead = Duration(milliseconds: 25);
  static const Duration _naturalTransitionTolerance = Duration(seconds: 1);

  Timer? _timer;
  StreamSubscription<int?>? _currentIndexSubscription;
  StreamSubscription<Duration?>? _durationSubscription;
  StreamSubscription<bool>? _playingSubscription;
  StreamSubscription<Duration>? _positionSubscription;
  StreamSubscription<double>? _speedSubscription;
  int _generation = 0;
  int? _targetIndex;
  Duration _lastPosition = Duration.zero;
  Duration? _lastDuration;

  SleepTimerPlayback get _playback => ref.read(sleepTimerPlaybackProvider);

  @override
  SleepTimerState build() {
    ref.onDispose(_disposeResources);
    return const SleepTimerState.off();
  }

  void start(Duration duration) {
    if (duration <= Duration.zero) {
      cancel();
      return;
    }

    _resetResources();
    final int generation = _generation;
    final DateTime deadline = ref.read(sleepTimerClockProvider)().add(duration);
    state = SleepTimerState(
      mode: SleepTimerMode.fixedDuration,
      duration: duration,
      deadline: deadline,
    );
    _timer = ref.read(sleepTimerSchedulerProvider)(
      duration,
      () => unawaited(_expire(generation)),
    );
  }

  void stopAtEndOfCurrentSong() {
    final int? currentIndex = _playback.currentIndex;
    if (currentIndex == null) {
      cancel();
      return;
    }

    _resetResources();
    _targetIndex = currentIndex;
    _lastPosition = _playback.position;
    _lastDuration = _playback.duration;
    state = const SleepTimerState(mode: SleepTimerMode.endOfCurrentSong);

    _currentIndexSubscription = _playback.currentIndexStream.listen(
      _handleCurrentIndex,
    );
    _durationSubscription = _playback.durationStream.listen((duration) {
      _lastDuration = duration;
      _scheduleEndOfSong();
    });
    _playingSubscription = _playback.playingStream.listen((_) {
      _scheduleEndOfSong();
    });
    _positionSubscription = _playback.positionStream.listen((position) {
      _lastPosition = position;
      _scheduleEndOfSong();
    });
    _speedSubscription = _playback.speedStream.listen((_) {
      _scheduleEndOfSong();
    });
    _scheduleEndOfSong();
  }

  void cancel() {
    _resetResources();
    state = const SleepTimerState.off();
  }

  void _handleCurrentIndex(int? currentIndex) {
    if (state.mode != SleepTimerMode.endOfCurrentSong) {
      return;
    }

    if (currentIndex == null) {
      cancel();
      return;
    }

    final Duration? previousDuration = _lastDuration;
    final bool wasNaturalTransition =
        currentIndex != _targetIndex &&
        previousDuration != null &&
        previousDuration - _lastPosition <= _naturalTransitionTolerance;
    if (wasNaturalTransition) {
      unawaited(_expire(_generation));
      return;
    }

    _targetIndex = currentIndex;
    _lastPosition = _playback.position;
    _lastDuration = _playback.duration;
    _scheduleEndOfSong();
  }

  void _scheduleEndOfSong() {
    _timer?.cancel();
    _timer = null;
    if (state.mode != SleepTimerMode.endOfCurrentSong ||
        !_playback.playing ||
        _playback.currentIndex != _targetIndex) {
      return;
    }

    final Duration? trackDuration = _playback.duration;
    if (trackDuration == null) {
      return;
    }

    final Duration remaining = trackDuration - _playback.position;
    if (remaining <= _endBoundaryLead) {
      unawaited(_expire(_generation));
      return;
    }

    final double speed = _playback.speed;
    if (speed <= 0) {
      return;
    }
    final int wallClockMicroseconds =
        (remaining.inMicroseconds / speed).round() -
        _endBoundaryLead.inMicroseconds;
    final Duration delay = Duration(
      microseconds: wallClockMicroseconds.clamp(0, remaining.inMicroseconds),
    );
    final int generation = _generation;
    _timer = ref.read(sleepTimerSchedulerProvider)(
      delay,
      () => unawaited(_expire(generation)),
    );
  }

  Future<void> _expire(int generation) async {
    if (generation != _generation || !state.isActive) {
      return;
    }
    await _playback.pause();
    if (generation == _generation) {
      _resetResources();
      state = const SleepTimerState.off();
    }
  }

  void _resetResources() {
    _generation++;
    _timer?.cancel();
    _timer = null;
    unawaited(_currentIndexSubscription?.cancel());
    unawaited(_durationSubscription?.cancel());
    unawaited(_playingSubscription?.cancel());
    unawaited(_positionSubscription?.cancel());
    unawaited(_speedSubscription?.cancel());
    _currentIndexSubscription = null;
    _durationSubscription = null;
    _playingSubscription = null;
    _positionSubscription = null;
    _speedSubscription = null;
    _targetIndex = null;
    _lastPosition = Duration.zero;
    _lastDuration = null;
  }

  void _disposeResources() {
    _resetResources();
  }
}

class _AudioPlayerSleepTimerPlayback implements SleepTimerPlayback {
  final AudioPlayer player;
  final Future<void> Function() pausePlayback;

  const _AudioPlayerSleepTimerPlayback({
    required this.player,
    required this.pausePlayback,
  });

  @override
  int? get currentIndex => player.currentIndex;

  @override
  Duration? get duration => player.duration;

  @override
  bool get playing => player.playing;

  @override
  Duration get position => player.position;

  @override
  double get speed => player.speed;

  @override
  Stream<int?> get currentIndexStream => player.currentIndexStream;

  @override
  Stream<Duration?> get durationStream => player.durationStream;

  @override
  Stream<bool> get playingStream => player.playingStream;

  @override
  Stream<Duration> get positionStream => player.positionStream;

  @override
  Stream<double> get speedStream => player.speedStream;

  @override
  Future<void> pause() => pausePlayback();
}
