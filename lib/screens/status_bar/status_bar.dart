import 'package:classipod/core/constants.dart';
import 'package:classipod/models/display_details.dart';
import 'package:classipod/providers/display_provider.dart';
import 'package:classipod/providers/music_provider.dart';
import 'package:classipod/screens/status_bar/battery_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatusBar extends ConsumerWidget {
  const StatusBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final displayDetails = ref.watch(displayProvider);
    return SizedBox(
      height: size.height * 0.03,
      width: double.infinity,
      child: DecoratedBox(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: (displayDetails.displayScreenType == DisplayScreenType.menu)
              ? const Row(
                  children: [
                    Spacer(),
                    Text(
                      "     iPod",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
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
                      ),
                    ),
                    const BatteryIndicator(),
                  ],
                ),
        ),
      ),
    );
  }
}
