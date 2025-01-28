import 'package:battery_plus/battery_plus.dart';

class BatteryDetails {
  const BatteryDetails({
    required this.level,
    required this.batteryState,
  });

  final int level;
  final BatteryState batteryState;

  BatteryDetails copyWith({int? level, BatteryState? batteryState}) {
    return BatteryDetails(
      level: level ?? this.level,
      batteryState: batteryState ?? this.batteryState,
    );
  }
}
