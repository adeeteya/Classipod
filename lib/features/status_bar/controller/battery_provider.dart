import 'package:battery_plus/battery_plus.dart';
import 'package:classipod/features/status_bar/model/battery_details.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BatteryDetailsControllerNotifier extends AsyncNotifier<BatteryDetails> {
  final Battery _battery = Battery();

  @override
  Future<BatteryDetails> build() async {
    ref.watch(onBatteryStateChangeProvider);
    return BatteryDetails(
      level: await _battery.batteryLevel,
      batteryState: await _battery.batteryState,
    );
  }
}

final onBatteryStateChangeProvider = StreamProvider<BatteryState>((ref) {
  return Battery().onBatteryStateChanged;
});

final batteryDetailsControllerProvider =
    AsyncNotifierProvider<BatteryDetailsControllerNotifier, BatteryDetails>(() {
  return BatteryDetailsControllerNotifier();
});
