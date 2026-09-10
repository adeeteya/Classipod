import 'dart:math' as math;

import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:classipod/features/settings/models/screen_usage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Restricts the app to the bottom `screenUsagePercentage` of the available
/// height and paints the unused area at the top solid black.
class ScreenUsageWrapper extends ConsumerWidget {
  final Widget child;

  const ScreenUsageWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int screenUsagePercentage = ref.watch(
      settingsPreferencesControllerProvider.select(
        (settings) => settings.screenUsagePercentage,
      ),
    );

    if (screenUsagePercentage >= ScreenUsage.fullUsagePercentage) {
      return child;
    }

    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double fullHeight = mediaQuery.size.height;
    final double usedHeight =
        fullHeight * screenUsagePercentage / ScreenUsage.fullUsagePercentage;
    final double blackedOutHeight = fullHeight - usedHeight;

    // The blacked out area already covers the status bar and any notch, so the
    // insets it was compensating for have to be removed from the child.
    double shrinkTop(double inset) => math.max(0, inset - blackedOutHeight);

    return ColoredBox(
      color: CupertinoColors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: blackedOutHeight),
          SizedBox(
            height: usedHeight,
            child: MediaQuery(
              data: mediaQuery.copyWith(
                size: Size(mediaQuery.size.width, usedHeight),
                padding: mediaQuery.padding.copyWith(
                  top: shrinkTop(mediaQuery.padding.top),
                ),
                viewPadding: mediaQuery.viewPadding.copyWith(
                  top: shrinkTop(mediaQuery.viewPadding.top),
                ),
                viewInsets: mediaQuery.viewInsets.copyWith(
                  top: shrinkTop(mediaQuery.viewInsets.top),
                ),
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
