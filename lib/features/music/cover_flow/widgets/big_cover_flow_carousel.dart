import 'package:classipod/features/music/album/models/album_model.dart';
import 'package:classipod/features/now_playing/widgets/album_reflective_art.dart';
import 'package:flutter/widgets.dart';

class BigCoverFlowCarousel extends StatelessWidget {
  const BigCoverFlowCarousel({
    super.key,
    required this.controller,
    required this.currentPage,
    required this.albums,
    required this.onSelect,
  });

  final PageController controller;
  final double currentPage;
  final List<AlbumModel> albums;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: PageView.builder(
        controller: controller,
        itemCount: albums.length,
        itemBuilder: (context, index) {
          final double relativePosition = index - currentPage;
          return GestureDetector(
            onTap: relativePosition == 0
                ? () => onSelect(index)
                : () async => controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  ),
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.003)
                ..scaleByDouble(
                  (1 - relativePosition.abs()).clamp(0.2, 0.6) + 0.4,
                  (1 - relativePosition.abs()).clamp(0.2, 0.6) + 0.4,
                  (1 - relativePosition.abs()).clamp(0.2, 0.6) + 0.4,
                  1,
                )
                ..rotateY(relativePosition * 0.9),
              alignment: relativePosition >= 0
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: AlbumReflectiveArt(
                imageWidth: 180,
                thumbnailPath: albums[index].albumArtPath,
                isOnDevice: albums[index].isOnDevice(),
                heroTag:
                    "${albums[index].albumName}-${albums[index].albumArtistName}",
              ),
            ),
          );
        },
      ),
    );
  }
}
