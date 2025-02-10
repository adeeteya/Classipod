import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/features/menu/models/split_screen_type.dart';
import 'package:flutter/cupertino.dart';

class IconPreviewWidget extends StatelessWidget {
  final String titleText;
  final IconData icon;
  final String contentText;
  const IconPreviewWidget({
    super.key,
    required this.titleText,
    required this.icon,
    required this.contentText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: const ValueKey(SplitScreenType.shuffle),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  titleText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    color: CupertinoColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(
                icon,
                size: 70,
                color: CupertinoColors.white,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  contentText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: (contentText.length > 10) ? 14 : 20,
                    color: CupertinoColors.white,
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
