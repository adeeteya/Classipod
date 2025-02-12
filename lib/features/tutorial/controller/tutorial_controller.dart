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
        },
      );
    } else {
      return;
    }
  }

  Future<void> resetTutorials() async {
    final tutorialRepository = ref.read(tutorialRepositoryProvider);
    await tutorialRepository.setMenuTutorialCompleted(isMenuFirstTime: true);
  }
}
