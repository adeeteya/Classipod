import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/theme/ipod_gradients.dart';
import 'package:classipod/core/theme/ipod_typography.dart';
import 'package:classipod/features/now_playing/provider/now_playing_details_provider.dart';
import 'package:classipod/features/status_bar/widgets/battery_indicator.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatusBar extends StatelessWidget {
  static const double height = 30;

  final String title;

  const StatusBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme =
        CupertinoTheme.of(context).brightness == Brightness.dark;
    final gradient = isDarkTheme
        ? IpodGradients.darkStatusBar
        : IpodGradients.statusBar;
    final borderColor = isDarkTheme
        ? AppPalette.darkStatusBarBorderColor
        : AppPalette.statusBarBorderColor;

    return SizedBox(
      height: height,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: gradient,
          border: Border(bottom: BorderSide(color: borderColor)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: IpodTypography.screenTitle.copyWith(
                    color: context.appPrimaryTextColor,
                  ),
                  maxLines: 1,
                ),
              ),
              Consumer(
                builder: (context, ref, child) {
                  final isPlaying = ref.watch(
                    nowPlayingDetailsProvider.select((e) => e.isPlaying),
                  );
                  return Icon(
                    isPlaying
                        ? CupertinoIcons.play_fill
                        : CupertinoIcons.pause_fill,
                    color: AppPalette.playbackIcon,
                  );
                },
              ),
              const SizedBox(width: 2),
              const RepaintBoundary(child: BatteryIndicator()),
            ],
          ),
        ),
      ),
    );
  }
}
