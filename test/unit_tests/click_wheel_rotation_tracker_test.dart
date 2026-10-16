import 'dart:math' as math;

import 'package:classipod/features/device/models/click_wheel_rotation_tracker.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const Offset wheelCenter = Offset(100, 100);
  const double innerDeadzoneRadius = 30;

  // Returns a point on the wheel at [degrees] using the screen coordinate
  // system (the y axis points downwards) so increasing degrees rotate the
  // point clockwise.
  Offset pointAtDegrees(double degrees, {double radius = 100}) {
    final double radians = degrees * math.pi / 180;
    return Offset(
      wheelCenter.dx + radius * math.cos(radians),
      wheelCenter.dy + radius * math.sin(radians),
    );
  }

  ClickWheelRotationTracker createTracker({
    double thresholdDegrees = 45,
    double minVelocityDegreesPerSecond = 90,
    double maxVelocityDegreesPerSecond = 1080,
    double accelerationFactor = 4,
    int maxStepsPerEvent = 3,
  }) {
    return ClickWheelRotationTracker(
      thresholdDegrees: thresholdDegrees,
      minVelocityDegreesPerSecond: minVelocityDegreesPerSecond,
      maxVelocityDegreesPerSecond: maxVelocityDegreesPerSecond,
      accelerationFactor: accelerationFactor,
      maxStepsPerEvent: maxStepsPerEvent,
    )..begin(
      pointerId: 1,
      wheelCenter: wheelCenter,
      innerDeadzoneRadius: innerDeadzoneRadius,
    );
  }

  // Sweeps the pointer clockwise along the wheel in [eventCount] moves of
  // [degreesPerEvent] degrees spaced [stepMillis] milliseconds apart and
  // returns the total number of emitted steps. The first move only anchors
  // the angle so the total rotation is (eventCount - 1) * degreesPerEvent.
  int sweep(
    ClickWheelRotationTracker tracker, {
    required int eventCount,
    required double degreesPerEvent,
    required int stepMillis,
  }) {
    int steps = 0;
    for (int i = 1; i <= eventCount; i++) {
      steps += tracker.update(
        pointerId: 1,
        localPosition: pointAtDegrees(i * degreesPerEvent),
        timeStamp: Duration(milliseconds: i * stepMillis),
      );
    }
    return steps;
  }

  group('click_wheel_rotation_tracker', () {
    test('begin returns false when a pointer is already being tracked', () {
      final ClickWheelRotationTracker tracker = createTracker();
      final bool result = tracker.begin(
        pointerId: 2,
        wheelCenter: wheelCenter,
        innerDeadzoneRadius: innerDeadzoneRadius,
      );

      expect(result, isFalse);
      expect(tracker.activePointerId, 1);
    });

    test('no steps are emitted before the threshold is crossed', () {
      final ClickWheelRotationTracker tracker = createTracker();

      expect(
        tracker.update(
          pointerId: 1,
          localPosition: pointAtDegrees(0),
          timeStamp: Duration.zero,
        ),
        0,
      );
      expect(
        tracker.update(
          pointerId: 1,
          localPosition: pointAtDegrees(30),
          timeStamp: const Duration(milliseconds: 1000),
        ),
        0,
      );
    });

    test('a forward step is emitted after a clockwise rotation', () {
      final ClickWheelRotationTracker tracker = createTracker();
      expect(
        tracker.update(
          pointerId: 1,
          localPosition: pointAtDegrees(0),
          timeStamp: Duration.zero,
        ),
        0,
      );

      expect(
        tracker.update(
          pointerId: 1,
          localPosition: pointAtDegrees(50),
          timeStamp: const Duration(milliseconds: 1000),
        ),
        1,
      );
    });

    test('a backward step is emitted after a counter clockwise rotation', () {
      final ClickWheelRotationTracker tracker = createTracker();
      expect(
        tracker.update(
          pointerId: 1,
          localPosition: pointAtDegrees(0),
          timeStamp: Duration.zero,
        ),
        0,
      );

      expect(
        tracker.update(
          pointerId: 1,
          localPosition: pointAtDegrees(-50),
          timeStamp: const Duration(milliseconds: 1000),
        ),
        -1,
      );
    });

    test('rotations emit multiple steps and carry the remainder', () {
      final ClickWheelRotationTracker tracker = createTracker();
      expect(
        tracker.update(
          pointerId: 1,
          localPosition: pointAtDegrees(0),
          timeStamp: Duration.zero,
        ),
        0,
      );

      expect(
        tracker.update(
          pointerId: 1,
          localPosition: pointAtDegrees(130),
          timeStamp: const Duration(milliseconds: 2000),
        ),
        2,
      );
      expect(
        tracker.update(
          pointerId: 1,
          localPosition: pointAtDegrees(140),
          timeStamp: const Duration(milliseconds: 4000),
        ),
        1,
      );
    });

    test('rotation across the 180 degrees boundary is handled', () {
      final ClickWheelRotationTracker tracker = createTracker();
      expect(
        tracker.update(
          pointerId: 1,
          localPosition: pointAtDegrees(170),
          timeStamp: Duration.zero,
        ),
        0,
      );

      // 170 degrees -> 190 degrees (-170) is only a 20 degree rotation.
      expect(
        tracker.update(
          pointerId: 1,
          localPosition: pointAtDegrees(-170),
          timeStamp: const Duration(milliseconds: 1000),
        ),
        0,
      );
      expect(
        tracker.update(
          pointerId: 1,
          localPosition: pointAtDegrees(-135),
          timeStamp: const Duration(milliseconds: 2000),
        ),
        1,
      );
    });

    test('changing direction mid rotation is handled', () {
      final ClickWheelRotationTracker tracker = createTracker();
      expect(
        tracker.update(
          pointerId: 1,
          localPosition: pointAtDegrees(0),
          timeStamp: Duration.zero,
        ),
        0,
      );
      expect(
        tracker.update(
          pointerId: 1,
          localPosition: pointAtDegrees(40),
          timeStamp: const Duration(milliseconds: 1000),
        ),
        0,
      );
      expect(
        tracker.update(
          pointerId: 1,
          localPosition: pointAtDegrees(0),
          timeStamp: const Duration(milliseconds: 2000),
        ),
        0,
      );

      expect(
        tracker.update(
          pointerId: 1,
          localPosition: pointAtDegrees(-50),
          timeStamp: const Duration(milliseconds: 3000),
        ),
        -1,
      );
    });

    test('samples inside the deadzone are ignored', () {
      final ClickWheelRotationTracker tracker = createTracker();
      expect(
        tracker.update(
          pointerId: 1,
          localPosition: pointAtDegrees(0),
          timeStamp: Duration.zero,
        ),
        0,
      );
      expect(
        tracker.update(
          pointerId: 1,
          localPosition: wheelCenter,
          timeStamp: const Duration(milliseconds: 1000),
        ),
        0,
      );

      // Re-emerging from the deadzone re-anchors the angle so no spurious
      // half turn step is emitted.
      expect(
        tracker.update(
          pointerId: 1,
          localPosition: pointAtDegrees(180),
          timeStamp: const Duration(milliseconds: 2000),
        ),
        0,
      );
      expect(
        tracker.update(
          pointerId: 1,
          localPosition: pointAtDegrees(-130),
          timeStamp: const Duration(milliseconds: 3000),
        ),
        1,
      );
    });

    test('updates from other pointers are ignored', () {
      final ClickWheelRotationTracker tracker = createTracker();
      expect(
        tracker.update(
          pointerId: 1,
          localPosition: pointAtDegrees(0),
          timeStamp: Duration.zero,
        ),
        0,
      );

      expect(
        tracker.update(
          pointerId: 2,
          localPosition: pointAtDegrees(90),
          timeStamp: const Duration(milliseconds: 1000),
        ),
        0,
      );
      expect(
        tracker.update(
          pointerId: 1,
          localPosition: pointAtDegrees(50),
          timeStamp: const Duration(milliseconds: 2000),
        ),
        1,
      );
    });

    test('end stops tracking the pointer and allows a new gesture', () {
      final ClickWheelRotationTracker tracker = createTracker();
      tracker.end(pointerId: 2);
      expect(tracker.activePointerId, 1);

      tracker.end(pointerId: 1);
      expect(tracker.activePointerId, isNull);
      expect(
        tracker.update(
          pointerId: 1,
          localPosition: pointAtDegrees(90),
          timeStamp: Duration.zero,
        ),
        0,
      );

      expect(
        tracker.begin(
          pointerId: 1,
          wheelCenter: wheelCenter,
          innerDeadzoneRadius: innerDeadzoneRadius,
        ),
        isTrue,
      );
    });

    test('slow sweeps emit one step per base threshold of rotation', () {
      final ClickWheelRotationTracker tracker = createTracker();

      final int steps = sweep(
        tracker,
        eventCount: 10,
        degreesPerEvent: 10.5,
        stepMillis: 200,
      );

      expect(steps, 2);
      expect(tracker.velocityDegreesPerSecond, lessThan(90));
    });

    test('fast sweeps emit more steps over the same rotation', () {
      final ClickWheelRotationTracker tracker = createTracker();

      final int steps = sweep(
        tracker,
        eventCount: 10,
        degreesPerEvent: 10.5,
        stepMillis: 2,
      );

      expect(steps, 8);
    });

    test('steps per event are capped and the remainder carries over', () {
      final ClickWheelRotationTracker tracker = createTracker(
        maxStepsPerEvent: 1,
      );
      expect(
        tracker.update(
          pointerId: 1,
          localPosition: pointAtDegrees(0),
          timeStamp: Duration.zero,
        ),
        0,
      );
      expect(
        tracker.update(
          pointerId: 1,
          localPosition: pointAtDegrees(130),
          timeStamp: const Duration(milliseconds: 2000),
        ),
        1,
      );
      expect(
        tracker.update(
          pointerId: 1,
          localPosition: pointAtDegrees(140),
          timeStamp: const Duration(milliseconds: 4000),
        ),
        1,
      );
      expect(
        tracker.update(
          pointerId: 1,
          localPosition: pointAtDegrees(-10),
          timeStamp: const Duration(milliseconds: 6000),
        ),
        -1,
      );
    });

    test('velocity decays back to the base threshold after a fast spin', () {
      final ClickWheelRotationTracker tracker = createTracker();
      sweep(tracker, eventCount: 4, degreesPerEvent: 10, stepMillis: 2);
      expect(tracker.velocityDegreesPerSecond, greaterThan(1000));

      for (int i = 1; i <= 5; i++) {
        tracker.update(
          pointerId: 1,
          localPosition: pointAtDegrees(40 + i * 10),
          timeStamp: Duration(milliseconds: 8 + i * 500),
        );
      }
      expect(tracker.velocityDegreesPerSecond, lessThan(90));

      tracker.end(pointerId: 1);
      expect(
        tracker.begin(
          pointerId: 1,
          wheelCenter: wheelCenter,
          innerDeadzoneRadius: innerDeadzoneRadius,
        ),
        isTrue,
      );
      expect(
        tracker.update(
          pointerId: 1,
          localPosition: pointAtDegrees(0),
          timeStamp: const Duration(seconds: 1),
        ),
        0,
      );
      expect(
        tracker.update(
          pointerId: 1,
          localPosition: pointAtDegrees(91),
          timeStamp: const Duration(seconds: 3),
        ),
        2,
      );
    });

    test('identical timestamps do not trigger acceleration', () {
      final ClickWheelRotationTracker tracker = createTracker();

      final int steps = sweep(
        tracker,
        eventCount: 10,
        degreesPerEvent: 10.5,
        stepMillis: 0,
      );

      expect(steps, 2);
      expect(tracker.velocityDegreesPerSecond, 0);
    });
  });
}
