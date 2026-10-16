import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

/// Fine tuning multiplier applied on top of the click wheel sensitivity
/// threshold. A higher multiplier divides the base threshold so one full
/// revolution of the wheel produces more scroll steps.
enum ClickWheelStep {
  coarse(0.5),
  normal(1),
  fine(2),
  veryFine(4),
  ultraFine(6);

  const ClickWheelStep(this.multiplier);

  final double multiplier;

  String title(BuildContext context) {
    switch (this) {
      case coarse:
        return context.localization.coarse;
      case normal:
        return context.localization.normal;
      case fine:
        return context.localization.fine;
      case veryFine:
        return context.localization.veryFine;
      case ultraFine:
        return context.localization.ultraFine;
    }
  }
}
