import 'dart:async';

import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/features/menu/controller/split_screen_controller.dart';
import 'package:classipod/features/menu/models/split_screen_type.dart';
import 'package:classipod/features/menu/widgets/animated_album_art_scroller.dart';
import 'package:classipod/features/menu/widgets/icon_preview_widget.dart';
import 'package:classipod/features/menu/widgets/language_preview_widget.dart';
import 'package:classipod/features/menu/widgets/now_playing_preview_widget.dart';
import 'package:classipod/features/menu/widgets/settings_preview_widget.dart';
import 'package:classipod/features/music/songs/songs_provider.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplitScreenPlaceholder extends ConsumerStatefulWidget {
  final Widget child;
  const SplitScreenPlaceholder({
    super.key,
    required this.child,
  });

  @override
  ConsumerState createState() => _SplitScreenPlaceholderState();
}

class _SplitScreenPlaceholderState extends ConsumerState<SplitScreenPlaceholder>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<Offset> _leftSlideAnimation;
  late final Animation<Offset> _rightSlideAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 300),
    );
    _leftSlideAnimation = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: Offset.zero,
    ).animate(_animationController);
    _rightSlideAnimation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(_animationController);
    unawaited(_forwardAnimation());
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _forwardAnimation() async {
    await _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final splitScreenEnabled = ref.watch(
      settingsPreferencesControllerProvider.select((e) => e.splitScreenEnabled),
    );
    late final SplitScreenType splitScreenType;
    late final Widget splitScreenWidget;
    if (splitScreenEnabled) {
      splitScreenType = ref.watch(splitScreenControllerProvider);
      if (splitScreenType == SplitScreenType.shuffle) {
        splitScreenWidget = IconPreviewWidget(
          titleText: context.localization.shuffleSongsMenuTitle,
          icon: CupertinoIcons.shuffle,
          contentText:
              "${ref.read(songsProvider).length} ${context.localization.songsScreenTitle}",
        );
      } else if (splitScreenType == SplitScreenType.settings) {
        splitScreenWidget = const SettingsPreviewWidget();
      } else if (splitScreenType == SplitScreenType.nowPlaying) {
        splitScreenWidget = const NowPlayingPreviewWidget();
      } else if (splitScreenType == SplitScreenType.language) {
        splitScreenWidget = const LanguagePreviewWidget();
      } else if (splitScreenType == SplitScreenType.deviceColor) {
        splitScreenWidget = IconPreviewWidget(
          titleText: context.localization.deviceColorSettingTitle,
          icon: CupertinoIcons.device_phone_portrait,
          contentText: "",
        );
      } else if (splitScreenType == SplitScreenType.touchScreen) {
        splitScreenWidget = IconPreviewWidget(
          titleText: context.localization.touchScreenSettingTitle,
          icon: CupertinoIcons.hand_draw,
          contentText: "",
        );
      } else if (splitScreenType == SplitScreenType.repeat) {
        splitScreenWidget = IconPreviewWidget(
          titleText: context.localization.repeatModeSettingTitle,
          icon: CupertinoIcons.repeat,
          contentText: "",
        );
      } else if (splitScreenType == SplitScreenType.vibrate) {
        splitScreenWidget = IconPreviewWidget(
          titleText: context.localization.vibrateSettingTitle,
          icon: CupertinoIcons.rectangle_arrow_up_right_arrow_down_left,
          contentText: "",
        );
      } else if (splitScreenType == SplitScreenType.clickWheelSound) {
        splitScreenWidget = IconPreviewWidget(
          titleText: context.localization.clickWheelSettingTitle,
          icon: CupertinoIcons.speaker_1,
          contentText: "",
        );
      } else if (splitScreenType == SplitScreenType.splitScreenMode) {
        splitScreenWidget = IconPreviewWidget(
          titleText: context.localization.splitScreenSettingTitle,
          icon: CupertinoIcons.uiwindow_split_2x1,
          contentText: "",
        );
      } else if (splitScreenType == SplitScreenType.immersiveMode) {
        splitScreenWidget = IconPreviewWidget(
          titleText: context.localization.immersiveModeSettingTitle,
          icon: CupertinoIcons.arrow_up_left_arrow_down_right,
          contentText: "",
        );
      } else if (splitScreenType == SplitScreenType.changeDirectory) {
        splitScreenWidget = IconPreviewWidget(
          titleText: context.localization.changeDirectorySettingTitle,
          icon: CupertinoIcons.folder,
          contentText: "",
        );
      } else if (splitScreenType == SplitScreenType.resetSettings) {
        splitScreenWidget = IconPreviewWidget(
          titleText: context.localization.resetSettingsTitle,
          icon: CupertinoIcons.refresh,
          contentText: "",
        );
      } else if (splitScreenType == SplitScreenType.donate) {
        splitScreenWidget = IconPreviewWidget(
          titleText: context.localization.donateSettingTitle,
          icon: CupertinoIcons.money_dollar_circle,
          contentText: "",
        );
      } else {
        splitScreenWidget = const AnimatedAlbumArtScroller();
      }
    }
    return CupertinoPageScaffold(
      child: splitScreenEnabled
          ? Row(
              children: [
                Expanded(
                  child: SlideTransition(
                    position: _leftSlideAnimation,
                    child: widget.child,
                  ),
                ),
                Expanded(
                  child: SlideTransition(
                    position: _rightSlideAnimation,
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
                ),
              ],
            )
          : widget.child,
    );
  }
}
