import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/theme/ipod_gradients.dart';
import 'package:classipod/core/theme/ipod_typography.dart';
import 'package:classipod/core/widgets/selected_marquee_text.dart';
import 'package:classipod/features/settings/models/exclude_directory_model.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

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
            gradient: isSelected ? IpodGradients.selectionFor(context) : null,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              children: [
                Expanded(
                  child: SelectedMarqueeText(
                    excludeDirectoryModel.directoryPath,
                    isSelected: isSelected,
                    style: IpodTypography.menu.copyWith(
                      color: isSelected
                          ? context.appInverseTextColor
                          : context.appPrimaryTextColor,
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
