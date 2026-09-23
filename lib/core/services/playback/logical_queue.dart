import 'dart:math';

import 'package:just_audio/just_audio.dart';

class LogicalQueue {
  final Random random;
  List<int> _order = [];
  List<int> _positions = [];
  int index = 0;
  bool shuffled = false;
  LoopMode loopMode = LoopMode.off;

  LogicalQueue({Random? random}) : random = random ?? Random();

  int get length => _order.length;

  void reset(int length) {
    index = 0;
    _order = List.generate(length, (index) => index);
    if (shuffled) reshuffle();
    _indexPositions();
  }

  void setShuffle(bool enabled) {
    shuffled = enabled;
    if (enabled) {
      reshuffle();
    } else {
      _order.sort();
      _indexPositions();
    }
  }

  void reshuffle() {
    _order.shuffle(random);
    if (_order.isEmpty) return;
    _order.remove(index);
    _order.insert(0, index);
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
