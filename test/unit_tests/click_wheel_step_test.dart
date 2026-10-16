import 'package:classipod/core/constants/constants.dart';
import 'package:classipod/features/settings/models/click_wheel_sensitivity.dart';
import 'package:classipod/features/settings/models/click_wheel_step.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ClickWheelStep', () {
    test('normal is the default multiplier of one', () {
      expect(ClickWheelStep.normal.multiplier, 1);
    });

    test('step order goes from coarse to ultra fine', () {
      expect(ClickWheelStep.coarse.index, 0);
      expect(ClickWheelStep.normal.index, 1);
      expect(ClickWheelStep.fine.index, 2);
      expect(ClickWheelStep.veryFine.index, 3);
      expect(ClickWheelStep.ultraFine.index, 4);
    });

    test('coarse doubles the step threshold', () {
      expect(
        Constants.clickWheelMediumSensitivityThreshold /
            ClickWheelStep.coarse.multiplier,
        Constants.clickWheelMediumSensitivityThreshold * 2,
      );
    });

    test('very fine quarters the step threshold', () {
      expect(
        Constants.clickWheelMediumSensitivityThreshold /
            ClickWheelStep.veryFine.multiplier,
        Constants.clickWheelMediumSensitivityThreshold / 4,
      );
    });

    test('ultra fine divides the step threshold by six', () {
      expect(
        Constants.clickWheelMediumSensitivityThreshold /
            ClickWheelStep.ultraFine.multiplier,
        Constants.clickWheelMediumSensitivityThreshold / 6,
      );
    });

    test('medium high sensitivity sits between medium and high', () {
      expect(Constants.clickWheelMediumHighSensitivityThreshold, 36);
      expect(
        Constants.clickWheelMediumHighSensitivityThreshold,
        lessThan(Constants.clickWheelMediumSensitivityThreshold),
      );
      expect(
        Constants.clickWheelMediumHighSensitivityThreshold,
        greaterThan(Constants.clickWheelHighSensitivityThreshold),
      );
    });

    test('combined with sensitivity there are 25 gradations', () {
      expect(
        ClickWheelSensitivity.values.length * ClickWheelStep.values.length,
        25,
      );
    });
  });
}
