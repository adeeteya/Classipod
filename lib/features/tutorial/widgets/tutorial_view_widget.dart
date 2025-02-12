import 'package:classipod/core/constants/keys.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class TutorialViewWidget {
  TargetFocus _targetFocusWidget({
    required String identify,
    required GlobalKey keyTarget,
    required String tutorialText,
    bool enableOverlayTab = false,
    EdgeInsets contentPadding = const EdgeInsets.all(20),
    ShapeLightFocus shapeLightFocus = ShapeLightFocus.Circle,
    ContentAlign contentAlign = ContentAlign.top,
  }) {
    return TargetFocus(
      identify: identify,
      keyTarget: keyTarget,
      shape: shapeLightFocus,
      enableOverlayTab: enableOverlayTab,
      contents: [
        TargetContent(
          align: contentAlign,
          padding: contentPadding,
          child: Center(
            child: Text(
              tutorialText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: CupertinoColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void showMainMenuTutorial({required VoidCallback onFinish}) {
    TutorialCoachMark(
      pulseEnable: false,
      hideSkip: true,
      targets: [
        _targetFocusWidget(
          identify: 'Device Controls',
          keyTarget: deviceControlsGlobalKey,
          tutorialText: deviceFrameGlobalKey
              .currentContext!.localization.deviceControlMenuTutorialText,
        ),
        _targetFocusWidget(
          identify: 'Center Button',
          keyTarget: centerButtonGlobalKey,
          tutorialText: deviceFrameGlobalKey
              .currentContext!.localization.centerButtonMenuTutorialText,
        ),
        _targetFocusWidget(
          identify: 'Play / Pause Button',
          keyTarget: playPauseButtonGlobalKey,
          enableOverlayTab: true,
          contentPadding: const EdgeInsets.only(bottom: 40),
          tutorialText: deviceFrameGlobalKey
              .currentContext!.localization.playPauseMenuTutorialText,
        ),
        _targetFocusWidget(
          identify: 'Next Button',
          keyTarget: nextButtonGlobalKey,
          tutorialText: deviceFrameGlobalKey
              .currentContext!.localization.nextButtonMenuTutorialText,
        ),
        _targetFocusWidget(
          identify: 'Previous Button',
          keyTarget: previousButtonGlobalKey,
          tutorialText: deviceFrameGlobalKey
              .currentContext!.localization.previousButtonMenuTutorialText,
        ),
        _targetFocusWidget(
          identify: 'Menu Button',
          enableOverlayTab: true,
          contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 50),
          keyTarget: menuButtonGlobalKey,
          tutorialText: deviceFrameGlobalKey
              .currentContext!.localization.menuButtonTutorialText,
        ),
        _targetFocusWidget(
          identify: 'Device Screen',
          enableOverlayTab: true,
          keyTarget: deviceScreenGlobalKey,
          shapeLightFocus: ShapeLightFocus.RRect,
          contentAlign: ContentAlign.bottom,
          contentPadding: const EdgeInsets.only(top: 40),
          tutorialText: deviceFrameGlobalKey
              .currentContext!.localization.deviceScreenMenuTutorialText,
        ),
      ],
      onFinish: onFinish,
    ).show(context: deviceFrameGlobalKey.currentContext!);
  }
}
