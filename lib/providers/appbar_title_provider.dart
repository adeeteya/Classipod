import 'dart:async';

import 'package:classipod/core/extensions.dart';
import 'package:classipod/core/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppBarTitleNotifier extends Notifier<String> {
  AppBarTitleNotifier() : super();
  // Timer _threeSecondTimer = Timer(Duration.zero, () {});

  @override
  String build() {
    // executeEveryMinute();
    return Routes.menu.title;
  }

  void changeTitle(String title) {
    state = Routes.values.byName(title).title;
  }

  void executeEveryMinute() {
    final now = DateTime.now();
    final nextMinute =
        DateTime(now.year, now.month, now.day, now.hour, now.minute + 1);
    Timer(nextMinute.difference(now), () {
      Timer.periodic(const Duration(minutes: 1), (timer) {
        // if (!_threeSecondTimer.isActive) {
        //   state = DateTime.now().getTimeOfTheDayString;
        // }
      });
    });
  }
}

final appBarTitleProvider =
    NotifierProvider<AppBarTitleNotifier, String>(() => AppBarTitleNotifier());
