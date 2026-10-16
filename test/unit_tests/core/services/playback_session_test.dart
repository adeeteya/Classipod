import 'package:classipod/core/models/playback_shuffle_mode.dart';
import 'package:classipod/core/services/playback/playback_session.dart';
import 'package:classipod/features/now_playing/models/now_playing_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive.dart';
import 'package:just_audio/just_audio.dart';

class _MemoryBox extends Fake implements Box<dynamic> {
  final records = <dynamic, dynamic>{};

  @override
  dynamic get(dynamic key, {dynamic defaultValue}) => records[key];

  @override
  Future<void> put(dynamic key, dynamic value) async {
    records[key] = value;
  }

  @override
  Future<void> flush() async {}
}

void main() {
  test('session round trips its position', () {
    const session = PlaybackSession(
      ids: ['a', 'b'],
      index: 1,
      type: NowPlayingType.songs,
      shuffle: PlaybackShuffleMode.off,
      loop: LoopMode.off,
      position: Duration(minutes: 12, seconds: 30),
    );

    final decoded = PlaybackSession.decode(session.toMap());

    expect(decoded, isNotNull);
    expect(decoded!.position, const Duration(minutes: 12, seconds: 30));
    expect(decoded.index, 1);
    expect(decoded.ids, ['a', 'b']);
  });

  test('a checkpoint without a position decodes as zero', () {
    final decoded = PlaybackSession.decode({
      'version': 1,
      'ids': ['a'],
      'index': 0,
      'type': 'songs',
      'shuffle': 'off',
      'loop': 'off',
    });

    expect(decoded, isNotNull);
    expect(decoded!.position, Duration.zero);
  });

  test('a stored position lowers when the queue moves backwards', () async {
    final store = PlaybackSessionStore(_MemoryBox());
    const queue = ['a', 'b'];

    await store.save(
      const PlaybackSession(
        ids: queue,
        index: 0,
        type: NowPlayingType.songs,
        shuffle: PlaybackShuffleMode.off,
        loop: LoopMode.off,
        position: Duration(minutes: 20),
      ),
    );
    await store.save(
      const PlaybackSession(
        ids: queue,
        index: 1,
        type: NowPlayingType.songs,
        shuffle: PlaybackShuffleMode.off,
        loop: LoopMode.off,
        position: Duration(minutes: 5),
      ),
    );
    await store.save(
      const PlaybackSession(
        ids: queue,
        index: 0,
        type: NowPlayingType.songs,
        shuffle: PlaybackShuffleMode.off,
        loop: LoopMode.off,
        position: Duration(minutes: 30),
      ),
    );

    final stored = store.read();

    expect(stored, isNotNull);
    expect(stored!.index, 0);
    expect(stored.position, const Duration(minutes: 30));
  });

  test('a position below the stored one for the same item still wins', () {
    final store = PlaybackSessionStore(_MemoryBox());

    return store
        .save(
          const PlaybackSession(
            ids: ['a'],
            index: 0,
            type: NowPlayingType.songs,
            shuffle: PlaybackShuffleMode.off,
            loop: LoopMode.off,
            position: Duration(minutes: 20),
          ),
        )
        .then((_) async {
          await store.save(
            const PlaybackSession(
              ids: ['a'],
              index: 0,
              type: NowPlayingType.songs,
              shuffle: PlaybackShuffleMode.off,
              loop: LoopMode.off,
              position: Duration(minutes: 3),
            ),
          );
          expect(store.read()!.position, const Duration(minutes: 3));
        });
  });
}
