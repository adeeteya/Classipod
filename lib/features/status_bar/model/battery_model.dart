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

  @override
  bool operator ==(Object other) {
    return other is BatteryModel &&
        other.level == level &&
        other.batteryState == batteryState;
  }

  @override
  int get hashCode {
    return Object.hash(level, batteryState);
  }

  @override
  String toString() {
    return 'BatteryModel(level: $level, batteryState: $batteryState)';
  }
}
