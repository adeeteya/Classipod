import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/widgets/empty_state_widget.dart';
import 'package:classipod/features/custom_screen_widgets/custom_page_screen.dart';
import 'package:classipod/features/music/album/album_details.dart';
import 'package:classipod/features/music/album/album_details_provider.dart';
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
  List<AlbumDetails> get displayItems => ref.read(albumDetailsProvider);

  @override
  void onSelectPressed() => _chooseAlbum(selectedDisplayItem);

  void _chooseAlbum(int index) {
    final albumDetails = ref.read(albumDetailsProvider).elementAt(index);
    context.goNamed(
      Routes.coverFlowSelection.name,
      queryParameters: {
        'albumName': albumDetails.albumName,
        'artistName': albumDetails.albumArtistName,
      },
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

    final size = MediaQuery.sizeOf(context);
    late final double fontSize;
    late final double reflectedImageHeight;
    if (size.height < 800) {
      fontSize = 14;
      reflectedImageHeight = 30;
    } else {
      fontSize = 18;
      reflectedImageHeight = 40;
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
                      thumbnailPath: displayItems[index].thumbnailPath,
                      reflectedImageHeight: reflectedImageHeight,
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
              style: TextStyle(
                fontSize: fontSize,
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
              style: TextStyle(
                fontSize: fontSize,
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
