import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/theme/ipod_gradients.dart';
import 'package:classipod/core/theme/ipod_typography.dart';
import 'package:classipod/features/menu/models/split_screen_type.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

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
        decoration: const BoxDecoration(gradient: IpodGradients.splitPreview),
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
                  style: IpodTypography.title.copyWith(
                    color: AppPalette.previewForeground,
                  ),
                ),
              ),
              Icon(icon, size: 70, color: AppPalette.previewForeground),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  contentText,
                  textAlign: TextAlign.center,
                  style: IpodTypography.description.copyWith(
                    color: AppPalette.previewForeground,
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
