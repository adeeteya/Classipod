import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/theme/ipod_gradients.dart';
import 'package:classipod/core/theme/ipod_typography.dart';
import 'package:classipod/core/widgets/marquee_text.dart';
import 'package:classipod/features/menu/models/split_screen_type.dart';
import 'package:classipod/features/now_playing/provider/now_playing_details_provider.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NowPlayingPreviewWidget extends ConsumerWidget {
  const NowPlayingPreviewWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentMetadata = ref.watch(
      nowPlayingDetailsProvider.select((e) => e.currentMetadata),
    );

    return SizedBox(
      key: const ValueKey(SplitScreenType.nowPlaying),
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: IpodGradients.splitPreviewFor(context),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Spacer(flex: (currentMetadata != null) ? 2 : 1),
              const Icon(
                CupertinoIcons.music_note_2,
                size: 65,
                color: AppPalette.previewForeground,
              ),
              const Spacer(),
              if (currentMetadata != null) ...[
                MarqueeText(
                  currentMetadata.getTrackName,
                  key: ValueKey(currentMetadata.identity),
                  textAlign: TextAlign.center,
                  style: IpodTypography.menu.copyWith(
                    color: AppPalette.previewForeground,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  currentMetadata.getTrackArtistNames ??
                      context.localization.unknownArtist,
                  maxLines: 1,
                  style: IpodTypography.metadata.copyWith(
                    color: AppPalette.previewForeground,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  currentMetadata.getAlbumName,
                  maxLines: 1,
                  style: IpodTypography.metadata.copyWith(
                    color: AppPalette.previewForeground,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
