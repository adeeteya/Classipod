import 'dart:io';

import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/models/playback_shuffle_mode.dart';
import 'package:classipod/core/services/playback/playback_session.dart';
import 'package:classipod/features/now_playing/models/now_playing_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive.dart';
import 'package:just_audio/just_audio.dart';

PlaybackSession session({
  List<String> ids = const ['a', 'remote'],
  int index = 1,
}) => PlaybackSession(
  ids: ids,
  index: index,
  type: NowPlayingType.playlist,
  shuffle: PlaybackShuffleMode.albums,
  loop: LoopMode.all,
);

class RecordingBox extends Fake implements Box<dynamic> {
  final storedRecords = <dynamic, dynamic>{};
  final writes = <dynamic>[];
  bool failSelection = false;

  @override
  dynamic get(dynamic key, {dynamic defaultValue}) => storedRecords[key];

  @override
  Future<void> put(dynamic key, dynamic value) async {
    if (failSelection && key == 'checkpoint') throw StateError('disk failure');
    storedRecords[key] = value;
    writes.add(key);
  }

  @override
  Future<void> flush() async {}
}

void main() {
  test('large queues are written once, selections stay small', () async {
    final box = RecordingBox();
    final store = PlaybackSessionStore(box);
    final ids = List.generate(50000, (index) => 'song-$index');
    await store.save(session(ids: ids, index: 0));
    for (var index = 1; index < 10; index++) {
      await store.save(session(ids: ids, index: index));
    }
    expect(
      box.writes.where((key) => key.toString().startsWith('queue-')),
      hasLength(1),
    );
    expect(box.storedRecords['checkpoint'], isNot(contains('ids')));
    expect(box.storedRecords['checkpoint'], isNot(contains('position')));
    expect(store.read()!.index, 9);
    final writes = box.writes.length;
    await store.save(session(ids: ids, index: 9));
    expect(box.writes, hasLength(writes));
  });

  test(
    'interrupted queue change preserves previous committed selection',
    () async {
      final box = RecordingBox();
      final store = PlaybackSessionStore(box);
      await store.save(session());
      box.failSelection = true;
      await store.save(session(ids: ['new-a', 'new-b']));
      expect(PlaybackSessionStore(box).read()!.toMap(), session().toMap());
      box.failSelection = false;
      await store.save(session(ids: ['new-a', 'new-b']));
      expect(store.read()!.ids, ['new-a', 'new-b']);
    },
  );

  test(
    'legacy duration is ignored, clear cannot resurrect legacy selection',
    () async {
      final box = RecordingBox();
      box.storedRecords['session'] = {...session().toMap(), 'position': 42000};
      final store = PlaybackSessionStore(box);
      expect(store.read()!.toMap(), isNot(contains('position')));
      await store.save(session());
      expect(store.read()!.ids, session().ids);
      await store.clear();
      expect(PlaybackSessionStore(box).read(), isNull);
    },
  );

  test('mismatched queue revision or song identity is rejected', () async {
    final box = RecordingBox();
    final store = PlaybackSessionStore(box);
    await store.save(session());
    final checkpoint = Map<dynamic, dynamic>.from(box.storedRecords['checkpoint']);
    box.storedRecords['checkpoint'] = {...checkpoint, 'revision': 999};
    expect(store.read(), isNull);
    box.storedRecords['checkpoint'] = {...checkpoint, 'songId': 'wrong-song'};
    expect(store.read(), isNull);
  });

  test(
    'restores identity against reordered library and fresh remote metadata',
    () {
      final remote = MusicMetadata(
        songId: 'remote',
        serverId: 'server',
        remoteSongId: 'id',
        isOnDevice: false,
      );
      final resolved = session().resolve([remote, MusicMetadata(songId: 'a')]);
      expect(resolved.songs.map((song) => song.identity), ['a', 'remote']);
      expect(resolved.songs[resolved.index], same(remote));
    },
  );

  test('removed current track falls back to the complete fresh library', () {
    final resolved = session().resolve([
      MusicMetadata(songId: 'new'),
      MusicMetadata(songId: 'a'),
    ]);
    expect(resolved.index, 0);
    expect(resolved.songs.first.identity, 'new');
  });

  test('removed preceding track retains current identity', () {
    final resolved = session().resolve([MusicMetadata(songId: 'remote')]);
    expect(resolved.index, 0);
  });

  test('duplicate playlist entries restore the selected occurrence', () {
    final resolved = session(ids: ['a', 'a'])
        .resolve([MusicMetadata(songId: 'a')]);
    expect(resolved.songs, hasLength(2));
    expect(resolved.index, 1);
  });

  test('tolerates an empty library', () {
    final empty = session().resolve([]);
    expect(empty.songs, isEmpty);
  });

  test('invalid and future snapshots are ignored', () {
    for (final value in [
      null,
      'broken',
      {},
      {...session().toMap(), 'version': 99},
      {...session().toMap(), 'index': -1},
      {...session().toMap(), 'index': 10},
      {
        ...session().toMap(),
        'ids': [123],
      },
      {...session().toMap(), 'type': 'unknown'},
    ]) {
      expect(PlaybackSession.decode(value), isNull);
    }
  });

  test('checkpoint survives box close/reopen and ordered writes', () async {
    final directory = await Directory.systemTemp.createTemp('playback-test');
    Hive.init(directory.path);
    final box = await Hive.openBox<dynamic>('playback');
    final store = PlaybackSessionStore(box);
    await Future.wait([store.save(session(index: 0)), store.save(session())]);
    await store.dispose();
    await box.close();
    final reopened = await Hive.openBox<dynamic>('playback');
    final restored = PlaybackSessionStore(reopened).read()!;
    expect(restored.toMap(), session().toMap());
    expect(reopened.get('checkpoint').keys, isNot(contains('url')));
    await reopened.close();
    await directory.delete(recursive: true);
  });
}
