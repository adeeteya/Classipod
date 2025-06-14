import 'package:battery_plus/battery_plus.dart';
import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/features/status_bar/controller/battery_controller.dart';
import 'package:classipod/features/status_bar/model/battery_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BatteryIndicator extends ConsumerWidget {
  const BatteryIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final batteryDetails = ref.watch(batteryDetailsControllerProvider);
    return batteryDetails.when(
      data: (data) => BatteryIndicatorWidget(batteryDetails: data),
      error:
          (_, _) => const BatteryIndicatorWidget(
            batteryDetails: BatteryModel(
              level: 100,
              batteryState: BatteryState.unknown,
            ),
          ),
      loading:
          () => const BatteryIndicatorWidget(
            batteryDetails: BatteryModel(
              level: 100,
              batteryState: BatteryState.full,
            ),
          ),
    );
  }
}

class BatteryIndicatorWidget extends StatelessWidget {
  const BatteryIndicatorWidget({
    super.key,
    required this.batteryDetails,
    this.trackHeight = 10.0,
    this.trackAspectRatio = 2.0,
    this.curve = Curves.ease,
    this.duration = const Duration(seconds: 1),
  }) : assert(trackAspectRatio >= 1, 'width:height must >= 1');

  /// battery status
  final BatteryModel batteryDetails;

  /// The height of the track (i.e. container).
  final double trackHeight;

  /// width:height must >= 1
  final double trackAspectRatio;

  /// animation curve
  final Curve curve;

  /// animation duration
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final track = _buildTrack(context);
    final knob = _buildKnob(context);

    return Row(mainAxisSize: MainAxisSize.min, children: [track, knob]);
  }

  Widget _buildTrack(BuildContext context) {
    final bar = _buildBar(context, trackHeight * 5 / 6);
    final icon = _buildIcon();

    return SizedBox(
      height: trackHeight,
      width: trackHeight * trackAspectRatio,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppPalette.batteryBarBackgroundGradientColor1,
              AppPalette.batteryBarBackgroundGradientColor2,
            ],
          ),
          border: Border.all(
            color: AppPalette.batteryBarOutlineColor,
            width: 0.5,
          ),
        ),
        child: Stack(clipBehavior: Clip.none, children: [bar, icon]),
      ),
    );
  }

  Widget _buildBar(BuildContext context, double barHeight) {
    final barWidth = trackHeight * trackAspectRatio;

    return Padding(
      padding: const EdgeInsets.all(0.55),
      child: AnimatedContainer(
        duration: duration,
        width: barWidth * batteryDetails.level / 100,
        height: double.infinity,
        curve: curve,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors:
                (batteryDetails.level <= 20)
                    ? [
                      AppPalette.lowBatteryBarGradientColor1,
                      AppPalette.lowBatteryBarGradientColor2,
                    ]
                    : [
                      AppPalette.batteryBarGradientColor1,
                      AppPalette.batteryBarGradientColor2,
                      AppPalette.batteryBarGradientColor3,
                      AppPalette.batteryBarGradientColor4,
                      AppPalette.batteryBarGradientColor5,
                      AppPalette.batteryBarGradientColor6,
                      AppPalette.batteryBarGradientColor7,
                      AppPalette.batteryBarGradientColor6,
                    ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return AnimatedSwitcher(
            key: UniqueKey(),
            duration: Duration(milliseconds: duration.inMilliseconds ~/ 5),
            switchInCurve: curve,
            switchOutCurve: curve,
            child:
                batteryDetails.batteryState == BatteryState.charging
                    ? Icon(
                      CupertinoIcons.bolt_fill,
                      color: AppPalette.batteryBarIconColor,
                      size: constraints.maxHeight - 2,
                    )
                    : null,
          );
        },
      ),
    );
  }

  Widget _buildKnob(BuildContext context) {
    final knobHeight = trackHeight / 3;
    final knobWidth = knobHeight / 1.5;

    return SizedBox(
      width: knobWidth,
      height: knobHeight,
      child: const ColoredBox(color: AppPalette.batteryBarOutlineColor),
    );
  }
}
