import 'dart:math';

import 'package:classipod/core/models/playback_shuffle_mode.dart';
import 'package:just_audio/just_audio.dart';

class LogicalQueue {
  final Random random;
  List<int> _order = [];
  List<int> _positions = [];
  int index = 0;
  PlaybackShuffleMode shuffleMode = PlaybackShuffleMode.off;
  List<List<int>> _albums = [];
  LoopMode loopMode = LoopMode.off;

  LogicalQueue({Random? random}) : random = random ?? Random();

  int get length => _order.length;

  int get position => _positions.isEmpty ? 0 : _positions[index];

  void reset(int length, {List<List<int>>? albums, int initialIndex = 0}) {
    index = initialIndex;
    _order = List.generate(length, (index) => index);
    _albums =
        albums ??
        [
          for (final index in _order) [index],
        ];
    _reorder();
  }

  void setShuffle(PlaybackShuffleMode mode) {
    if (shuffleMode == mode) return;
    shuffleMode = mode;
    _reorder();
  }

  void _reorder() {
    switch (shuffleMode) {
      case PlaybackShuffleMode.off:
        _order.sort();
      case PlaybackShuffleMode.songs:
        _order.shuffle(random);
        if (_order.isNotEmpty) {
          _order.remove(index);
          _order.insert(0, index);
        }
      case PlaybackShuffleMode.albums:
        final albums = _albums.toList()..shuffle(random);
        final current = albums.indexWhere((album) => album.contains(index));
        if (current >= 0) albums.insert(0, albums.removeAt(current));
        _order = albums.expand((album) => album).toList();
    }
    _indexPositions();
  }

  void _indexPositions() {
    _positions = List.filled(length, 0);
    for (var position = 0; position < length; position++) {
      _positions[_order[position]] = position;
    }
  }

  int? next({bool automatic = false}) {
    if (_order.isEmpty) return null;
    if (automatic && loopMode == LoopMode.one) return index;
    final position = _positions[index] + 1;
    if (position < length) return _order[position];
    return loopMode == LoopMode.all ? _order.first : null;
  }

  int? previous() {
    if (_order.isEmpty) return null;
    final position = _positions[index] - 1;
    if (position >= 0) return _order[position];
    return loopMode == LoopMode.all ? _order.last : null;
  }
}
