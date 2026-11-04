extension DurationStringHelpers on Duration {
  String get getMinuteAndSecondString {
    final int seconds = inSeconds - (inMinutes * 60);
    return "$inMinutes:${seconds < 10 ? '0$seconds' : '$seconds'}";
  }

  String get getHourAndMinuteString {
    final int minutes = inMinutes.remainder(60);
    final minuteString = minutes < 10 ? '0$minutes' : '$minutes';
    return inHours == 0 ? '${minuteString}m' : '${inHours}h ${minuteString}m';
  }
}
