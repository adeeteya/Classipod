import 'package:classipod/core/constants/keys.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/features/tutorial/widgets/animated_hand_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class TutorialViewWidget {
  TargetFocus _targetFocusWidget({
    required String identify,
    required GlobalKey keyTarget,
    required String tutorialText,
    EdgeInsets contentPadding = const EdgeInsets.all(20),
    ShapeLightFocus shapeLightFocus = ShapeLightFocus.Circle,
    ContentAlign contentAlign = ContentAlign.top,
    bool showAnimatedHand = false,
  }) {
    final List<TargetContent> targetContents = [
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
    ];

    if (showAnimatedHand) {
      final RenderBox centerButtonRenderBox =
          centerButtonGlobalKey.currentContext!.findRenderObject() as RenderBox;
      final Offset centerButtonOffset = centerButtonRenderBox.localToGlobal(
        Offset.zero,
      );

      targetContents.add(
        TargetContent(
          align: ContentAlign.custom,
          padding: EdgeInsets.zero,
          customPosition: CustomTargetContentPosition(
            top: centerButtonOffset.dy + 25,
            left: 1,
            right: 1,
          ),
          child: const AnimatedHandIcon(),
        ),
      );
    }

    return TargetFocus(
      identify: identify,
      keyTarget: keyTarget,
      shape: shapeLightFocus,
      enableOverlayTab: true,
      contents: targetContents,
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
          tutorialText:
              deviceFrameGlobalKey
                  .currentContext!
                  .localization
                  .deviceControlMenuTutorialText,
          showAnimatedHand: true,
        ),
        _targetFocusWidget(
          identify: 'Center Button',
          keyTarget: centerButtonGlobalKey,
          tutorialText:
              deviceFrameGlobalKey
                  .currentContext!
                  .localization
                  .centerButtonMenuTutorialText,
        ),
        _targetFocusWidget(
          identify: 'Play / Pause Button',
          keyTarget: playPauseButtonGlobalKey,
          contentPadding: const EdgeInsets.only(bottom: 40),
          tutorialText:
              deviceFrameGlobalKey
                  .currentContext!
                  .localization
                  .playPauseMenuTutorialText,
        ),
        _targetFocusWidget(
          identify: 'Next Button',
          keyTarget: nextButtonGlobalKey,
          tutorialText:
              deviceFrameGlobalKey
                  .currentContext!
                  .localization
                  .nextButtonMenuTutorialText,
        ),
        _targetFocusWidget(
          identify: 'Previous Button',
          keyTarget: previousButtonGlobalKey,
          tutorialText:
              deviceFrameGlobalKey
                  .currentContext!
                  .localization
                  .previousButtonMenuTutorialText,
        ),
        _targetFocusWidget(
          identify: 'Menu Button',
          contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 50),
          keyTarget: menuButtonGlobalKey,
          tutorialText:
              deviceFrameGlobalKey
                  .currentContext!
                  .localization
                  .menuButtonTutorialText,
        ),
        _targetFocusWidget(
          identify: 'Device Screen',
          keyTarget: deviceScreenGlobalKey,
          shapeLightFocus: ShapeLightFocus.RRect,
          contentAlign: ContentAlign.bottom,
          contentPadding: const EdgeInsets.only(top: 40),
          tutorialText:
              deviceFrameGlobalKey
                  .currentContext!
                  .localization
                  .deviceScreenMenuTutorialText,
        ),
      ],
      onFinish: onFinish,
    ).show(context: deviceFrameGlobalKey.currentContext!);
  }

  void showNowPlayingTutorial({required VoidCallback onFinish}) {
    TutorialCoachMark(
      pulseEnable: false,
      hideSkip: true,
      targets: [
        _targetFocusWidget(
          identify: 'Device Controls',
          keyTarget: deviceControlsGlobalKey,
          tutorialText:
              deviceFrameGlobalKey
                  .currentContext!
                  .localization
                  .deviceControlNowPlayingTutorialText,
          showAnimatedHand: true,
        ),
        _targetFocusWidget(
          identify: 'Center Button',
          keyTarget: centerButtonGlobalKey,
          tutorialText:
              deviceFrameGlobalKey
                  .currentContext!
                  .localization
                  .centerButtonNowPlayingTutorialText,
        ),
        _targetFocusWidget(
          identify: 'Next Button',
          keyTarget: nextButtonGlobalKey,
          tutorialText:
              deviceFrameGlobalKey
                  .currentContext!
                  .localization
                  .nextButtonNowPlayingTutorialText,
        ),
        _targetFocusWidget(
          identify: 'Previous Button',
          keyTarget: previousButtonGlobalKey,
          tutorialText:
              deviceFrameGlobalKey
                  .currentContext!
                  .localization
                  .previousButtonNowPlayingTutorialText,
        ),
      ],
      onFinish: onFinish,
    ).show(context: deviceFrameGlobalKey.currentContext!);
  }

  void showSearchTutorial({required VoidCallback onFinish}) {
    TutorialCoachMark(
      pulseEnable: false,
      hideSkip: true,
      targets: [
        _targetFocusWidget(
          identify: 'Device Controls',
          keyTarget: deviceControlsGlobalKey,
          tutorialText:
              deviceFrameGlobalKey
                  .currentContext!
                  .localization
                  .deviceControlSearchTutorialText,
        ),
        _targetFocusWidget(
          identify: 'Center Button',
          keyTarget: centerButtonGlobalKey,
          tutorialText:
              deviceFrameGlobalKey
                  .currentContext!
                  .localization
                  .centerButtonSearchTutorialText,
        ),
        _targetFocusWidget(
          identify: 'Next Button',
          keyTarget: nextButtonGlobalKey,
          tutorialText:
              deviceFrameGlobalKey
                  .currentContext!
                  .localization
                  .nextButtonSearchTutorialText,
        ),
        _targetFocusWidget(
          identify: 'Previous Button',
          keyTarget: previousButtonGlobalKey,
          tutorialText:
              deviceFrameGlobalKey
                  .currentContext!
                  .localization
                  .previousButtonSearchTutorialText,
        ),
        _targetFocusWidget(
          identify: 'Menu Button',
          contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 50),
          keyTarget: menuButtonGlobalKey,
          tutorialText:
              deviceFrameGlobalKey
                  .currentContext!
                  .localization
                  .menuButtonSearchTutorialText,
        ),
      ],
      onFinish: onFinish,
    ).show(context: deviceFrameGlobalKey.currentContext!);
  }
}
