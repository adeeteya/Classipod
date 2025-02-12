import 'dart:async';

import 'package:classipod/core/alerts/dialogs.dart';
import 'package:classipod/core/constants/keys.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/providers/battery_optimization_provider.dart';
import 'package:classipod/features/tutorial/repository/tutorial_repository.dart';
import 'package:classipod/features/tutorial/widgets/tutorial_view_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tutorialControllerProvider =
    NotifierProvider<TutorialControllerNotifier, bool>(
  TutorialControllerNotifier.new,
);

class TutorialControllerNotifier extends Notifier<bool> {
  TutorialControllerNotifier() : super();

  @override
  bool build() {
    return ref.read(tutorialRepositoryProvider).getMenuOpenedFirstTime();
  }

  void playMenuTutorial() {
    if (state) {
      TutorialViewWidget().showMainMenuTutorial(
        onFinish: () async {
          await ref.read(tutorialRepositoryProvider).setMenuTutorialCompleted();
          await showBatteryOptimizationSettings();
        },
      );
    } else {
      unawaited(showBatteryOptimizationSettings());
    }
  }

  Future<void> showBatteryOptimizationSettings() async {
    final isBatteryOptimizationDisabled =
        await ref.read(batteryOptimizationProvider.future);
    if (!isBatteryOptimizationDisabled) {
      await Dialogs.showInfoDialog(
        context: deviceFrameGlobalKey.currentContext!,
        title: deviceFrameGlobalKey
            .currentContext!.localization.disableBatteryOptimizationTitle,
        content: deviceFrameGlobalKey
            .currentContext!.localization.disableBatteryOptimizationContent,
      );
      await ref.read(batteryOptimizationProvider.notifier).openSettings();
    }
  }

  Future<void> resetTutorials() async {
    final tutorialRepository = ref.read(tutorialRepositoryProvider);
    await tutorialRepository.setMenuTutorialCompleted(isMenuFirstTime: true);
  }
}
