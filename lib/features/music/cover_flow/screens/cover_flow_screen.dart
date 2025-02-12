import 'dart:async';

import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/widgets/empty_state_widget.dart';
import 'package:classipod/features/custom_screen_elements/custom_page_screen.dart';
import 'package:classipod/features/music/album/models/album_model.dart';
import 'package:classipod/features/music/album/providers/album_details_provider.dart';
import 'package:classipod/features/now_playing/widgets/album_reflective_art.dart';
import 'package:classipod/features/status_bar/widgets/status_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CoverFlowScreen extends ConsumerStatefulWidget {
  const CoverFlowScreen({super.key});

  @override
  ConsumerState createState() => _CoverFlowScreenState();
}

class _CoverFlowScreenState extends ConsumerState<CoverFlowScreen>
    with CustomPageScreen {
  @override
  String get routeName => Routes.coverFlow.name;

  @override
  double get viewPortFraction => 0.58;

  @override
  List<AlbumModel> get displayItems => ref.read(albumDetailsProvider);

  @override
  void onSelectPressed() => _chooseAlbum(selectedDisplayItem);

  void _chooseAlbum(int index) {
    final albumDetail = ref.read(albumDetailsProvider).elementAt(index);
    unawaited(
      context.pushNamed(
        Routes.coverFlowSelection.name,
        extra: albumDetail,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (displayItems.isEmpty) {
      return CupertinoPageScaffold(
        child: Column(
          children: [
            StatusBar(title: Routes.coverFlow.title(context)),
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
          StatusBar(
            title: Routes.coverFlow.title(context),
          ),
          const SizedBox(height: 10),
          Flexible(
            child: PageView.builder(
              controller: pageController,
              itemCount: displayItems.length,
              itemBuilder: (context, index) {
                final double relativePosition = index - currentPage;
                return GestureDetector(
                  onTap:
                      relativePosition == 0 ? () => _chooseAlbum(index) : null,
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.003)
                      ..scale(
                        (1 - relativePosition.abs()).clamp(0.2, 0.6) + 0.4,
                      )
                      ..rotateY(relativePosition),
                    alignment: relativePosition >= 0
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: AlbumReflectiveArt(
                      thumbnailPath: displayItems[index].albumArtPath,
                      heroTag:
                          "${displayItems[index].albumName}-${displayItems[index].albumArtistName}",
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              displayItems[selectedDisplayItem].albumName,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              displayItems[selectedDisplayItem].albumArtistName,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
