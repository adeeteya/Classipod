import 'dart:async';

import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/models/playback_shuffle_mode.dart';
import 'package:classipod/core/services/playback/library_audio_handler.dart';
import 'package:classipod/core/utils/library_filter.dart';
import 'package:classipod/features/now_playing/models/now_playing_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_ce/hive.dart';
import 'package:just_audio/just_audio.dart';

class PlaybackSession {
  final List<String> ids;
  final int index;
  final NowPlayingType type;
  final PlaybackShuffleMode shuffle;
  final LoopMode loop;
  final Duration position;

  const PlaybackSession({
    required this.ids,
    required this.index,
    required this.type,
    required this.shuffle,
    required this.loop,
    this.position = Duration.zero,
  });

  Map<String, dynamic> toMap() => {
    'version': 1,
    'ids': ids,
    'index': index,
    'type': type.name,
    'shuffle': shuffle.name,
    'loop': loop.name,
    'positionMs': position.inMilliseconds,
  };

  static PlaybackSession? decode(dynamic value) {
    try {
      if (value is! Map || value['version'] != 1) return null;
      final ids = (value['ids'] as List).cast<String>().toList();
      final index = value['index'] as int;
      if (ids.isEmpty || index < 0 || index >= ids.length) {
        return null;
      }
      final positionMs = value['positionMs'];
      return PlaybackSession(
        ids: ids,
        index: index,
        type: NowPlayingType.values.byName(value['type'] as String),
        shuffle: PlaybackShuffleMode.values.byName(value['shuffle'] as String),
        loop: LoopMode.values.byName(value['loop'] as String),
        position: positionMs is int && positionMs > 0
            ? Duration(milliseconds: positionMs)
            : Duration.zero,
      );
    } catch (_) {
      return null;
    }
  }

  ({List<MusicMetadata> songs, int index}) resolve(
    List<MusicMetadata> library,
  ) {
    final byId = {for (final song in library) song.identity: song};
    final retained = <MusicMetadata>[];
    var restoredIndex = -1;
    for (var i = 0; i < ids.length; i++) {
      final song = byId[ids[i]];
      if (song == null) continue;
      if (i == index) restoredIndex = retained.length;
      retained.add(song);
    }
    if (restoredIndex < 0) return (songs: library, index: 0);
    return (songs: retained, index: restoredIndex < 0 ? 0 : restoredIndex);
  }
}

class PlaybackSessionStore {
  final Box<dynamic> box;
  Future<void> _pending = Future.value();
  PlaybackSession? _last;

  PlaybackSessionStore(this.box) {
    if (box.get('checkpoint') != null) _last = read();
  }

  PlaybackSession? read() {
    final checkpoint = box.get('checkpoint');
    if (checkpoint == null) {
      return PlaybackSession.decode(box.get('session'));
    }
    if (checkpoint is! Map || checkpoint['version'] != 2) return null;
    final slot = checkpoint['slot'];
    if (slot != 0 && slot != 1) return null;
    final queue = box.get('queue-$slot');
    if (queue is! Map ||
        queue['version'] != 2 ||
        queue['revision'] != checkpoint['revision']) {
      return null;
    }
    final session = PlaybackSession.decode({
      ...checkpoint,
      'version': 1,
      'ids': queue['ids'],
    });
    if (session == null || session.ids[session.index] != checkpoint['songId']) {
      return null;
    }
    return session;
  }

  Future<void> clear() {
    _pending = _pending.then((_) async {
      try {
        await box.put('checkpoint', {'version': 2, 'cleared': true});
        await box.flush();
        _last = null;
      } catch (error) {
        debugPrint('Could not clear playback session: ${error.runtimeType}');
      }
    });
    return _pending;
  }

  Future<void> save(PlaybackSession session) {
    _pending = _pending.then((_) async {
      final last = _last;
      final sameQueue = last != null && listEquals(last.ids, session.ids);
      final sameItem =
          sameQueue &&
          last.index == session.index &&
          last.type == session.type &&
          last.shuffle == session.shuffle &&
          last.loop == session.loop;
      if (sameItem && last.position == session.position) return;
      try {
        final previous = box.get('checkpoint');
        final previousSlot = previous is Map ? previous['slot'] : null;
        final previousRevision = previous is Map ? previous['revision'] : null;
        final slot = sameQueue ? previousSlot : (previousSlot == 0 ? 1 : 0);
        final revision = sameQueue
            ? previousRevision
            : (previousRevision is int ? previousRevision + 1 : 1);
        if (!sameQueue) {
          await box.put('queue-$slot', {
            'version': 2,
            'revision': revision,
            'ids': session.ids,
          });
          await box.flush();
        }
        await box.put('checkpoint', {
          'version': 2,
          'slot': slot,
          'revision': revision,
          'songId': session.ids[session.index],
          'index': session.index,
          'type': session.type.name,
          'shuffle': session.shuffle.name,
          'loop': session.loop.name,
          'positionMs': session.position.inMilliseconds,
        });
        await box.flush();
        _last = session;
      } catch (error) {
        _last = null;
        debugPrint('Could not save playback session: ${error.runtimeType}');
      }
    });
    return _pending;
  }

  void attach(LibraryAudioHandler handler, NowPlayingType Function() type) {
    List<MusicMetadata>? previousSongs;
    List<String> ids = const [];
    void checkpoint() {
      final songs = handler.songs;
      if (songs.isEmpty) return;
      if (!identical(songs, previousSongs)) {
        ids = List.unmodifiable(songs.map((song) => song.identity));
        previousSongs = songs;
      }
      final index = handler.currentIndex!;
      final songId = ids[index];
      unawaited(
        save(
          PlaybackSession(
            ids: ids,
            index: index,
            type: type(),
            shuffle: handler.logicalQueue.shuffleMode,
            loop: handler.logicalQueue.loopMode,
            position: _positionFor(handler, songId),
          ),
        ),
      );
    }

    handler.onCheckpoint = checkpoint;
  }

  Duration _positionFor(LibraryAudioHandler handler, String songId) {
    final live = resumePositionOf(handler);
    if (live > Duration.zero) {
      handler.resumePositions[songId] = live;
      return live;
    }
    return handler.resumePositions[songId] ?? Duration.zero;
  }

  Future<void> dispose() async {
    await _pending;
  }

  void resetPosition() {
    _last = null;
  }
}

@visibleForTesting
Duration resumePositionOf(LibraryAudioHandler handler, [Duration? previous]) {
  if (handler.recovering || !handler.isSourceLoaded) {
    return handler.displayPosition;
  }
  final position = handler.player.position;
  if (previous != null && position < previous) return previous;
  return position;
}

bool resumesPlaybackPosition(MusicMetadata song) =>
    isPodcastPath(song.filePath) || isAudiobookPath(song.filePath);

bool shouldDeleteAfterPlaying({
  required MusicMetadata song,
  required bool enabled,
}) => enabled && isPodcastPath(song.filePath) && !song.isSubsonic;
