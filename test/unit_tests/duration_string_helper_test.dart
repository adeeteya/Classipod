import 'package:classipod/core/extensions/duration_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'Getting the correct minute and second string when duration is empty',
    () {
      const duration = Duration.zero;
      final durationString = duration.getMinuteAndSecondString;

      expect("0:00", durationString);
    },
  );
  test('Getting the correct minute and second string', () {
    const duration = Duration(minutes: 3, seconds: 50);
    final durationString = duration.getMinuteAndSecondString;

    expect("3:50", durationString);
  });
  test(
    'Getting the correct minute and second string when seconds is less than 10',
    () {
      const duration = Duration(minutes: 3, seconds: 5);
      final durationString = duration.getMinuteAndSecondString;

      expect("3:05", durationString);
    },
  );
  test('Getting the correct minute and second string when seconds is 0', () {
    const duration = Duration(minutes: 15);
    final durationString = duration.getMinuteAndSecondString;

    expect("15:00", durationString);
  });
  test('Getting the correct minute and second string for a large duration', () {
    const duration = Duration(hours: 2, minutes: 12, seconds: 30);
    final durationString = duration.getMinuteAndSecondString;

    expect("132:30", durationString);
  });
}
