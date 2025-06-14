import 'dart:async';

import 'package:classipod/core/alerts/dialogs.dart';
import 'package:classipod/core/constants/keys.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/providers/battery_optimization_provider.dart';
import 'package:classipod/features/tutorial/models/tutorial_model.dart';
import 'package:classipod/features/tutorial/repository/tutorial_repository.dart';
import 'package:classipod/features/tutorial/widgets/tutorial_view_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tutorialControllerProvider =
    NotifierProvider<TutorialControllerNotifier, TutorialModel>(
      TutorialControllerNotifier.new,
    );

class TutorialControllerNotifier extends Notifier<TutorialModel> {
  TutorialControllerNotifier() : super();

  @override
  TutorialModel build() {
    final tutorialRepository = ref.read(tutorialRepositoryProvider);
    return TutorialModel(
      isMenuFirstTime: tutorialRepository.getMenuOpenedFirstTime(),
      isNowPlayingFirstTime: tutorialRepository.getNowPlayingFirstTime(),
      isInputTextBarFirstTime: tutorialRepository.getInputTextBarFirstTime(),
    );
  }

  void playMenuTutorial() {
    if (state.isMenuFirstTime) {
      TutorialViewWidget().showMainMenuTutorial(
        onFinish: () async {
          state = state.copyWith(isMenuFirstTime: false);
          await ref.read(tutorialRepositoryProvider).setMenuTutorialCompleted();
          await showBatteryOptimizationSettings();
        },
      );
    } else {
      unawaited(showBatteryOptimizationSettings());
    }
  }

  void playNowPlayingTutorial() {
    if (state.isNowPlayingFirstTime) {
      TutorialViewWidget().showNowPlayingTutorial(
        onFinish: () async {
          state = state.copyWith(isNowPlayingFirstTime: false);
          await ref
              .read(tutorialRepositoryProvider)
              .setNowPlayingTutorialCompleted();
        },
      );
    }
  }

  void playInputTextBarTutorial() {
    if (state.isInputTextBarFirstTime) {
      TutorialViewWidget().showInputTextBarTutorial(
        onFinish: () async {
          state = state.copyWith(isInputTextBarFirstTime: false);
          await ref
              .read(tutorialRepositoryProvider)
              .setInputTextBarTutorialCompleted();
        },
      );
    }
  }

  Future<void> showBatteryOptimizationSettings() async {
    final isBatteryOptimizationDisabled = await ref.read(
      batteryOptimizationProvider.future,
    );
    if (!isBatteryOptimizationDisabled) {
      await Dialogs.showInfoDialog(
        context: deviceFrameGlobalKey.currentContext!,
        title:
            deviceFrameGlobalKey
                .currentContext!
                .localization
                .disableBatteryOptimizationTitle,
        content:
            deviceFrameGlobalKey
                .currentContext!
                .localization
                .disableBatteryOptimizationContent,
      );
      await ref.read(batteryOptimizationProvider.notifier).openSettings();
    }
  }

  Future<void> resetTutorials() async {
    state = state.copyWith(
      isMenuFirstTime: true,
      isNowPlayingFirstTime: true,
      isInputTextBarFirstTime: true,
    );
    final tutorialRepository = ref.read(tutorialRepositoryProvider);
    await tutorialRepository.setMenuTutorialCompleted(isMenuFirstTime: true);
    await tutorialRepository.setNowPlayingTutorialCompleted(
      isNowPlayingFirstTime: true,
    );
    await tutorialRepository.setInputTextBarTutorialCompleted(
      isInputTextBarFirstTime: true,
    );
  }
}
