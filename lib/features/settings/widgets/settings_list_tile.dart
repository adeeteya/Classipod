import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/widgets/marquee_text.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

class SettingsListTile extends StatelessWidget {
  final String text;
  final String? value;
  final bool isSelected;
  final VoidCallback onTap;

  const SettingsListTile({
    super.key,
    required this.text,
    this.value,
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
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 5,
              children: [
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
                          color: isSelected
                              ? context.appInverseTextColor
                              : context.appPrimaryTextColor,
                          overflow: TextOverflow.ellipsis,
                        ),
                  ),
                ),
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
                  ),
                if (value == null && isSelected)
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
