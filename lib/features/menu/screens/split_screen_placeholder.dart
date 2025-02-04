import 'package:classipod/features/menu/controller/split_screen_controller.dart';
import 'package:classipod/features/menu/models/split_screen_type.dart';
import 'package:classipod/features/menu/widgets/animated_album_art_scroller.dart';
import 'package:classipod/features/menu/widgets/now_playing_preview_widget.dart';
import 'package:classipod/features/menu/widgets/settings_preview_widget.dart';
import 'package:classipod/features/menu/widgets/shuffle_preview_widget.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplitScreenPlaceholder extends ConsumerWidget {
  final Widget child;
  const SplitScreenPlaceholder({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final splitScreenEnabled = ref.watch(
      settingsPreferencesControllerProvider.select((e) => e.splitScreenEnabled),
    );
    late final SplitScreenType splitScreenType;
    late final Widget splitScreenWidget;
    if (splitScreenEnabled) {
      splitScreenType = ref.watch(splitScreenControllerProvider);
      if (splitScreenType == SplitScreenType.shuffle) {
        splitScreenWidget = const ShufflePreviewWidget();
      } else if (splitScreenType == SplitScreenType.settings) {
        splitScreenWidget = const SettingsPreviewWidget();
      } else if (splitScreenType == SplitScreenType.nowPlaying) {
        splitScreenWidget = const NowPlayingPreviewWidget();
      } else {
        splitScreenWidget = const AnimatedAlbumArtScroller();
      }
    }

    return CupertinoPageScaffold(
      child: splitScreenEnabled
          ? Row(
              children: [
                Expanded(child: child),
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder: (widget, animation) {
                      if (splitScreenType == SplitScreenType.albumArt) {
                        final slideAnimation = Tween<Offset>(
                          begin: const Offset(1, 0),
                          end: Offset.zero,
                        ).animate(animation);
                        return FadeTransition(
                          opacity: animation,
                          child: SlideTransition(
                            position: slideAnimation,
                            child: widget,
                          ),
                        );
                      }
                      return FadeTransition(
                        opacity: animation,
                        child: widget,
                      );
                    },
                    child: splitScreenWidget,
                  ),
                ),
              ],
            )
          : child,
    );
  }
}
