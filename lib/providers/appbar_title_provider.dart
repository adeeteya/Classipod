import 'dart:async';
import 'package:classipod/providers/display_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppBarTitleNotifier extends Notifier<String> {
  AppBarTitleNotifier() : super();
  Timer _threeSecondTimer = Timer(Duration.zero, () {});

  @override
  String build() {
    watchScreenChanges();
    executeEveryMinute();
    return ref.read(displayProvider).displayScreenType.toString();
  }

  void executeEveryMinute() {
    var now = DateTime.now();
    var nextMinute =
        DateTime(now.year, now.month, now.day, now.hour, now.minute + 1);
    Timer(nextMinute.difference(now), () {
      Timer.periodic(const Duration(minutes: 1), (timer) {
        if (!_threeSecondTimer.isActive) {
          state = getTimeString();
        }
      });
    });
  }

  String getTimeString() {
    final DateTime now = DateTime.now();
    final bool isPostMeridiem = now.hour >= 12;
    return "${now.hour}:${(now.minute) < 0 ? '0${now.minute}' : '${now.minute}'} ${(isPostMeridiem) ? 'PM' : 'AM'}";
  }

  void watchScreenChanges() {
    final displayDetails = ref.watch(displayProvider);
    state = displayDetails.displayScreenType.toString();
    if (_threeSecondTimer.isActive) {
      _threeSecondTimer.cancel();
    }
    _threeSecondTimer = Timer(const Duration(seconds: 3), () {
      state = getTimeString();
      _threeSecondTimer.cancel();
    });
  }
}

final appBarTitleProvider =
    NotifierProvider<AppBarTitleNotifier, String>(() => AppBarTitleNotifier());
