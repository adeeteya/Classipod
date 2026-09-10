/// Percentage of the vertical screen space the device is allowed to occupy.
///
/// The remaining space is left at the top of the screen and painted solid
/// black, which keeps the whole device within reach on tall phones.
abstract final class ScreenUsage {
  static const int fullUsagePercentage = 100;
  static const int minimumUsagePercentage = 40;
  static const int stepPercentage = 5;

  /// Selectable percentages, from the largest to the smallest.
  static final List<int> options = List<int>.unmodifiable(
    List<int>.generate(
      ((fullUsagePercentage - minimumUsagePercentage) ~/ stepPercentage) + 1,
      (index) => fullUsagePercentage - (index * stepPercentage),
    ),
  );

  /// Clamps [percentage] to the closest valid option.
  static int sanitize(int percentage) {
    final int rounded =
        (percentage / stepPercentage).round() * stepPercentage;
    return rounded.clamp(minimumUsagePercentage, fullUsagePercentage);
  }

  static String title(int percentage) => "$percentage%";
}
