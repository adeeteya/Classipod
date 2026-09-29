import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/theme/ipod_gradients.dart';
import 'package:classipod/core/theme/ipod_typography.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

class OptionsListTile extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback? onTap;

  const OptionsListTile({
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
            gradient: isSelected ? IpodGradients.selection : null,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Center(
              child: Text(
                text,
                style: IpodTypography.menu.copyWith(
                  color: isSelected
                      ? context.appInverseTextColor
                      : context.appPrimaryTextColor,
                ),
                maxLines: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
