import 'dart:async';

import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/theme/ipod_typography.dart';
import 'package:classipod/core/widgets/empty_state_widget.dart';
import 'package:classipod/features/custom_screen_elements/custom_page_screen.dart';
import 'package:classipod/features/music/album/models/album_model.dart';
import 'package:classipod/features/music/album/providers/album_details_provider.dart';
import 'package:classipod/features/music/cover_flow/widgets/big_cover_flow_carousel.dart';
import 'package:classipod/features/music/cover_flow/widgets/cover_flow_carousel.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:classipod/features/settings/models/cover_flow_appearance.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CoverFlowScreen extends ConsumerWidget {
  const CoverFlowScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appearance = ref.watch(
      settingsPreferencesControllerProvider.select(
        (settings) => settings.coverFlowAppearance,
      ),
    );
    return _CoverFlowView(key: ValueKey(appearance), appearance: appearance);
  }
}

class _CoverFlowView extends ConsumerStatefulWidget {
  const _CoverFlowView({super.key, required this.appearance});

  final CoverFlowAppearance appearance;

  @override
  ConsumerState createState() => _CoverFlowScreenState();
}

class _CoverFlowScreenState extends ConsumerState<_CoverFlowView>
    with CustomPageScreen {
  @override
  String get routeName => Routes.coverFlow.name;

  @override
  double get viewPortFraction =>
      widget.appearance == CoverFlowAppearance.big ? 0.54 : 0.14;

  @override
  List<AlbumModel> get displayItems => ref.read(albumDetailsProvider);

  @override
  void onSelectPressed() => _chooseAlbum(selectedDisplayItem);

  void _chooseAlbum(int index) {
    final albumDetail = ref.read(albumDetailsProvider).elementAt(index);
    unawaited(
      context.pushNamed(Routes.coverFlowSelection.name, extra: albumDetail),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(albumDetailsProvider);
    if (displayItems.isEmpty) {
      return CupertinoPageScaffold(
        child: Column(
          children: [
            Expanded(
              child: EmptyStateWidget(
                emptyDescription: context.localization.noMusicFilesFound,
              ),
            ),
          ],
        ),
      );
    }

    return CupertinoPageScaffold(
      child: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                if (widget.appearance == CoverFlowAppearance.big)
                  BigCoverFlowCarousel(
                    controller: pageController,
                    currentPage: currentPage,
                    albums: displayItems,
                    onSelect: _chooseAlbum,
                  )
                else
                  Positioned.fill(
                    bottom: 55,
                    child: CoverFlowCarousel(
                      controller: pageController,
                      currentPage: currentPage,
                      albums: displayItems,
                      onSelect: _chooseAlbum,
                    ),
                  ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Text(
                          displayItems[selectedDisplayItem].albumName,
                          maxLines: 1,
                          style: IpodTypography.metadata.copyWith(
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          displayItems[selectedDisplayItem].albumArtistName,
                          maxLines: 1,
                          style: IpodTypography.metadata.copyWith(
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
