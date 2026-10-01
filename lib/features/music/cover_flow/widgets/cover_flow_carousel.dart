import 'dart:math' as math;

import 'package:classipod/features/music/album/models/album_model.dart';
import 'package:classipod/features/music/cover_flow/cover_flow_motion.dart';
import 'package:classipod/features/now_playing/widgets/album_reflective_art.dart';
import 'package:flutter/widgets.dart';

class CoverFlowCarousel extends StatelessWidget {
  const CoverFlowCarousel({
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

  double _offset(double position, double width) {
    final distance = position.abs();
    return position.sign *
        width *
        (0.25 * distance.clamp(0, 1) + 0.085 * (distance - 1).clamp(0, 3));
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final size = math.min(width * 0.34, constraints.maxHeight / 1.3);
        final reflection = size * 0.25;
        final indices =
            [
              for (
                var index = math.max(0, currentPage.floor() - 3);
                index <= math.min(albums.length - 1, currentPage.ceil() + 3);
                index++
              )
                if ((index - currentPage).abs() < 4) index,
            ]..sort((a, b) {
              return (b - currentPage).abs().compareTo((a - currentPage).abs());
            });

        return Stack(
          children: [
            for (final index in indices)
              Positioned(
                key: ValueKey('cover-flow-$index'),
                left: (width - size) / 2 + _offset(index - currentPage, width),
                top: (constraints.maxHeight - size - reflection) / 2,
                width: size,
                height: size + reflection,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: (4 - (index - currentPage).abs()).clamp(0, 1),
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.35 / size)
                        ..scaleByDouble(
                          1 - 0.22 * (index - currentPage).abs().clamp(0, 1),
                          1 - 0.22 * (index - currentPage).abs().clamp(0, 1),
                          1.0,
                          1.0,
                        )
                        ..rotateY((index - currentPage).clamp(-1, 1) * 0.95),
                      child: AlbumReflectiveArt(
                        imageWidth: size,
                        reflectedImageHeight: reflection,
                        thumbnailPath: albums[index].albumArtPath,
                        isOnDevice: albums[index].isOnDevice(),
                        heroTag:
                            '${albums[index].albumName}-${albums[index].albumArtistName}',
                      ),
                    ),
                  ),
                ),
              ),
            Positioned.fill(
              child: GestureDetector(
                onTapUp: (details) {
                  final x = details.localPosition.dx - width / 2;
                  final selected = currentPage.round();
                  final index = x.abs() <= size / 2
                      ? selected
                      : indices.reduce((a, b) {
                          return (_offset(a - currentPage, width) - x).abs() <
                                  (_offset(b - currentPage, width) - x).abs()
                              ? a
                              : b;
                        });
                  if (index == selected) {
                    onSelect(index);
                  } else {
                    controller.animateToPage(
                      index,
                      duration: CoverFlowMotion.duration,
                      curve: CoverFlowMotion.curve,
                    );
                  }
                },
                child: PageView.builder(
                  physics: const CoverFlowScrollPhysics(),
                  controller: controller,
                  itemCount: albums.length,
                  itemBuilder: (context, index) => const SizedBox.expand(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
