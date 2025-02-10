import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/constants/assets.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/features/menu/models/split_screen_type.dart';
import 'package:flutter/cupertino.dart';

class SettingsPreviewWidget extends StatelessWidget {
  const SettingsPreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: const ValueKey(SplitScreenType.settings),
      width: double.infinity,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppPalette.darkScreenBackgroundGradient1,
              AppPalette.darkScreenBackgroundGradient2,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  context.localization.appTitle,
                  style: const TextStyle(
                    fontSize: 20,
                    color: CupertinoColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Image.asset(
                  Assets.appIcon,
                  height: 64,
                  width: 64,
                  color: CupertinoColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
