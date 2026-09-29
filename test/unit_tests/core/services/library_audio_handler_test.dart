import 'dart:async';
import 'dart:math';

import 'package:audio_service/audio_service.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/services/audio_files_service.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/core/services/playback/library_audio_handler.dart';
import 'package:classipod/core/services/playback/logical_queue.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:just_audio/just_audio.dart';

class TestPlayer extends Fake implements AudioPlayer {
  final states = StreamController<ProcessingState>.broadcast();
  final playingEvents = StreamController<bool>.broadcast();
  final errors = StreamController<PlayerException>.broadcast();
  final positions = StreamController<Duration>.broadcast();
  final loadedIds = <String>[];
  bool failLoad = false;
  PlayerException? loadError;
  Completer<void>? blockedSeek;
  bool rejectPause = false;
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
  Stream<PlayerException> get errorStream => errors.stream;
  @override
  Stream<Duration> get positionStream => positions.stream;
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
    if (loadError != null) throw loadError!;
    if (failLoad) throw StateError('unreadable track');
    sourceCount = 1;
    loadedIds.add(((source as UriAudioSource).tag as MediaItem).id);
    position = initialPosition ?? Duration.zero;
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
    if (rejectPause) throw StateError('Native session unavailable');
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
    await blockedSeek?.future;
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
    await errors.close();
    await positions.close();
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
  late LibraryAudioHandler handler;
  setUp(() {
    player = TestPlayer();
    handler = LibraryAudioHandler(player);
  });
  tearDown(() async {
    await handler.dispose();
    await player.close();
  });

  test(
    'media session initialization does not discover local files early',
    () async {
      var discoveries = 0;
      final container = ProviderContainer(
        overrides: [
          audioPlayerProvider.overrideWithValue(player),
          localLibraryProvider.overrideWith((_) async {
            discoveries++;
            return [];
          }),
        ],
      );
      addTearDown(container.dispose);
      container.read(libraryAudioHandlerProvider);
      await flushEvents();
      expect(discoveries, 0);
    },
  );

  test(
    'blocked HTTP reports HTTPS guidance without stream credentials',
    () async {
      await handler.dispose();
      handler = LibraryAudioHandler(
        player,
        resolveSource: (_) async => AudioSource.uri(
          Uri.parse('http://example.test/rest/stream.view?t=secret'),
          tag: const MediaItem(id: 'remote', title: 'Remote song'),
        ),
      );
      final remote = MusicMetadata(
        songId: 'remote',
        serverId: 'server',
        remoteSongId: 'id',
        isOnDevice: false,
      );
      await handler.setSongs([remote], preload: false);
      player.loadError = PlayerException(
        0,
        'Cleartext HTTP traffic not permitted: '
        'http://example.test/rest/stream.view?t=secret',
        null,
      );
      await expectLater(handler.play(), throwsStateError);
      final error = handler.playbackState.value.errorMessage!;
      expect(error, contains('HTTPS'));
      expect(error, isNot(contains('secret')));
      expect(error, isNot(contains('sign in')));
      player.loadError = null;
      await handler.play();
      expect(player.playing, isTrue);
      expect(handler.playbackState.value.errorMessage, isNull);
    },
  );

  test('UI play and next commands capture source failures', () async {
    final container = ProviderContainer(
      overrides: [
        audioPlayerProvider.overrideWithValue(player),
        libraryAudioHandlerProvider.overrideWithValue(handler),
        localLibraryProvider.overrideWith((_) async => []),
      ],
    );
    addTearDown(container.dispose);
    await container.read(audioPlayerServiceProvider.future);
    await handler.setSongs([song(0), song(1)]);
    player.failLoad = true;
    final service = container.read(audioPlayerServiceProvider.notifier);
    await service.nextSong();
    expect(container.read(audioPlayerServiceProvider).hasError, isTrue);
    await service.play();
    expect(container.read(audioPlayerServiceProvider).hasError, isTrue);
  });

