import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final clockTextProvider = StreamProvider<String>((ref) {
  final localeName = Intl.getCurrentLocale();
  return clockTicks(DateTime.now)
      .map((time) => formatClockTime(time, localeName));
});

Stream<DateTime> clockTicks(
  DateTime Function() now, {
  Duration interval = const Duration(minutes: 1),
}) {
  late StreamController<DateTime> controller;
  Timer? timer;
  void schedule(Duration delay) {
    timer = Timer(delay, () {
      controller.add(now());
      schedule(interval);
    });
  }

  controller = StreamController<DateTime>(
    onListen: () {
      controller.add(now());
      final intoInterval = now().millisecond % interval.inMilliseconds;
      final untilBoundary = interval - Duration(milliseconds: intoInterval);
      schedule(untilBoundary <= Duration.zero ? interval : untilBoundary);
    },
    onPause: () {
      timer?.cancel();
      timer = null;
    },
    onResume: () {
      if (timer == null) schedule(interval);
    },
    onCancel: () {
      timer?.cancel();
      timer = null;
    },
  );
  return controller.stream;
}

@visibleForTesting
String formatClockTime(DateTime time, [String? localeName]) {
  final pattern = DateFormat.jm(localeName ?? Intl.defaultLocale);
  return pattern.format(time);
}
