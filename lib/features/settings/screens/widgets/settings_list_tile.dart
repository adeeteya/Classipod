import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:flutter/cupertino.dart';

class SettingsListTile extends StatelessWidget {
  final String text;
  final bool? isOn;
  final bool isSelected;
  const SettingsListTile({
    super.key,
    required this.text,
    required this.isSelected,
    this.isOn,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: isSelected
              ? const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppPalette.primaryBlueGradientColor1,
                    AppPalette.primaryBlueGradientColor2,
                  ],
                )
              : null,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isSelected
                      ? CupertinoColors.white
                      : CupertinoColors.black,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (isOn != null)
                Text(
                  (isOn!)
                      ? context.localization.tileValueOn
                      : context.localization.tileValueOff,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isSelected
                        ? CupertinoColors.white
                        : AppPalette.hintTextColor,
                  ),
                ),
              if (isOn == null && isSelected)
                const Icon(
                  CupertinoIcons.right_chevron,
                  color: CupertinoColors.white,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