  test(
    'startup defers unreadable local audio and permits another song',
    () async {
      await handler.dispose();
      var resolutions = 0;
      final blockedLocal = Completer<UriAudioSource>();
      handler = LibraryAudioHandler(
        player,
        resolveSource: (metadata) {
          resolutions++;
          if (!metadata.isSubsonic) return blockedLocal.future;
          return Future.value(
            AudioSource.uri(
              Uri.parse('https://example.test/stream'),
              tag: const MediaItem(id: 'remote', title: 'Remote song'),
            ),
          );
        },
      );
      final remote = MusicMetadata(
        songId: 'remote',
        serverId: 'server',
        remoteSongId: 'id',
        isOnDevice: false,
      );
      await handler
          .setSongs([song(0), remote], preload: false)
          .timeout(const Duration(seconds: 1));
      expect(resolutions, 0);
      expect(player.loadedIds, isEmpty);
      expect(handler.currentIndex, 0);
      await handler.select(1);
      expect(player.loadedIds, ['remote']);
      expect(player.playing, isTrue);
    },
  );

  test(
    'network interruption is reported and Play retries the current stream',
    () async {
      await handler.dispose();
      handler = LibraryAudioHandler(
        player,
        resolveSource: (_) async => AudioSource.uri(
          Uri.parse('https://example.test/stream?t=secret'),
          tag: const MediaItem(id: 'remote', title: 'Remote song'),
        ),
      );
      await handler.setSongs([
        MusicMetadata(songId: 'remote', serverId: 'server', remoteSongId: 'id'),
      ]);
      await handler.play();
      player.position = const Duration(seconds: 42);
      player.errors.add(
        PlayerException(
          0,
          'java.net.ConnectException: Failed to connect to '
          'https://example.test/stream?t=secret',
          0,
        ),
      );
      await flushEvents();
      expect(
        handler.playbackState.value.processingState,
        AudioProcessingState.buffering,
      );
      expect(handler.playbackState.value.errorMessage, isNull);
      final container = ProviderContainer(
        overrides: [
          audioPlayerProvider.overrideWithValue(player),
          libraryAudioHandlerProvider.overrideWithValue(handler),
          localLibraryProvider.overrideWith((_) async => []),
        ],
      );
      addTearDown(container.dispose);
      await container.read(audioPlayerServiceProvider.future);
      // Some backends retain playing=true after a source error.
      await container.read(audioPlayerServiceProvider.notifier).play();
      expect(handler.playbackState.value.errorCode, isNull);
      expect(player.position, const Duration(seconds: 42));
      expect(handler.currentIndex, 0);
      expect(player.loadedIds, ['remote', 'remote']);
    },
  );

  test('generic Android source failure auto resumes from checkpoint', () async {
    await handler.dispose();
    handler = LibraryAudioHandler(
      player,
      retryDelay: const Duration(milliseconds: 30),
      resolveSource: (_) async => AudioSource.uri(
        Uri.parse('https://example.test/stream'),
        tag: const MediaItem(id: 'remote', title: 'Remote song'),
      ),
    );
    await handler.setSongs([
      MusicMetadata(songId: 'remote', serverId: 'server', remoteSongId: 'id'),
    ]);
    await handler.play();
    player.position = const Duration(seconds: 42);
    player.positions.add(player.position);
    await flushEvents();
    // ExoPlayer releases the failed stream before the Dart error arrives.
    player.position = Duration.zero;
    player.positions.add(Duration.zero);
    player.processingState = ProcessingState.idle;
    player.loadError = PlayerException(0, 'Source error', 0);
    player.errors.add(player.loadError!);
    await flushEvents();
    expect(handler.displayPosition, const Duration(seconds: 42));
    expect(
      handler.playbackState.value.processingState,
      AudioProcessingState.buffering,
    );
    await Future<void>.delayed(const Duration(milliseconds: 45));
    expect(handler.recovering, isTrue);
    player.loadError = null;
    await Future<void>.delayed(const Duration(milliseconds: 100));
    expect(handler.recovering, isFalse);
    expect(player.position, const Duration(seconds: 42));
    expect(player.playing, isTrue);
    expect(player.loadedIds, ['remote', 'remote']);
  });

