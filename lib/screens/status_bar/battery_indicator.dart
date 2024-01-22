import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retropod/core/constants.dart';
import 'package:retropod/models/battery_details.dart';
import 'package:retropod/providers/battery_provider.dart';

class BatteryIndicator extends ConsumerWidget {
  const BatteryIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final batteryDetails = ref.watch(batteryDetailsProvider);
    return batteryDetails.when(
      data: (data) => BatteryIndicatorWidget(batteryDetails: data),
      error: (_, __) => const BatteryIndicatorWidget(
        batteryDetails: BatteryDetails(
          level: 100,
          batteryState: BatteryState.unknown,
        ),
      ),
      loading: () => const BatteryIndicatorWidget(
        batteryDetails: BatteryDetails(
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
  final BatteryDetails batteryDetails;

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

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [track, knob],
    );
  }

  Widget _buildTrack(BuildContext context) {
    final borderRadius = BorderRadius.circular(trackHeight / 4);

    final bar = _buildBar(context, trackHeight * 5 / 6);
    final icon = _buildIcon();

    final children = [bar, icon];

    return Container(
      height: trackHeight,
      width: trackHeight * trackAspectRatio,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        border: Border.all(color: batteryOutlineColor),
      ),
      child: Stack(
        children: children,
      ),
    );
  }

  Widget _buildBar(
    BuildContext context,
    double barHeight,
  ) {
    final barWidth = trackHeight * trackAspectRatio;
    final borderRadius = barHeight / 5;
    final currentColor = batteryDetails.getBatteryColor();

    return Padding(
      padding: EdgeInsets.all(trackHeight / 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Stack(
          children: [
            const SizedBox.expand(),
            AnimatedContainer(
              duration: duration,
              width: barWidth * batteryDetails.level / 100,
              height: double.infinity,
              curve: curve,
              decoration: BoxDecoration(
                color: currentColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return AnimatedSwitcher(
            duration: Duration(milliseconds: duration.inMilliseconds ~/ 5),
            switchInCurve: curve,
            switchOutCurve: curve,
            child: batteryDetails.batteryState == BatteryState.charging
                ? Icon(
                    CupertinoIcons.bolt,
                    color: CupertinoColors.white,
                    size: constraints.maxHeight,
                    shadows: const [
                      Shadow(blurRadius: 0.5),
                      Shadow(
                        color: CupertinoColors.white,
                        blurRadius: 1,
                      ),
                    ],
                  )
                : null,
          );
        },
      ),
    );
  }

  Widget _buildKnob(BuildContext context) {
    final knobHeight = trackHeight / 3;
    final knobWidth = knobHeight / 2;

    return Padding(
      padding: EdgeInsets.only(left: trackHeight / 20),
      child: Container(
        width: knobWidth,
        height: knobHeight,
        decoration: BoxDecoration(
          color: batteryOutlineColor,
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(knobWidth / 3),
          ),
        ),
      ),
    );
  }
}
