import 'dart:io';
import 'dart:math';

import 'package:classipod/core/constants/assets.dart';
import 'package:flutter/cupertino.dart';

class AlbumReflectiveArt extends StatefulWidget {
  final String? thumbnailPath;
  final bool isOnDevice;
  final double reflectedImageHeight;
  final double? imageWidth;
  final String heroTag;
  final bool tiltedImage;

  const AlbumReflectiveArt({
    super.key,
    this.thumbnailPath,
    this.isOnDevice = true,
    this.reflectedImageHeight = 50,
    this.imageWidth,
    required this.heroTag,
    this.tiltedImage = false,
  });

  @override
  State<AlbumReflectiveArt> createState() => _AlbumReflectiveArtState();
}

class _AlbumReflectiveArtState extends State<AlbumReflectiveArt>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..forward();
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late final Matrix4 transform;
    if (widget.tiltedImage) {
      transform =
          Matrix4.identity()
            ..setEntry(3, 2, 0.003)
            ..rotateY(-0.12);
    } else {
      transform = Matrix4.identity();
    }

    return Hero(
      tag: widget.heroTag,
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
            if (animation.value < 0.01 || animation.value > 0.999) {
              _controller.forward();
            } else if (animation.isAnimating) {
              _controller.reset();
            }
            return Transform(
              transform: Matrix4.identity()..rotateY(animation.value * pi),
              alignment: Alignment.center,
              child:
                  (animation.value > 0.5)
                      ? Transform.flip(flipX: true, child: destinationWidget)
                      : child,
            );
          },
          child: sourceWidget,
        );
      },
      child: Transform(
        transform: transform,
        child: Column(
          children: [
            Flexible(
              child: Image(
                image:
                    (widget.thumbnailPath != null)
                        ? widget.isOnDevice
                            ? FileImage(File(widget.thumbnailPath!))
                            : NetworkImage(widget.thumbnailPath!)
                        : const AssetImage(Assets.defaultAlbumCoverImage),
                errorBuilder:
                    (_, _, _) => Image.asset(
                      Assets.defaultAlbumCoverImage,
                      height: widget.imageWidth,
                      width: widget.imageWidth ?? double.infinity,
                      fit:
                          (widget.imageWidth == null)
                              ? BoxFit.fitWidth
                              : BoxFit.scaleDown,
                    ),
                height: widget.imageWidth,
                width: widget.imageWidth ?? double.infinity,
                fit:
                    (widget.imageWidth == null)
                        ? BoxFit.fitWidth
                        : BoxFit.scaleDown,
              ),
            ),
            FadeTransition(
              opacity: _animation,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  Transform.flip(
                    flipY: true,
                    child: Image(
                      image:
                          (widget.thumbnailPath != null)
                              ? widget.isOnDevice
                                  ? FileImage(File(widget.thumbnailPath!))
                                  : NetworkImage(widget.thumbnailPath!)
                              : const AssetImage(Assets.defaultAlbumCoverImage),
                      errorBuilder:
                          (_, _, _) => Image.asset(
                            Assets.defaultAlbumCoverImage,
                            height: widget.reflectedImageHeight,
                            width:
                                widget.imageWidth != null
                                    ? (widget.imageWidth! -
                                        widget.reflectedImageHeight)
                                    : double.infinity,
                            alignment: Alignment.bottomCenter,
                            fit: BoxFit.fitWidth,
                          ),
                      height: widget.reflectedImageHeight,
                      width:
                          widget.imageWidth != null
                              ? (widget.imageWidth! -
                                  widget.reflectedImageHeight)
                              : double.infinity,
                      alignment: Alignment.bottomCenter,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(
                    height: widget.reflectedImageHeight,
                    width:
                        widget.imageWidth != null
                            ? (widget.imageWidth! - widget.reflectedImageHeight)
                            : double.infinity,
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
            ),
          ],
        ),
      ),
    );
  }
}
