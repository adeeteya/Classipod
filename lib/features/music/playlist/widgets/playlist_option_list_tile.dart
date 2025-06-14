import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/features/music/playlist/models/playlist_option_type.dart';
import 'package:flutter/cupertino.dart';

class PlaylistOptionListTile extends StatelessWidget {
  final VoidCallback onTap;
  final bool isSelected;
  final PlaylistOptionType type;
  const PlaylistOptionListTile({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    late final IconData iconData;
    late final String title;
    late final Color iconColor;
    switch (type) {
      case PlaylistOptionType.savePlaylist:
        iconData = CupertinoIcons.square_arrow_down;
        title = context.localization.savePlaylist;
        iconColor = AppPalette.batteryBarGradientColor1;
        break;
      case PlaylistOptionType.renamePlaylist:
        iconData = CupertinoIcons.pencil_circle;
        title = context.localization.renamePlaylist;
        iconColor = AppPalette.nowProgressBarGradientColor8;
        break;
      case PlaylistOptionType.clearPlaylist:
        iconData = CupertinoIcons.bin_xmark;
        title = context.localization.clearPlaylist;
        iconColor = AppPalette.lowBatteryBarGradientColor1;
        break;
      case PlaylistOptionType.renameConfirm:
        iconData = CupertinoIcons.checkmark_alt_circle;
        title = context.localization.buttonConfirmText;
        iconColor = AppPalette.batteryBarBackgroundGradientColor1;
        break;
      case PlaylistOptionType.renameCancel:
        iconData = CupertinoIcons.xmark_circle;
        title = context.localization.cancelText;
        iconColor = AppPalette.lowBatteryBarGradientColor1;
        break;
    }

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 54,
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
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
          child: Row(
            children: [
              SizedBox(
                height: 54,
                width: 54,
                child: ColoredBox(
                  color: iconColor,
                  child: Icon(iconData, size: 25, color: CupertinoColors.black),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
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
    );
  }
}