  test('pause cancels retry and Play resumes from retained position', () async {
    await handler.dispose();
    handler = LibraryAudioHandler(
      player,
      retryDelay: const Duration(milliseconds: 30),
      resolveSource: (_) async => AudioSource.uri(
        Uri.parse('https://example.test/stream'),
        tag: const MediaItem(id: 'remote', title: 'Remote song'),
      ),
    );
    await handler.setSongs([
      MusicMetadata(songId: 'remote', serverId: 'server', remoteSongId: 'id'),
    ]);
    await handler.play();
    player.position = const Duration(seconds: 15);
    player.errors.add(PlayerException(0, 'Source error', 0));
    await flushEvents();
    await handler.pause();
    await Future<void>.delayed(const Duration(milliseconds: 70));
    expect(player.loadedIds, ['remote']);
    expect(player.playing, isFalse);
    await handler.play();
    expect(player.position, const Duration(seconds: 15));
    expect(player.playing, isTrue);
    player.errors.add(PlayerException(0, 'Response code: 503', 0));
    await flushEvents();
    await handler.reconcileSongs([]);
    await Future<void>.delayed(const Duration(milliseconds: 70));
    expect(player.loadedIds, ['remote', 'remote']);
    expect(player.playing, isFalse);
    expect(handler.recovering, isFalse);
  });

  test(
    'failed unresolved seek releases retry queue at requested position',
    () async {
      await handler.dispose();
      handler = LibraryAudioHandler(
        player,
        retryDelay: const Duration(milliseconds: 30),
        resolveSource: (_) async => AudioSource.uri(
          Uri.parse('https://example.test/stream'),
          tag: const MediaItem(id: 'remote', title: 'Remote song'),
        ),
      );
      await handler.setSongs([
        MusicMetadata(songId: 'remote', serverId: 'server', remoteSongId: 'id'),
      ]);
      await handler.play();
      player.position = const Duration(seconds: 80);
      final blocked = player.blockedSeek = Completer<void>();
      final seeking = handler.seek(const Duration(seconds: 20));
      await flushEvents();
      player.errors.add(PlayerException(0, 'Source error', 0));
      await seeking.timeout(const Duration(seconds: 1));
      expect(handler.displayPosition, const Duration(seconds: 20));
      await Future<void>.delayed(const Duration(milliseconds: 70));
      expect(player.playing, isTrue);
      expect(player.position, const Duration(seconds: 20));
      expect(handler.recovering, isFalse);
      // A late native error belongs to the abandoned seek and is consumed.
      blocked.completeError(StateError('old seek aborted'));
      await flushEvents();
      expect(handler.recovering, isFalse);
    },
  );

  test(
    'new seek and track controls bypass an unresolved native seek',
    () async {
      await handler.setSongs([song(0), song(1), song(2)]);
      await handler.play();
      final blocked = player.blockedSeek = Completer<void>();
      final first = handler.seek(const Duration(seconds: 50));
      await flushEvents();
      player.blockedSeek = null;
      await handler
          .seek(const Duration(seconds: 5))
          .timeout(const Duration(seconds: 1));
      await first;
      expect(player.position, const Duration(seconds: 5));
      player.blockedSeek = blocked;
      final second = handler.seek(const Duration(seconds: 60));
      await flushEvents();
      await handler.skipToNext().timeout(const Duration(seconds: 1));
      await second;
      expect(handler.currentIndex, 1);
      expect(player.playing, isTrue);
      await handler.skipToPrevious().timeout(const Duration(seconds: 1));
      expect(handler.currentIndex, 0);
      blocked.completeError(StateError('old seeks aborted'));
      await flushEvents();
    },
  );

