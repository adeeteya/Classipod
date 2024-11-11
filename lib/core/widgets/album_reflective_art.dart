import 'dart:io';

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
                  : AssetImage("assets/images/default_album_cover.jpeg"),
              errorBuilder: (_, __, ___) => Image.asset(
                "assets/images/default_album_cover.jpeg",
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
                filterQuality: FilterQuality.low,
                child: Image(
                  image: (thumbnailPath != null)
                      ? FileImage(File(thumbnailPath!))
                      : AssetImage("assets/images/default_album_cover.jpeg"),
                  errorBuilder: (_, __, ___) => Image.asset(
                    "assets/images/default_album_cover.jpeg",
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
                      strokeAlign: -1,
                    ),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      CupertinoColors.white.withOpacity(0.4),
                      CupertinoColors.white.withOpacity(1),
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
