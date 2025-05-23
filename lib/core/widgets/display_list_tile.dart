import 'package:classipod/core/constants/app_palette.dart';
import 'package:flutter/cupertino.dart';

class DisplayListTile extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback? onTap;

  const DisplayListTile({
    super.key,
    required this.text,
    required this.isSelected,
    this.onTap,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color:
                          isSelected
                              ? CupertinoColors.white
                              : CupertinoColors.black,
                    ),
                    maxLines: 1,
                  ),
                ),
                if (isSelected)
                  const Icon(
                    CupertinoIcons.right_chevron,
                    color: CupertinoColors.white,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
