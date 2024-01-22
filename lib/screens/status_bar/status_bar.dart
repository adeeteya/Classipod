import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retropod/core/constants.dart';
import 'package:retropod/models/display_details.dart';
import 'package:retropod/providers/display_provider.dart';
import 'package:retropod/providers/music_provider.dart';
import 'package:retropod/screens/status_bar/battery_indicator.dart';

class StatusBar extends ConsumerWidget {
  const StatusBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final displayDetails = ref.watch(displayProvider);
    return Container(
      height: size.height * 0.03,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            statusBarGradientColor1,
            statusBarGradientColor2,
          ],
        ),
        border: Border(
          bottom: BorderSide(
            color: statusBarBorderColor,
          ),
        ),
      ),
      child: (displayDetails.displayScreenType == DisplayScreenType.menu)
          ? const Row(
              children: [
                Spacer(),
                Text(
                  "     iPod",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.black,
                  ),
                ),
                Spacer(),
                BatteryIndicator(),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (displayDetails.displayScreenType ==
                    DisplayScreenType.nowPlaying)
                  Consumer(builder: (context, ref, child) {
                    final isPlaying = ref.watch(
                        musicProvider.select((value) => value.isPlaying));
                    return Icon(
                      (isPlaying)
                          ? CupertinoIcons.play_fill
                          : CupertinoIcons.pause_fill,
                      color: primaryBlueGradientColor1,
                    );
                  }),
                Text(
                  displayDetails.displayScreenType.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.black,
                  ),
                ),
                const BatteryIndicator(),
              ],
            ),
    );
  }
}
