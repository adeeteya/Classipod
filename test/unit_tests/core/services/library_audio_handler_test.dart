import 'dart:async';
import 'dart:collection';
import 'dart:io';
import 'dart:math';

import 'package:audio_service/audio_service.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/models/playback_shuffle_mode.dart';
import 'package:classipod/core/providers/filtered_audio_files_provider.dart';
import 'package:classipod/core/services/audio_files_service.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/core/services/playback/library_audio_handler.dart';
import 'package:classipod/core/services/playback/logical_queue.dart';
import 'package:classipod/core/services/playback/playback_session.dart';
import 'package:classipod/features/now_playing/models/now_playing_model.dart';
import 'package:classipod/features/now_playing/provider/now_playing_details_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive.dart';
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

class MemoryPlaybackBox extends Fake implements Box<dynamic> {
  final storedRecords = <dynamic, dynamic>{};
  int writes = 0;

  @override
  dynamic get(dynamic key, {dynamic defaultValue}) => storedRecords[key];

  @override
  Future<void> put(dynamic key, dynamic value) async {
    storedRecords[key] = value;
    writes++;
  }

  @override
  Future<void> flush() async {}
}

MusicMetadata song(int index) => MusicMetadata(
  originalSongIndex: index,
  songId: 'song-$index',
  contentUri: 'content://media/external/audio/media/$index',
  trackName: 'Song $index',
);

