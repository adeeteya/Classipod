import 'package:classipod/core/constants/app_palette.dart';
import 'package:flutter/cupertino.dart';

class LanguagePreviewWidget extends StatelessWidget {
  const LanguagePreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
          padding: const EdgeInsets.all(20),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 0,
                top: 20,
                child: Text(
                  "Bienvenue",
                  style: TextStyle(
                    fontSize: 20,
                    color: AppPalette.darkScreenLightIconColor
                        .withValues(alpha: 0.5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                right: -25,
                top: 40,
                child: Text(
                  "欢迎",
                  style: TextStyle(
                    fontSize: 30,
                    color: AppPalette.darkScreenLightIconColor
                        .withValues(alpha: 0.5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                right: -30,
                bottom: 20,
                child: Text(
                  "Willkomen",
                  style: TextStyle(
                    fontSize: 20,
                    color: AppPalette.darkScreenLightIconColor
                        .withValues(alpha: 0.5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Center(
                child: Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 25,
                    color: CupertinoColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
