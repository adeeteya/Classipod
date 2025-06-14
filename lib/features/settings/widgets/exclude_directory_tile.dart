import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/widgets/marquee_text.dart';
import 'package:classipod/features/settings/models/exclude_directory_model.dart';
import 'package:flutter/cupertino.dart';

class ExcludeDirectoryTile extends StatelessWidget {
  final ExcludeDirectoryModel excludeDirectoryModel;
  final bool isSelected;
  final VoidCallback onTap;

  const ExcludeDirectoryTile({
    super.key,
    required this.excludeDirectoryModel,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 30,
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border:
                isSelected
                    ? const Border(
                      top: BorderSide(
                        color: AppPalette.selectedTileTopBorderColor,
                      ),
                      bottom: BorderSide(
                        color: AppPalette.selectedTileBottomBorderColor,
                      ),
                    )
                    : null,
            gradient:
                isSelected
                    ? const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppPalette.selectedTileGradientColor1,
                        AppPalette.selectedTileGradientColor2,
                      ],
                    )
                    : null,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              children: [
                Expanded(
                  child: MarqueeText(
                    excludeDirectoryModel.directoryPath,
                    mode: TextScrollMode.bouncing,
                    intervalSpaces: null,
                    delayBefore: const Duration(seconds: 2),
                    pauseBetween: const Duration(seconds: 2),
                    pauseOnBounce: const Duration(seconds: 2),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color:
                          isSelected
                              ? CupertinoColors.white
                              : CupertinoColors.black,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                (excludeDirectoryModel.isExcluded)
                    ? const Icon(
                      CupertinoIcons.xmark_square_fill,
                      color: AppPalette.lowBatteryBarGradientColor2,
                    )
                    : const Icon(
                      CupertinoIcons.checkmark_alt_circle_fill,
                      color: AppPalette.batteryBarGradientColor6,
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
