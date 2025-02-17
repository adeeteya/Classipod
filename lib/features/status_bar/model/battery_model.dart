import 'package:battery_plus/battery_plus.dart';

class BatteryModel {
  const BatteryModel({required this.level, required this.batteryState});

  final int level;
  final BatteryState batteryState;

  BatteryModel copyWith({int? level, BatteryState? batteryState}) {
    return BatteryModel(
      level: level ?? this.level,
      batteryState: batteryState ?? this.batteryState,
    );
  }
}
