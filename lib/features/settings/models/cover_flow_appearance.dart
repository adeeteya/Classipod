import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:flutter/widgets.dart';

enum CoverFlowAppearance {
  original,
  big;

  static CoverFlowAppearance fromName(String value) =>
      values.firstWhere((item) => item.name == value, orElse: () => original);

  String title(BuildContext context) => switch (this) {
    original => context.localization.coverFlowOriginalTitle,
    big => context.localization.coverFlowBigTitle,
  };
}
