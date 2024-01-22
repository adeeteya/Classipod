import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/cupertino.dart';

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

  Color getBatteryColor() {
    if (batteryState == BatteryState.unknown) {
      return CupertinoColors.systemGreen;
    }
    if (batteryState == BatteryState.charging) {
      return CupertinoColors.activeGreen;
    }
    if (batteryState == BatteryState.connectedNotCharging) {
      return CupertinoColors.activeOrange;
    }
    return 0 <= level && level <= 20
        ? CupertinoColors.destructiveRed
        : CupertinoColors.activeGreen;
  }
}
