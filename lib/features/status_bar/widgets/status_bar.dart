import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/features/now_playing/provider/now_playing_details_provider.dart';
import 'package:classipod/features/status_bar/widgets/battery_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatusBar extends StatelessWidget {
  final String title;

  const StatusBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: double.infinity,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppPalette.statusBarGradientColor1,
              AppPalette.statusBarGradientColor2,
            ],
          ),
          border: Border(
            bottom: BorderSide(color: AppPalette.statusBarBorderColor),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
                    color: AppPalette.selectedTileGradientColor1,
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
