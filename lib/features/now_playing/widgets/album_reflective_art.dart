import 'dart:io';
import 'dart:math';

import 'package:classipod/core/constants/assets.dart';
import 'package:flutter/cupertino.dart';

class AlbumReflectiveArt extends StatelessWidget {
  final String? thumbnailPath;
  final bool isOnDevice;
  final double reflectedImageHeight;
  final double? imageWidth;
  final String heroTag;

  const AlbumReflectiveArt({
    super.key,
    this.thumbnailPath,
    this.isOnDevice = true,
    this.reflectedImageHeight = 50,
    this.imageWidth,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Hero(
            tag: heroTag,
            flightShuttleBuilder: (
              flightContext,
              animation,
              flightDirection,
              fromHeroContext,
              toHeroContext,
            ) {
              late final Widget sourceWidget;
              late final Widget destinationWidget;
              switch (flightDirection) {
                case HeroFlightDirection.push:
                  sourceWidget = fromHeroContext.widget;
                  destinationWidget = toHeroContext.widget;
                case HeroFlightDirection.pop:
                  sourceWidget = toHeroContext.widget;
                  destinationWidget = fromHeroContext.widget;
              }
              return AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return Transform(
                    transform:
                        Matrix4.identity()..rotateY(animation.value * pi),
                    alignment: Alignment.center,
                    child:
                        (animation.value > 0.5)
                            ? Transform.flip(
                              flipX: true,
                              child: destinationWidget,
                            )
                            : child,
                  );
                },
                child: sourceWidget,
              );
            },
            child: Image(
              image:
                  (thumbnailPath != null)
                      ? isOnDevice
                          ? FileImage(File(thumbnailPath!))
                          : NetworkImage(thumbnailPath!)
                      : const AssetImage(Assets.defaultAlbumCoverImage),
              errorBuilder:
                  (_, __, ___) => Image.asset(
                    Assets.defaultAlbumCoverImage,
                    height: imageWidth,
                    width: imageWidth ?? double.infinity,
                    fit:
                        (imageWidth == null)
                            ? BoxFit.fitWidth
                            : BoxFit.scaleDown,
                  ),
              height: imageWidth,
              width: imageWidth ?? double.infinity,
              fit: (imageWidth == null) ? BoxFit.fitWidth : BoxFit.scaleDown,
            ),
          ),
        ),
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            Transform.flip(
              flipY: true,
              child: Image(
                image:
                    (thumbnailPath != null)
                        ? isOnDevice
                            ? FileImage(File(thumbnailPath!))
                            : NetworkImage(thumbnailPath!)
                        : const AssetImage(Assets.defaultAlbumCoverImage),
                errorBuilder:
                    (_, __, ___) => Image.asset(
                      Assets.defaultAlbumCoverImage,
                      height: reflectedImageHeight,
                      width:
                          imageWidth != null
                              ? (imageWidth! - reflectedImageHeight)
                              : double.infinity,
                      alignment: Alignment.bottomCenter,
                      fit: BoxFit.fitWidth,
                    ),
                height: reflectedImageHeight,
                width:
                    imageWidth != null
                        ? (imageWidth! - reflectedImageHeight)
                        : double.infinity,
                alignment: Alignment.bottomCenter,
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              height: reflectedImageHeight,
              width:
                  imageWidth != null
                      ? (imageWidth! - reflectedImageHeight)
                      : double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: const Border(
                    left: BorderSide(color: CupertinoColors.white, width: 0),
                    right: BorderSide(color: CupertinoColors.white, width: 0),
                    bottom: BorderSide(color: CupertinoColors.white, width: 0),
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
