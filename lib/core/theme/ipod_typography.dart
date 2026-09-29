import 'package:classipod/core/constants/assets.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

abstract final class IpodTypography {
  static const TextStyle body = TextStyle(
    fontFamily: Assets.helveticaFont,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.2,
  );

  static const TextStyle screenTitle = TextStyle(
    fontFamily: Assets.helveticaFont,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.2,
  );

  static const TextStyle menu = TextStyle(
    fontFamily: Assets.helveticaFont,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.2,
  );

  static const TextStyle title = TextStyle(
    fontFamily: Assets.helveticaFont,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.2,
  );

  static const TextStyle metadata = TextStyle(
    fontFamily: Assets.helveticaFont,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.2,
  );

  static const TextStyle description = TextStyle(
    fontFamily: Assets.helveticaFont,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.3,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: Assets.helveticaFont,
    fontSize: 12,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.2,
  );
}
