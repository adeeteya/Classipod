import 'dart:io';

import 'package:classipod/core/constants/assets.dart';
import 'package:flutter/cupertino.dart';

class AlbumReflectiveArt extends StatelessWidget {
  final String? thumbnailPath;
  final double reflectedImageHeight;
  final String? heroTag;
  const AlbumReflectiveArt({
    super.key,
    this.thumbnailPath,
    required this.reflectedImageHeight,
    this.heroTag,
  });

  Widget _buildImage() {
    return SizedBox(
      width: double.infinity,
      child: Image(
        image: (thumbnailPath != null)
            ? FileImage(File(thumbnailPath!))
            : const AssetImage(Assets.defaultAlbumCoverImage),
        errorBuilder: (_, __, ___) => Image.asset(
          Assets.defaultAlbumCoverImage,
          fit: BoxFit.fitWidth,
        ),
        fit: BoxFit.fitWidth,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Hero(
            tag: heroTag ?? thumbnailPath!,
            child: _buildImage(),
          ),
        ),
        Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Transform.flip(
                flipY: true,
                child: Image(
                  image: (thumbnailPath != null)
                      ? FileImage(File(thumbnailPath!))
                      : const AssetImage(
                          Assets.defaultAlbumCoverImage,
                        ),
                  errorBuilder: (_, __, ___) => Image.asset(
                    Assets.defaultAlbumCoverImage,
                    height: reflectedImageHeight,
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.fitWidth,
                  ),
                  height: reflectedImageHeight,
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SizedBox(
              height: reflectedImageHeight,
              width: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: const Border(
                    left: BorderSide(
                      color: CupertinoColors.white,
                      width: 0,
                    ),
                    right: BorderSide(
                      color: CupertinoColors.white,
                      width: 0,
                    ),
                    bottom: BorderSide(
                      color: CupertinoColors.white,
                      width: 0,
                    ),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      CupertinoColors.white.withValues(alpha: 0.4),
                      CupertinoColors.white,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
