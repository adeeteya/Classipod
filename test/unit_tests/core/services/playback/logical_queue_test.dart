import 'dart:math';

import 'package:classipod/core/models/playback_shuffle_mode.dart';
import 'package:classipod/core/services/playback/logical_queue.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:just_audio/just_audio.dart';

List<int> remainingOrder(LogicalQueue queue) {
  final order = <int>[queue.index];
  while (queue.next() != null) {
    queue.index = queue.next()!;
    order.add(queue.index);
  }
  return order;
}

void main() {
  test('album shuffle visits every album intact in a randomized order', () {
    final observedOrders = <String>{};
    final albums = [
      [0, 4, 8],
      [1, 5, 9],
      [2, 6, 10],
      [3, 7, 11],
    ];
    for (var seed = 0; seed < 10; seed++) {
      final queue = LogicalQueue(random: Random(seed))
        ..reset(12, albums: albums)
        ..setShuffle(PlaybackShuffleMode.albums);
      final order = remainingOrder(queue);
      expect(order.take(3), albums.first);
      expect(order.toSet(), List.generate(12, (index) => index).toSet());
      for (final album in albums) {
        final start = order.indexOf(album.first);
        expect(order.sublist(start, start + album.length), album);
      }
      expect(queue.position, 11);
      observedOrders.add(order.join(','));
    }
    expect(observedOrders.length, greaterThan(1));
  });

  test('mode changes preserve the song and off restores original order', () {
    final queue = LogicalQueue(random: Random(42))
      ..reset(
        6,
        albums: [
          [0, 2, 4],
          [1, 3, 5],
        ],
      )
      ..index = 3;
    queue.setShuffle(PlaybackShuffleMode.albums);
    expect(queue.index, 3);
    expect(queue.position, 1);
    expect(queue.previous(), 1);
    expect(queue.next(), 5);
    queue.setShuffle(PlaybackShuffleMode.songs);
    expect(queue.index, 3);
    expect(queue.position, 0);
    queue.setShuffle(PlaybackShuffleMode.off);
    expect(queue.index, 3);
    expect(queue.position, 3);
    expect(queue.previous(), 2);
    expect(queue.next(), 4);
  });

  test('album boundaries support previous, repeat one, and repeat all', () {
    final queue = LogicalQueue(random: Random(42))
      ..reset(
        4,
        albums: [
          [0, 2],
          [1, 3],
        ],
      )
      ..setShuffle(PlaybackShuffleMode.albums);
    expect(queue.previous(), isNull);
    queue.index = 1;
    expect(queue.previous(), 2);
    queue.loopMode = LoopMode.one;
    expect(queue.next(automatic: true), 1);
    expect(queue.next(), 3);
    queue.index = 3;
    expect(queue.next(), isNull);
    queue.loopMode = LoopMode.all;
    expect(queue.next(), 0);
    queue.index = 0;
    expect(queue.previous(), 3);
  });

  test('album mode survives queue replacement and handles empty queues', () {
    final queue = LogicalQueue()..setShuffle(PlaybackShuffleMode.albums);
    expect(queue.position, 0);
    expect(queue.next(), isNull);
    expect(queue.previous(), isNull);
    queue.reset(
      3,
      albums: [
        [0, 2],
        [1],
      ],
      initialIndex: 2,
    );
    expect(queue.index, 2);
    expect(queue.previous(), 0);
    expect(queue.next(), 1);
    // Selecting the already active mode must not reshuffle the queue.
    queue.setShuffle(PlaybackShuffleMode.albums);
    expect(queue.next(), 1);
    queue.reset(0);
    expect(queue.position, 0);
    expect(queue.next(), isNull);
  });
}
