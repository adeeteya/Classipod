import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

enum VolumeMode {
  app,
  system;

  String title(BuildContext context) {
    switch (this) {
      case app:
        return context.localization.appVolumeMode;
      case system:
        return context.localization.systemVolumeMode;
    }
  }
}
