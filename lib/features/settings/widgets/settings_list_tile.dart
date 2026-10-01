import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/theme/ipod_gradients.dart';
import 'package:classipod/core/theme/ipod_typography.dart';
import 'package:classipod/core/widgets/selected_marquee_text.dart';
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
            gradient: isSelected ? IpodGradients.selectionFor(context) : null,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 5,
              children: [
                Flexible(
                  child: SelectedMarqueeText(
                    text,
                    isSelected: isSelected,
                    style: IpodTypography.menu.copyWith(
                      color: isSelected
                          ? context.appInverseTextColor
                          : context.appPrimaryTextColor,
                    ),
                  ),
                ),
                if (value != null)
                  Text(
                    value!,
                    style: IpodTypography.menu.copyWith(
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
