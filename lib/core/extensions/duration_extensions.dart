extension DurationStringHelpers on Duration {
  String get getMinuteAndSecondString {
    final int seconds = inSeconds - (inMinutes * 60);
    return "$inMinutes:${seconds < 10 ? '0$seconds' : '$seconds'}";
  }
}