Future<void> flushEvents() => Future.delayed(const Duration(milliseconds: 10));

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
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
    'startup restores Now Playing and persists subsequent controls',
    () async {
      final directory = await Directory.systemTemp.createTemp(
        'session-startup',
      );
      Hive.init(directory.path);
      final box = await Hive.openBox<dynamic>('playback-session-v1');
      await box.put('session', {
        ...const PlaybackSession(
          ids: ['song-0', 'song-1'],
          index: 1,
          type: NowPlayingType.playlist,
          shuffle: PlaybackShuffleMode.albums,
          loop: LoopMode.all,
        ).toMap(),
        'position': 42000,
      });
      final container = ProviderContainer(
        overrides: [
          audioPlayerProvider.overrideWithValue(player),
          libraryAudioHandlerProvider.overrideWithValue(handler),
          filteredAudioFilesProvider.overrideWith(
            (_) async => UnmodifiableListView([song(0), song(1)]),
          ),
        ],
      );
      await container.read(audioPlayerServiceProvider.future);
      await container.read(audioPlayerServiceProvider.notifier).restoreSession([
        song(0),
        song(1),
      ]);
      await flushEvents();
      final now = container.read(nowPlayingDetailsProvider);
      expect(now.currentMetadata?.identity, 'song-1');
      expect(now.nowPlayingType, NowPlayingType.playlist);
      expect(now.shuffleMode, PlaybackShuffleMode.albums);
      expect(now.loopMode, LoopMode.all);
      expect(now.isPlaying, isFalse);
      expect(handler.displayPosition, Duration.zero);
      expect(player.loadedIds, isEmpty);
      await handler.seek(const Duration(seconds: 3));
      await flushEvents();
      expect(PlaybackSessionStore(box).read()!.index, 1);
      await handler.select(0);
      await flushEvents();
      expect(PlaybackSessionStore(box).read()!.index, 0);
      await container.read(audioPlayerServiceProvider.notifier).restoreSession([
        song(0),
        song(1),
      ]);
      expect(handler.displayPosition, Duration.zero);
      container.dispose();
      await flushEvents();
      await box.close();
      await directory.delete(recursive: true);
    },
  );

  for (final remote in [false, true]) {
    test(
      'failed restored ${remote ? 'remote' : 'local'} song starts fresh',
      () async {
        final directory = await Directory.systemTemp.createTemp(
          'restore-error',
        );
        Hive.init(directory.path);
        final box = await Hive.openBox<dynamic>('playback-session-v1');
        final failedSong = remote
            ? MusicMetadata(
                songId: 'remote',
                serverId: 'server',
                remoteSongId: 'id',
                isOnDevice: false,
              )
            : song(1);
        final library = [song(0), failedSong];
        await box.put(
          'session',
          PlaybackSession(
            ids: [failedSong.identity],
            index: 0,
            type: NowPlayingType.playlist,
            shuffle: PlaybackShuffleMode.off,
            loop: LoopMode.off,
          ).toMap(),
        );
        await handler.dispose();
        handler = LibraryAudioHandler(
          player,
          retryDelay: const Duration(milliseconds: 10),
          resolveSource: (song) async => AudioSource.uri(
            Uri.parse('https://example.test/stream'),
            tag: MediaItem(id: song.identity, title: 'Song'),
          ),
        );
        final container = ProviderContainer(
          overrides: [
            audioPlayerProvider.overrideWithValue(player),
            libraryAudioHandlerProvider.overrideWithValue(handler),
            filteredAudioFilesProvider.overrideWith(
              (_) async => UnmodifiableListView(library),
            ),
          ],
        );
        await container.read(audioPlayerServiceProvider.future);
        await container
            .read(audioPlayerServiceProvider.notifier)
            .restoreSession(library);
        player.loadError = PlayerException(
          0,
          remote ? 'Source error: failed host lookup' : 'File not found',
          null,
        );
        await expectLater(handler.play(), throwsStateError);
        await Future<void>.delayed(const Duration(milliseconds: 50));
        expect(handler.recovering, isFalse);
        expect(handler.wantsPlayback, isFalse);
        expect(player.playing, isFalse);
        expect(handler.currentIndex, 0);
        expect(
          handler.songs.map((song) => song.identity),
          library.map((song) => song.identity),
        );
        expect(
          container.read(nowPlayingDetailsProvider).nowPlayingType,
          NowPlayingType.songs,
        );
        expect(PlaybackSessionStore(box).read(), isNull);
        player.loadError = null;
        await handler.select(0);
        await flushEvents();
        expect(player.playing, isTrue);
        expect(PlaybackSessionStore(box).read()!.ids.first, 'song-0');
        container.dispose();
        await flushEvents();
        await box.close();
        await directory.delete(recursive: true);
      },
    );
  }

  test('position and unchanged controls do not write song selection', () async {
    final box = MemoryPlaybackBox();
    final store = PlaybackSessionStore(box);
    await handler.setSongs([song(0), song(1)]);
    store.attach(handler, () => NowPlayingType.songs);
    await handler.select(1);
    await store.dispose();
    final writes = box.writes;
    player.position = const Duration(seconds: 8);
    player.positions.add(player.position);
    await flushEvents();
    await handler.seek(const Duration(seconds: 9));
    await handler.pause();
    await store.dispose();
    expect(box.writes, writes);
    expect(store.read()!.index, 1);
    expect(box.storedRecords['checkpoint'], isNot(contains('position')));
    handler.onCheckpoint = null;
  });

  test(
    'restores paused without resolving until play, including seek',
    () async {
      await handler.restoreSongs(
        [song(0), song(1)],
        index: 1,
        position: const Duration(seconds: 7),
      );
      expect(handler.currentIndex, 1);
      expect(handler.displayPosition, const Duration(seconds: 7));
      expect(player.loadedIds, isEmpty);
      expect(player.playing, isFalse);
      await handler.seek(const Duration(seconds: 5));
      await handler.play();
      expect(player.loadedIds, ['song-1']);
      expect(player.position, const Duration(seconds: 5));
      expect(player.playing, isTrue);
    },
  );

  test('failed restore load retains position for retry', () async {
    await handler.restoreSongs(
      [song(0)],
      index: 0,
      position: const Duration(seconds: 7),
    );
    player.failLoad = true;
    await expectLater(handler.play(), throwsStateError);
    expect(handler.displayPosition, const Duration(seconds: 7));
    player.failLoad = false;
    await handler.play();
    expect(player.position, const Duration(seconds: 7));
  });

  test('selecting another track discards restored seek', () async {
    await handler.restoreSongs(
      [song(0), song(1)],
      index: 1,
      position: const Duration(seconds: 7),
    );
    await handler.select(0);
    expect(player.position, Duration.zero);
    expect(handler.displayPosition, Duration.zero);
  });

  test(
    'remote restore stays at saved position through connection failure',
    () async {
      final remote = MusicMetadata(
        songId: 'remote',
        serverId: 'server',
        remoteSongId: 'id',
        isOnDevice: false,
      );
      await handler.dispose();
      var offline = true;
      handler = LibraryAudioHandler(
        player,
        resolveSource: (_) async {
          if (offline) throw StateError('Failed host lookup');
          return AudioSource.uri(
            Uri.parse('https://example.test/fresh'),
            tag: const MediaItem(id: 'remote', title: 'Remote'),
          );
        },
      );
      await handler.restoreSongs(
        [remote],
        index: 0,
        position: const Duration(seconds: 7),
      );
      await expectLater(handler.play(), throwsStateError);
      await handler.pause();
      expect(handler.displayPosition, const Duration(seconds: 7));
      offline = false;
      await handler.play();
      expect(player.position, const Duration(seconds: 7));
    },
  );

  test('checkpoints seek, pause, stop and track changes', () async {
    final checkpoints = <(int?, Duration)>[];
    handler.onCheckpoint = () =>
        checkpoints.add((handler.currentIndex, handler.displayPosition));
    await handler.setSongs([song(0), song(1)]);
    await handler.seek(const Duration(seconds: 4));
    expect(checkpoints.last, (0, const Duration(seconds: 4)));
    await handler.pause();
    expect(checkpoints.last, (0, const Duration(seconds: 4)));
    await handler.stop();
    expect(checkpoints.last, (0, const Duration(seconds: 4)));
    await handler.select(1);
    expect(checkpoints.last, (1, Duration.zero));
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
    'Now Playing follows shuffle order and restores the original index',
    () async {
      final container = ProviderContainer(
        overrides: [
          audioPlayerProvider.overrideWithValue(player),
          libraryAudioHandlerProvider.overrideWithValue(handler),
        ],
      );
      addTearDown(container.dispose);
      final songs = List.generate(309, song);
      container
          .read(nowPlayingDetailsProvider.notifier)
          .setNewMetadataList(newMetadataList: songs);
      await handler.setSongs(songs);
      await handler.select(70);
      await flushEvents();
      expect(container.read(nowPlayingDetailsProvider).queuePosition, 70);

      await handler.setShuffleMode(AudioServiceShuffleMode.all);
      await flushEvents();
      var details = container.read(nowPlayingDetailsProvider);
      expect(details.queuePosition, 0);
      expect(details.currentIndex, 70);
      expect(details.currentMetadata, songs[70]);
      expect(details.metadataList.length, 309);

      await handler.skipToNext();
      await flushEvents();
      details = container.read(nowPlayingDetailsProvider);
      expect(details.queuePosition, 1);
      expect(details.currentMetadata, songs[handler.currentIndex!]);

      await handler.skipToPrevious();
      await flushEvents();
      expect(container.read(nowPlayingDetailsProvider).queuePosition, 0);
      expect(handler.currentIndex, 70);

      await handler.setShuffleMode(AudioServiceShuffleMode.none);
      await flushEvents();
      details = container.read(nowPlayingDetailsProvider);
      expect(details.queuePosition, 70);
      expect(details.currentIndex, 70);
      expect(details.currentMetadata, songs[70]);

      await handler.skipToNext();
      await flushEvents();
      expect(container.read(nowPlayingDetailsProvider).queuePosition, 71);
    },
  );

  test('album shuffle orders playlist tracks by disc and track', () async {
    final songs = [
      song(0).copyWith(albumName: 'A', discNumber: 1, trackNumber: 1),
      song(1).copyWith(albumName: 'B', discNumber: 1, trackNumber: 2),
      song(2).copyWith(albumName: 'A', discNumber: 2, trackNumber: 1),
      song(3).copyWith(albumName: 'B', discNumber: 1, trackNumber: 1),
      song(4).copyWith(albumName: 'A', discNumber: 1, trackNumber: 2),
    ];
    await handler.setSongs(songs);
    await handler.setShuffleMode(AudioServiceShuffleMode.group);
    expect(
      handler.playbackState.value.shuffleMode,
      AudioServiceShuffleMode.group,
    );
    final order = <int>[handler.currentIndex!];
    while (handler.logicalQueue.next() != null) {
      await handler.skipToNext();
      order.add(handler.currentIndex!);
    }
    expect(order, [0, 4, 2, 3, 1]);
    await handler.skipToPrevious();
    expect(handler.currentIndex, 3);
    await handler.skipToPrevious();
    expect(handler.currentIndex, 2);
    await handler.setShuffleMode(AudioServiceShuffleMode.none);
    expect(handler.currentIndex, 2);
    expect(handler.logicalQueue.position, 2);
    await handler.skipToNext();
    expect(handler.currentIndex, 3);
  });

  test(
    'album shuffle distinguishes artists and remote album identities',
    () async {
      final songs = [
        song(0).copyWith(
          albumName: 'Hits',
          albumArtistNames: ['Artist A'],
          trackNumber: 1,
        ),
        song(1).copyWith(
          albumName: 'Hits',
          albumArtistNames: ['Artist B'],
          trackNumber: 1,
        ),
        song(2).copyWith(
          albumName: 'Hits',
          albumArtistNames: ['Artist A'],
          trackNumber: 2,
        ),
        song(3).copyWith(
          albumName: 'Hits',
          albumArtistNames: ['Artist B'],
          trackNumber: 2,
        ),
        song(4).copyWith(
          serverId: 'one',
          remoteSongId: '4',
          remoteAlbumId: 'album',
          trackNumber: 1,
        ),
        song(5).copyWith(
          serverId: 'two',
          remoteSongId: '5',
          remoteAlbumId: 'album',
          trackNumber: 1,
        ),
        song(6).copyWith(
          serverId: 'one',
          remoteSongId: '6',
          remoteAlbumId: 'album',
          trackNumber: 2,
        ),
      ];
      // Preloading is unnecessary for testing grouping of remote metadata.
      await handler.setSongs(songs, preload: false);
      await handler.setShuffleMode(AudioServiceShuffleMode.group);
      final order = <int>[handler.logicalQueue.index];
      while (handler.logicalQueue.next() != null) {
        handler.logicalQueue.index = handler.logicalQueue.next()!;
        order.add(handler.logicalQueue.index);
      }
      expect(order.toSet().length, songs.length);
      for (final album in [
        [0, 2],
        [1, 3],
        [4, 6],
      ]) {
        final start = order.indexOf(album.first);
        expect(order.sublist(start, start + album.length), album);
      }
    },
  );

  test('settings cycle all modes within the current playlist', () async {
    final library = List.generate(5, song);
    final container = ProviderContainer(
      overrides: [
        audioPlayerProvider.overrideWithValue(player),
        libraryAudioHandlerProvider.overrideWithValue(handler),
        filteredAudioFilesProvider.overrideWith(
          (_) async => UnmodifiableListView(library),
        ),
      ],
    );
    addTearDown(container.dispose);
    await container.read(filteredAudioFilesProvider.future);
    await container.read(audioPlayerServiceProvider.future);
    final service = container.read(audioPlayerServiceProvider.notifier);
    await service.setAudioSource(
      nowPlayingType: NowPlayingType.playlist,
      musicMetadataList: [library[3], library[1]],
    );
    await handler.select(0);
    await handler.seek(const Duration(seconds: 4));
    await flushEvents();
    await service.toggleShuffleMode();
    await flushEvents();
    var details = container.read(nowPlayingDetailsProvider);
    expect(details.shuffleMode, PlaybackShuffleMode.songs);
    expect(details.metadataList, [library[3], library[1]]);
    expect(details.currentMetadata, library[3]);
    expect(details.queuePosition, 0);
    expect(player.position, const Duration(seconds: 4));
    expect(player.playing, isTrue);
    await service.toggleShuffleMode();
    await flushEvents();
    details = container.read(nowPlayingDetailsProvider);
    expect(details.shuffleMode, PlaybackShuffleMode.albums);
    expect(details.isShuffleEnabled, isTrue);
    await service.toggleShuffleMode();
    await flushEvents();
    details = container.read(nowPlayingDetailsProvider);
    expect(details.shuffleMode, PlaybackShuffleMode.off);
    expect(details.queuePosition, 0);
    expect(details.isShuffleEnabled, isFalse);
  });

  test(
    'shuffle visits all 50k positions once and restores sequential order',
    () {
      final queue = LogicalQueue(random: Random(42));
      queue.reset(50000);
      queue.index = 123;
      queue.setShuffle(PlaybackShuffleMode.songs);
      expect(queue.position, 0);
      final visited = <int>{queue.index};
      while (queue.next() != null) {
        final next = queue.next()!;
        queue.index = next;
        expect(visited.add(next), isTrue);
        expect(queue.position, visited.length - 1);
      }
      expect(visited.length, 50000);
      queue.setShuffle(PlaybackShuffleMode.off);
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
