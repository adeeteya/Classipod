import 'package:classipod/features/status_bar/controller/clock_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  setUpAll(initializeDateFormatting);

  group('clock text', () {
    test('formats for the requested locale, 12h or 24h', () {
      final time = DateTime(2026, 10, 14, 15, 6);

      expect(formatClockTime(time, 'pt_BR'), '15:06');
      expect(formatClockTime(time, 'en_US'), '3:06\u202fPM');
    });

    test('emits immediately then once per interval', () async {
      var tick = 0;
      final start = DateTime(2026, 10, 14, 15, 6);
      final emitted = <DateTime>[];
      final subscription = clockTicks(
        () => start.add(Duration(seconds: tick++)),
        interval: const Duration(seconds: 1),
      ).listen(emitted.add);

      await Future<void>.delayed(Duration.zero);
      expect(emitted, [start]);

      await Future<void>.delayed(const Duration(milliseconds: 1250));
      expect(emitted.length, greaterThanOrEqualTo(2));
      await subscription.cancel();
    });

    test('the first tick is aligned to the interval boundary', () async {
      final start = DateTime(2026, 10, 14, 15, 6, 59, 900);
      final emitted = <DateTime>[];
      final subscription = clockTicks(
        () => start,
        interval: const Duration(seconds: 1),
      ).listen(emitted.add);

      await Future<void>.delayed(Duration.zero);
      expect(emitted, [start]);
      expect(start.millisecond, 900);

      await Future<void>.delayed(const Duration(milliseconds: 250));
      expect(emitted.length, 2);
      await subscription.cancel();
    });

    test('cancelling stops the pending timer', () async {
      final emitted = <DateTime>[];
      final subscription = clockTicks(DateTime.now).listen(emitted.add);
      await Future<void>.delayed(Duration.zero);
      await subscription.cancel();
      await Future<void>.delayed(const Duration(milliseconds: 20));
      expect(emitted.length, 1);
    });
  });
}
