import 'package:flutter/cupertino.dart';

extension DarkMode on BuildContext {
  bool get isDarkMode {
    return CupertinoTheme.of(this).brightness == Brightness.dark;
  }
}

extension DateTimeStringHelpers on DateTime {
  String get getTimeOfTheDayString {
    late final bool isPostMeridiem;
    late final String hour;
    late final String minute;
    if (this.hour >= 12 && this.hour <= 24) {
      hour = "${this.hour - 12}";
      isPostMeridiem = true;
    } else {
      hour = "${this.hour}";
      isPostMeridiem = false;
    }
    if (this.minute < 10) {
      minute = '0${this.minute}';
    } else {
      minute = '${this.minute}';
    }
    return "$hour:$minute ${(isPostMeridiem) ? 'PM' : 'AM'}";
  }
}

extension DurationStringHelpers on Duration {
  String get getMinuteAndSecondString {
    int seconds = inSeconds - (inMinutes * 60);
    return "$inMinutes:${seconds < 10 ? '0$seconds' : '$seconds'}";
  }
}