  test('initial queue setup never waits for native pause', () async {
    player.rejectPause = true;
    await handler.setSongs([], preload: false);
    await handler.setSongs([song(0)], preload: false);
    expect(handler.currentIndex, 0);
    expect(player.loadedIds, isEmpty);
    player.rejectPause = false;
    await handler.play();
    expect(player.loadedIds, ['song-0']);
  });

  test('removing server tracks preserves current local playback', () async {
    final remote = MusicMetadata(
      songId: 'remote',
      serverId: 'server',
      remoteSongId: 'id',
      isOnDevice: false,
    );
    await handler.setSongs([song(0), remote, song(1)]);
    await handler.play();
    await player.seek(const Duration(seconds: 4));
    await handler.reconcileSongs([song(0), song(1)]);
    expect(player.playing, isTrue);
    expect(player.position, const Duration(seconds: 4));
    expect(handler.currentIndex, 0);
    expect(player.loadedIds, ['song-0']);
  });

  test('remote sources resolve lazily and removal stops playback', () async {
    await handler.dispose();
    var resolutions = 0;
    handler = LibraryAudioHandler(
      player,
      resolveSource: (song) async {
        resolutions++;
        return AudioSource.uri(
          Uri.parse('https://server.test/stream'),
          tag: MediaItem(id: song.identity, title: 'Remote'),
        );
      },
    );
    final remote = MusicMetadata(
      songId: 'remote',
      serverId: 'server',
      remoteSongId: 'id',
      isOnDevice: false,
    );
    await handler.setSongs([remote], preload: false);
    expect(resolutions, 0);
    await handler.play();
    expect(resolutions, 1);
    expect(player.playing, isTrue);
    await handler.reconcileSongs([]);
    expect(player.playing, isFalse);
    expect(player.sourceCount, 0);
    expect(handler.mediaItem.value, isNull);
  });

  test(
    'disable cancels an in-flight remote source before it can play',
    () async {
      await handler.dispose();
      final resolved = Completer<UriAudioSource>();
      handler = LibraryAudioHandler(
        player,
        resolveSource: (_) => resolved.future,
      );
      final remote = MusicMetadata(
        songId: 'remote',
        serverId: 'server',
        remoteSongId: 'id',
        isOnDevice: false,
      );
      await handler.setSongs([remote], preload: false);
      final playing = handler.play();
      await flushEvents();
      final removed = handler.reconcileSongs([]);
      resolved.complete(
        AudioSource.uri(
          Uri.parse('https://server.test/stream'),
          tag: const MediaItem(id: 'remote', title: 'Remote'),
        ),
      );
      await Future.wait([playing, removed]);
      expect(player.loadedIds, isEmpty);
      expect(player.playing, isFalse);
    },
  );

  test('service uses the bounded queue on the desktop test host too', () async {
    final container = ProviderContainer(
      overrides: [audioPlayerProvider.overrideWithValue(player)],
    );
    addTearDown(container.dispose);
    await container.read(audioPlayerServiceProvider.future);
    final service = container.read(audioPlayerServiceProvider.notifier);
    await service.setAudioSource(musicMetadataList: List.generate(50000, song));
    expect(container.read(audioPlayerServiceProvider).hasError, isFalse);
    await service.playSongAtIndex(49999);
    expect(player.sourceCount, 1);
    expect(player.loadedIds, ['song-0', 'song-49999']);
    expect(container.read(libraryAudioHandlerProvider).currentIndex, 49999);
  });

  test('50k library loads one source and exports no native queue', () async {
    await handler.setSongs(List.generate(50000, song), preload: false);
    expect(player.loadedIds, isEmpty);
    expect(handler.queue.value, isEmpty);
    await handler.select(49998);
    expect(player.sourceCount, 1);
    expect(handler.currentIndex, 49998);
    expect(handler.mediaItem.value!.extras!['songId'], 'song-49998');
    await handler.skipToNext();
    expect(handler.currentIndex, 49999);
    await handler.skipToPrevious();
    expect(handler.currentIndex, 49998);
    expect(player.loadedIds.length, 3);
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
