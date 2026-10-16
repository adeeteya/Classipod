import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/theme/ipod_typography.dart';
import 'package:classipod/features/status_bar/controller/clock_controller.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClockIndicator extends ConsumerWidget {
  const ClockIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clock = ref.watch(clockTextProvider).value;
    if (clock == null) return const SizedBox.shrink();
    return Text(
      clock,
      key: const ValueKey('classipod-status-bar-clock'),
      style: IpodTypography.caption.copyWith(color: AppPalette.playbackIcon),
      maxLines: 1,
    );
  }
}
