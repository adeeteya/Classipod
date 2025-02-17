import 'package:classipod/features/menu/models/split_screen_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splitScreenControllerProvider =
    NotifierProvider<SplitScreenControllerNotifier, SplitScreenType>(
      SplitScreenControllerNotifier.new,
    );

class SplitScreenControllerNotifier extends Notifier<SplitScreenType> {
  @override
  SplitScreenType build() {
    return SplitScreenType.albumArt;
  }

  set changeSplitScreenType(SplitScreenType splitScreenType) {
    state = splitScreenType;
  }
}
