import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/constants/assets.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/theme/ipod_gradients.dart';
import 'package:classipod/core/theme/ipod_typography.dart';
import 'package:classipod/features/menu/models/split_screen_type.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

class SettingsPreviewWidget extends StatelessWidget {
  const SettingsPreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: const ValueKey(SplitScreenType.settings),
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: IpodGradients.splitPreviewFor(context),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  context.localization.appTitle,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: IpodTypography.title.copyWith(
                    color: AppPalette.previewForeground,
                  ),
                ),
              ),
              Center(
                child: Image.asset(
                  Assets.appIcon,
                  height: 64,
                  width: 64,
                  color: AppPalette.previewForeground,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
