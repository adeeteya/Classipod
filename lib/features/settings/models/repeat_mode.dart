import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';

enum RepeatMode {
  off,
  one,
  all;

  String title(BuildContext context) {
    switch (this) {
      case off:
        return context.localization.tileValueOff;
      case one:
        return context.localization.repeatModeOne;
      case all:
        return context.localization.repeatModeAll;
    }
  }

  LoopMode toLoopMode() {
    switch (this) {
      case off:
        return LoopMode.off;
      case one:
        return LoopMode.one;
      case all:
        return LoopMode.all;
    }
  }
}
