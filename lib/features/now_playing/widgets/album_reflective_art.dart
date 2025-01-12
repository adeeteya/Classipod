import 'dart:io';

import 'package:classipod/core/constants/assets.dart';
import 'package:flutter/cupertino.dart';

class AlbumReflectiveArt extends StatelessWidget {
  final String? thumbnailPath;
  const AlbumReflectiveArt({super.key, this.thumbnailPath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: SizedBox(
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
                    height: 50,
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.fitWidth,
                  ),
                  height: 50,
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SizedBox(
              height: 50,
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
