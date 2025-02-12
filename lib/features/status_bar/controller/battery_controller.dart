import 'package:battery_plus/battery_plus.dart';
import 'package:classipod/features/status_bar/model/battery_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BatteryDetailsControllerNotifier extends AsyncNotifier<BatteryModel> {
  final Battery _battery = Battery();

  @override
  Future<BatteryModel> build() async {
    ref.watch(onBatteryStateChangeProvider);
    return BatteryModel(
      level: await _battery.batteryLevel,
      batteryState: await _battery.batteryState,
    );
  }
}

final onBatteryStateChangeProvider = StreamProvider<BatteryState>((ref) {
  return Battery().onBatteryStateChanged;
});

final batteryDetailsControllerProvider =
    AsyncNotifierProvider<BatteryDetailsControllerNotifier, BatteryModel>(() {
  return BatteryDetailsControllerNotifier();
});
