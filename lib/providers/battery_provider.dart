import 'package:battery_plus/battery_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retropod/models/battery_details.dart';

class BatteryDetailsNotifier extends AsyncNotifier<BatteryDetails> {
  final battery = Battery();

  @override
  Future<BatteryDetails> build() async {
    ref.watch(onBatteryStateChangeProvider);
    return BatteryDetails(
      level: await battery.batteryLevel,
      batteryState: await battery.batteryState,
    );
  }
}

final onBatteryStateChangeProvider = StreamProvider<BatteryState>((ref) {
  return Battery().onBatteryStateChanged;
});

final batteryDetailsProvider =
    AsyncNotifierProvider<BatteryDetailsNotifier, BatteryDetails>(() {
  return BatteryDetailsNotifier();
});
