import 'dart:async';

import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/features/menu/controller/split_screen_controller.dart';
import 'package:classipod/features/menu/models/split_screen_type.dart';
import 'package:classipod/features/menu/widgets/animated_album_art_scroller.dart';
import 'package:classipod/features/menu/widgets/icon_preview_widget.dart';
import 'package:classipod/features/menu/widgets/language_preview_widget.dart';
import 'package:classipod/features/menu/widgets/now_playing_preview_widget.dart';
import 'package:classipod/features/menu/widgets/settings_preview_widget.dart';
import 'package:classipod/features/music/songs/provider/songs_provider.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplitScreenViewController {
  _SplitScreenPlaceholderState? _state;

  Future<void>? openSplitView() => _state?._forwardAnimation();

  Future<void>? closeSplitView() => _state?._backwardAnimation();

  bool get isScreenVisible => _state?._isScreenVisible ?? true;
}

class SplitScreenPlaceholder extends ConsumerStatefulWidget {
  final Widget child;
  final SplitScreenViewController splitScreenController;

  const SplitScreenPlaceholder({
    super.key,
    required this.child,
    required this.splitScreenController,
  });

  @override
  ConsumerState createState() => _SplitScreenPlaceholderState();
}

class _SplitScreenPlaceholderState extends ConsumerState<SplitScreenPlaceholder>
    with SingleTickerProviderStateMixin {
  bool _isScreenVisible = false;
  late final AnimationController _animationController;
  late final Animation<Offset> _leftSlideAnimation;
  late final Animation<Offset> _rightSlideAnimation;

  @override
  void initState() {
    widget.splitScreenController._state = this;
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
    setState(() {
      _isScreenVisible = true;
    });
  }

  Future<void> _backwardAnimation() async {
    await _animationController.reverse();
    setState(() {
      _isScreenVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentSettings = ref.watch(settingsPreferencesControllerProvider);
    late final SplitScreenType splitScreenType;
    late final Widget splitScreenWidget;
    if (currentSettings.splitScreenEnabled) {
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
          contentText: currentSettings.deviceColor.name,
        );
      } else if (splitScreenType == SplitScreenType.touchScreen) {
        splitScreenWidget = IconPreviewWidget(
          titleText: context.localization.touchScreenSettingTitle,
          icon: CupertinoIcons.hand_draw,
          contentText:
              currentSettings.isTouchScreenEnabled
                  ? context.localization.tileValueOn
                  : context.localization.tileValueOff,
        );
      } else if (splitScreenType == SplitScreenType.repeat) {
        splitScreenWidget = IconPreviewWidget(
          titleText: context.localization.repeatModeSettingTitle,
          icon: CupertinoIcons.repeat,
          contentText: currentSettings.repeatMode.name,
        );
      } else if (splitScreenType == SplitScreenType.vibrate) {
        splitScreenWidget = IconPreviewWidget(
          titleText: context.localization.vibrateSettingTitle,
          icon: CupertinoIcons.rectangle_arrow_up_right_arrow_down_left,
          contentText:
              currentSettings.vibrate
                  ? context.localization.tileValueOn
                  : context.localization.tileValueOff,
        );
      } else if (splitScreenType == SplitScreenType.clickWheelSound) {
        splitScreenWidget = IconPreviewWidget(
          titleText: context.localization.clickWheelSettingTitle,
          icon: CupertinoIcons.speaker_1,
          contentText:
              currentSettings.clickWheelSound
                  ? context.localization.tileValueOn
                  : context.localization.tileValueOff,
        );
      } else if (splitScreenType == SplitScreenType.splitScreenMode) {
        splitScreenWidget = IconPreviewWidget(
          titleText: context.localization.splitScreenSettingTitle,
          icon: CupertinoIcons.uiwindow_split_2x1,
          contentText:
              currentSettings.splitScreenEnabled
                  ? context.localization.tileValueOn
                  : context.localization.tileValueOff,
        );
      } else if (splitScreenType == SplitScreenType.immersiveMode) {
        splitScreenWidget = IconPreviewWidget(
          titleText: context.localization.immersiveModeSettingTitle,
          icon: CupertinoIcons.arrow_up_left_arrow_down_right,
          contentText:
              currentSettings.immersiveMode
                  ? context.localization.tileValueOn
                  : context.localization.tileValueOff,
        );
      } else if (splitScreenType == SplitScreenType.showTutorialScreen) {
        splitScreenWidget = IconPreviewWidget(
          titleText: context.localization.showAppTutorialSettingTitle,
          icon: CupertinoIcons.play_rectangle_fill,
          contentText: "",
        );
      } else if (splitScreenType == SplitScreenType.rescanMusicFiles) {
        splitScreenWidget = IconPreviewWidget(
          titleText: context.localization.rescanMusicFilesSettingTitle,
          icon: CupertinoIcons.music_albums,
          contentText: "",
        );
      } else if (splitScreenType == SplitScreenType.changeDirectory) {
        splitScreenWidget = IconPreviewWidget(
          titleText: context.localization.changeDirectorySettingTitle,
          icon: CupertinoIcons.folder,
          contentText: currentSettings.musicFolderPath,
        );
      } else if (splitScreenType == SplitScreenType.resetSettings) {
        splitScreenWidget = IconPreviewWidget(
          titleText: context.localization.resetSettingsTitle,
          icon: CupertinoIcons.refresh_circled,
          contentText: "",
        );
      } else if (splitScreenType == SplitScreenType.donate) {
        splitScreenWidget = IconPreviewWidget(
          titleText: context.localization.donateSettingTitle,
          icon: CupertinoIcons.money_dollar_circle,
          contentText: context.localization.donateSettingDescription,
        );
      } else {
        splitScreenWidget = const AnimatedAlbumArtScroller();
      }
    }
    return CupertinoPageScaffold(
      child:
          currentSettings.splitScreenEnabled
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
