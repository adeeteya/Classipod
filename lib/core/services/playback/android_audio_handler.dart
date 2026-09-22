import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/services/playback/logical_queue.dart';
import 'package:just_audio/just_audio.dart';

class AndroidAudioHandler extends BaseAudioHandler {
  final AudioPlayer player;
  final LogicalQueue logicalQueue = LogicalQueue();
  final StreamController<int?> _indices = StreamController.broadcast();
  final List<StreamSubscription<dynamic>> _subscriptions = [];
  List<MusicMetadata> _songs = [];
  Future<void> _pending = Future.value();
  bool _loading = false;
  String? _error;

  AndroidAudioHandler(this.player) {
    _subscriptions.add(player.playbackEventStream.listen((_) => _broadcast()));
    _subscriptions.add(player.playingStream.listen((_) => _broadcast()));
    _subscriptions.add(
      player.processingStateStream.distinct().listen((processing) {
        if (processing == ProcessingState.completed &&
            player.playing &&
            !_loading) {
          unawaited(
            _serialize(() async {
              if (!player.playing ||
                  player.processingState != ProcessingState.completed) {
                return;
              }
              final next = logicalQueue.next(automatic: true);
              if (next == null) {
                await player.pause();
              } else {
                await _load(next, startPlaying: true);
              }
            }).catchError(_reportError),
          );
        }
      }),
    );
    _subscriptions.add(player.errorStream.listen(_reportError));
  }

  Stream<int?> get indexStream => _indices.stream;
  int? get currentIndex => _songs.isEmpty ? null : logicalQueue.index;

  Future<void> _serialize(Future<void> Function() action) {
    final result = _pending.then((_) => action());
    _pending = result.catchError((Object _) {});
    return result;
  }

  Future<void> setSongs(List<MusicMetadata> songs, {bool preload = true}) {
    return _serialize(() async {
      await player.pause();
      _songs = List.unmodifiable(songs);
      logicalQueue.reset(songs.length);
      if (songs.isEmpty) {
        _error = null;
        await player.clearAudioSources();
        mediaItem.add(null);
        _indices.add(null);
        _broadcast();
      } else {
        await _load(0, preload: preload);
      }
    });
  }

  Future<void> select(int index, {bool startPlaying = true}) {
    return _serialize(() async {
      if (index < 0 || index >= _songs.length) return;
      await _load(index, startPlaying: startPlaying);
    });
  }

  Future<void> _load(
    int index, {
    bool startPlaying = false,
    bool preload = true,
  }) async {
    _loading = true;
    _error = null;
    try {
      await player.pause();
      final source = _songs[index].toAudioSource() as UriAudioSource;
      logicalQueue.index = index;
      _indices.add(index);
      final item = source.tag as MediaItem;
      mediaItem.add(
        item.copyWith(
          id: 'classipod-current',
          extras: {...?item.extras, 'songId': item.id},
        ),
      );
      await player.setAudioSource(source, preload: preload);
      if (startPlaying) _startPlayer();
    } catch (error) {
      _reportError(error);
      rethrow;
    } finally {
      _loading = false;
      _broadcast();
    }
  }

  void _startPlayer() {
    unawaited(player.play().catchError(_reportError));
  }

  @override
  Future<void> play() => _serialize(() async {
    if (_songs.isEmpty) return;
    if (player.processingState == ProcessingState.completed) {
      await player.seek(Duration.zero);
    }
    _startPlayer();
  });

  @override
  Future<void> pause() => _serialize(player.pause);

  @override
  Future<void> stop() => _serialize(player.stop);

  @override
  Future<void> seek(Duration position) =>
      _serialize(() => player.seek(position));

  @override
  Future<void> skipToNext() => _serialize(() async {
    final next = logicalQueue.next();
    if (next != null) await _load(next, startPlaying: player.playing);
  });

  @override
  Future<void> skipToPrevious() => _serialize(() async {
    if (player.position > const Duration(seconds: 3)) {
      await player.seek(Duration.zero);
      return;
    }
    final previous = logicalQueue.previous();
    if (previous != null) await _load(previous, startPlaying: player.playing);
  });

  @override
  Future<void> skipToQueueItem(int index) => select(index);

  @override
  Future<void> setRepeatMode(AudioServiceRepeatMode repeatMode) async {
    logicalQueue.loopMode = switch (repeatMode) {
      AudioServiceRepeatMode.one => LoopMode.one,
      AudioServiceRepeatMode.all ||
      AudioServiceRepeatMode.group => LoopMode.all,
      AudioServiceRepeatMode.none => LoopMode.off,
    };
    _broadcast();
  }

  @override
  Future<void> setShuffleMode(AudioServiceShuffleMode shuffleMode) async {
    logicalQueue.setShuffle(shuffleMode != AudioServiceShuffleMode.none);
    _broadcast();
  }

  void _reportError(Object error) {
    _error = error.toString();
    playbackState.add(
      playbackState.value.copyWith(
        processingState: AudioProcessingState.error,
        errorCode: 1,
        errorMessage: error.toString(),
      ),
    );
  }

  void _broadcast() {
    playbackState.add(
      PlaybackState(
        controls: [
          MediaControl.skipToPrevious,
          player.playing ? MediaControl.pause : MediaControl.play,
          MediaControl.skipToNext,
          MediaControl.stop,
        ],
        systemActions: const {
          MediaAction.seek,
          MediaAction.seekForward,
          MediaAction.seekBackward,
        },
        androidCompactActionIndices: const [0, 1, 2],
        processingState: _error != null
            ? AudioProcessingState.error
            : switch (player.processingState) {
                ProcessingState.idle => AudioProcessingState.idle,
                ProcessingState.loading => AudioProcessingState.loading,
                ProcessingState.buffering => AudioProcessingState.buffering,
                ProcessingState.ready => AudioProcessingState.ready,
                ProcessingState.completed => AudioProcessingState.completed,
              },
        errorCode: _error == null ? null : 1,
        errorMessage: _error,
        playing: player.playing,
        updatePosition: player.position,
        bufferedPosition: player.bufferedPosition,
        speed: player.speed,
        repeatMode: switch (logicalQueue.loopMode) {
          LoopMode.off => AudioServiceRepeatMode.none,
          LoopMode.one => AudioServiceRepeatMode.one,
          LoopMode.all => AudioServiceRepeatMode.all,
        },
        shuffleMode: logicalQueue.shuffled
            ? AudioServiceShuffleMode.all
            : AudioServiceShuffleMode.none,
      ),
    );
  }

  Future<void> dispose() async {
    for (final subscription in _subscriptions) {
      await subscription.cancel();
    }
    await _indices.close();
  }
}
