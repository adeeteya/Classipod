import 'dart:async';
import 'dart:math';

import 'package:audio_service/audio_service.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/services/playback/android_audio_handler.dart';
import 'package:classipod/core/services/playback/logical_queue.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:just_audio/just_audio.dart';

class TestPlayer extends Fake implements AudioPlayer {
  final states = StreamController<ProcessingState>.broadcast();
  final playingEvents = StreamController<bool>.broadcast();
  final loadedIds = <String>[];
  bool failLoad = false;
  int sourceCount = 0;

  @override
  bool playing = false;
  @override
  ProcessingState processingState = ProcessingState.idle;
  @override
  Duration position = Duration.zero;
  @override
  Duration get bufferedPosition => Duration.zero;
  @override
  double get speed => 1;
  @override
  Stream<PlaybackEvent> get playbackEventStream => const Stream.empty();
  @override
  Stream<PlayerException> get errorStream => const Stream.empty();
  @override
  Stream<ProcessingState> get processingStateStream => states.stream;
  @override
  Stream<bool> get playingStream => playingEvents.stream;

  @override
  Future<Duration?> setAudioSource(
    AudioSource source, {
    bool preload = true,
    int? initialIndex,
    Duration? initialPosition,
  }) async {
    if (failLoad) throw StateError('unreadable track');
    sourceCount = 1;
    loadedIds.add(((source as UriAudioSource).tag as MediaItem).id);
    position = Duration.zero;
    processingState = ProcessingState.ready;
    states.add(processingState);
    return const Duration(seconds: 10);
  }

  @override
  Future<void> clearAudioSources() async {
    sourceCount = 0;
    processingState = ProcessingState.idle;
  }

  @override
  Future<void> play() async {
    playing = true;
    playingEvents.add(true);
  }

  @override
  Future<void> pause() async {
    playing = false;
    playingEvents.add(false);
  }

  @override
  Future<void> stop() async {
    await pause();
    processingState = ProcessingState.idle;
  }

  @override
  Future<void> seek(Duration? position, {int? index}) async {
    this.position = position ?? Duration.zero;
    processingState = ProcessingState.ready;
    states.add(processingState);
  }

  void complete() {
    processingState = ProcessingState.completed;
    states.add(processingState);
  }

  Future<void> close() async {
    await states.close();
    await playingEvents.close();
  }
}

MusicMetadata song(int index) => MusicMetadata(
  originalSongIndex: index,
  songId: 'song-$index',
  contentUri: 'content://media/external/audio/media/$index',
  trackName: 'Song $index',
);

Future<void> flushEvents() => Future.delayed(const Duration(milliseconds: 10));

void main() {
  late TestPlayer player;
  late AndroidAudioHandler handler;
  setUp(() {
    player = TestPlayer();
    handler = AndroidAudioHandler(player);
  });
  tearDown(() async {
    await handler.dispose();
    await player.close();
  });

  test('50k library loads one source and exports no native queue', () async {
    await handler.setSongs(List.generate(50000, song), preload: false);
    expect(player.loadedIds, ['song-0']);
    expect(handler.queue.value, isEmpty);
    await handler.select(49998);
    expect(player.sourceCount, 1);
    expect(handler.currentIndex, 49998);
    expect(handler.mediaItem.value!.extras!['songId'], 'song-49998');
    await handler.skipToNext();
    expect(handler.currentIndex, 49999);
    await handler.skipToPrevious();
    expect(handler.currentIndex, 49998);
    expect(player.loadedIds.length, 4);
    expect(handler.mediaItem.value!.id, 'classipod-current');
    expect(handler.queue.value, isEmpty);
  });

  test(
    'completion advances, stops at end, and repeat respects logical queue',
    () async {
      await handler.setSongs([song(0), song(1)]);
      await handler.play();
      player.complete();
      await flushEvents();
      expect(handler.currentIndex, 1);
      expect(player.playing, isTrue);
      player.complete();
      await flushEvents();
      expect(player.playing, isFalse);
      await handler.setRepeatMode(AudioServiceRepeatMode.all);
      await handler.play();
      player.complete();
      await flushEvents();
      expect(handler.currentIndex, 0);
      await handler.setRepeatMode(AudioServiceRepeatMode.one);
      player.complete();
      await flushEvents();
      expect(handler.currentIndex, 0);
      await handler.skipToNext();
      expect(handler.currentIndex, 1); // manual next bypasses repeat one
    },
  );

  test(
    'reordered queue selects by position and reports matching metadata',
    () async {
      final indices = <int?>[];
      final subscription = handler.indexStream.listen(indices.add);
      await handler.setSongs([song(99), song(4), song(37)]);
      await Future.wait([handler.select(2), handler.select(1)]);
      await flushEvents();
      expect(handler.currentIndex, 1);
      expect(handler.mediaItem.value!.extras!['songId'], 'song-4');
      expect(player.loadedIds, ['song-99', 'song-37', 'song-4']);
      expect(indices, [0, 2, 1]);
      await subscription.cancel();
    },
  );

  test(
    'failure does not poison later commands; empty queue clears track',
    () async {
      await handler.setSongs([song(0), song(1)]);
      player.failLoad = true;
      await expectLater(handler.select(1), throwsStateError);
      player.failLoad = false;
      await handler.select(0);
      expect(player.playing, isTrue);
      await handler.setSongs([]);
      await handler.play();
      expect(player.sourceCount, 0);
      expect(handler.currentIndex, isNull);
      expect(handler.mediaItem.value, isNull);
      expect(player.playing, isFalse);
    },
  );

  test('previous restarts after three seconds; pause and seek work', () async {
    await handler.setSongs([song(0), song(1)]);
    await handler.select(1);
    await handler.seek(const Duration(seconds: 5));
    await handler.skipToPrevious();
    expect(handler.currentIndex, 1);
    expect(player.position, Duration.zero);
    await handler.pause();
    await handler.skipToPrevious();
    expect(handler.currentIndex, 0);
    expect(player.playing, isFalse);
  });

  test(
    'shuffle visits all 50k positions once and restores sequential order',
    () {
      final queue = LogicalQueue(random: Random(42));
      queue.reset(50000);
      queue.index = 123;
      queue.setShuffle(true);
      final visited = <int>{queue.index};
      while (queue.next() != null) {
        final next = queue.next()!;
        queue.index = next;
        expect(visited.add(next), isTrue);
      }
      expect(visited.length, 50000);
      queue.setShuffle(false);
      queue.index = 123;
      expect(queue.next(), 124);
      expect(queue.previous(), 122);
      queue.loopMode = LoopMode.all;
      queue.index = 49999;
      expect(queue.next(), 0);
      queue.index = 0;
      expect(queue.previous(), 49999);
    },
  );
}
