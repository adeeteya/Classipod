import 'dart:io';
import 'dart:math';

import 'package:classipod/core/constants/assets.dart';
import 'package:classipod/features/music/album/album_details_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimatedAlbumArtScroller extends ConsumerStatefulWidget {
  const AnimatedAlbumArtScroller({super.key});

  @override
  ConsumerState createState() => _AnimatedAlbumArtScrollerState();
}

class _AnimatedAlbumArtScrollerState
    extends ConsumerState<AnimatedAlbumArtScroller>
    with SingleTickerProviderStateMixin {
  ImageProvider _albumArtImage =
      const AssetImage(Assets.defaultAlbumCoverImage);
  late final AnimationController _animationController;
  late Animation<Alignment> _alignmentAnimation;
  double alignment = 0;

  void _getRandomAlbumArt() {
    final albumDetails = ref.read(albumDetailsProvider);
    final randomAlbum = albumDetails[Random().nextInt(albumDetails.length)];
    if (randomAlbum.thumbnailPath != null) {
      setState(() {
        _albumArtImage = FileImage(File(randomAlbum.thumbnailPath!));
      });
    }
  }

  void _setRandomAnimationDirection() {
    final _randomNumber = Random().nextInt(4);
    if (_randomNumber == 0) {
      _alignmentAnimation =
          Tween<Alignment>(begin: Alignment.topLeft, end: Alignment.bottomRight)
              .animate(_animationController);
    } else if (_randomNumber == 1) {
      _alignmentAnimation =
          Tween<Alignment>(begin: Alignment.topRight, end: Alignment.bottomLeft)
              .animate(_animationController);
    } else if (_randomNumber == 2) {
      _alignmentAnimation =
          Tween<Alignment>(begin: Alignment.bottomLeft, end: Alignment.topRight)
              .animate(_animationController);
    } else {
      _alignmentAnimation =
          Tween<Alignment>(begin: Alignment.bottomRight, end: Alignment.topLeft)
              .animate(_animationController);
    }
  }

  void _repeatAnimation() {
    if (_animationController.isCompleted) {
      _getRandomAlbumArt();
      _setRandomAnimationDirection();
      _animationController.repeat(count: 1);
    }
  }

  @override
  void initState() {
    super.initState();
    _getRandomAlbumArt();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
    _setRandomAnimationDirection();
    _animationController.forward();
    _animationController.addListener(_repeatAnimation);
  }

  @override
  void dispose() {
    _animationController.removeListener(_repeatAnimation);
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedAlbumArt(
      animation: _alignmentAnimation,
      child: Image(
        image: _albumArtImage,
      ),
    );
  }
}

class AnimatedAlbumArt extends AnimatedWidget {
  final Widget child;
  const AnimatedAlbumArt({
    super.key,
    required Animation<Alignment> animation,
    required this.child,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<Alignment>;
    return AspectRatio(
      aspectRatio: 1 / 2,
      child: FittedBox(
        fit: BoxFit.cover,
        clipBehavior: Clip.hardEdge,
        alignment: animation.value,
        child: Transform.scale(
          scale: 1.5,
          alignment: animation.value,
          child: child,
        ),
      ),
    );
  }
}
