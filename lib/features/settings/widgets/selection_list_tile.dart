import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/widgets/marquee_text.dart';
import 'package:flutter/cupertino.dart';

/// The row every selection screen is built from, so they all read the same as
/// the language and device colour screens.
class SelectionListTile extends StatelessWidget {
  final String text;

  /// Shown greyed on the right, the way the settings rows show their value.
  final String? value;

  /// Marks the option currently in use, as opposed to the highlighted one.
  final bool isActive;

  final bool isSelected;

  /// Indents nested rows without drawing any tree decoration.
  final int indentLevel;

  final VoidCallback onTap;

  const SelectionListTile({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
    this.value,
    this.isActive = false,
    this.indentLevel = 0,
  });

  @override
  Widget build(BuildContext context) {
    final Color textColor = isSelected
        ? context.appInverseTextColor
        : context.appPrimaryTextColor;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 30,
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: isSelected
                ? const Border(
                    top: BorderSide(
                      color: AppPalette.selectedTileTopBorderColor,
                    ),
                    bottom: BorderSide(
                      color: AppPalette.selectedTileBottomBorderColor,
                    ),
                  )
                : null,
            gradient: isSelected
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
            padding: EdgeInsets.only(left: 4 + (indentLevel * 12), right: 4),
            child: Row(
              spacing: 5,
              children: [
                if (isActive)
                  Icon(CupertinoIcons.checkmark, size: 15, color: textColor),
                Flexible(
                  child: MarqueeText(
                    text,
                    mode: TextScrollMode.bouncing,
                    intervalSpaces: null,
                    delayBefore: const Duration(seconds: 2),
                    pauseBetween: const Duration(seconds: 2),
                    pauseOnBounce: const Duration(seconds: 2),
                    style: CupertinoTheme.of(context).textTheme.textStyle
                        .copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                          overflow: TextOverflow.ellipsis,
                        ),
                  ),
                ),
                const Spacer(),
                if (value != null)
                  Text(
                    value!,
                    style: CupertinoTheme.of(context).textTheme.textStyle
                        .copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isSelected
                              ? context.appInverseTextColor
                              : context.appSecondaryTextColor,
                        ),
                  )
                else if (isSelected)
                  Icon(
                    CupertinoIcons.right_chevron,
                    color: context.appInverseTextColor,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
