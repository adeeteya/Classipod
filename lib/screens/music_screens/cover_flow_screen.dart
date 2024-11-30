import 'package:classipod/core/custom_page_screen.dart';
import 'package:classipod/core/routes.dart';
import 'package:classipod/core/widgets/album_reflective_art.dart';
import 'package:classipod/models/album_details.dart';
import 'package:classipod/providers/music_provider.dart';
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
  List<AlbumDetails> get displayItems =>
      ref.read(musicProvider.notifier).albumDetails;

  @override
  void onSelectPressed() {
    ref.read(musicProvider.notifier).getCoverFlowAlbumDetails(ref
        .read(musicProvider.notifier)
        .albumNames
        .elementAt(selectedDisplayItem));
    context.goNamed(Routes.coverFlowSelection.name);
  }

  @override
  Widget build(BuildContext context) {
    if (displayItems.isEmpty) {
      return const CupertinoPageScaffold(
        child: Center(
          child: Text("No Music Files Present from the Selected Directory☹️"),
        ),
      );
    }

    return CupertinoPageScaffold(
      child: Column(
        children: [
          const SizedBox(height: 10),
          Flexible(
            child: PageView.builder(
              controller: pageController,
              itemCount: displayItems.length,
              itemBuilder: (context, index) {
                double relativePosition = index - currentPage;
                return Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.003)
                    ..scale((1 - relativePosition.abs()).clamp(0.2, 0.6) + 0.4)
                    ..rotateY(relativePosition),
                  alignment: relativePosition >= 0
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: AlbumReflectiveArt(
                    thumbnailPath: displayItems[index].thumbnailPath,
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
                fontSize: 20,
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
                fontSize: 20,
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
