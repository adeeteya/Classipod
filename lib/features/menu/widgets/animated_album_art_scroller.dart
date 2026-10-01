import 'dart:async';
import 'dart:math';

import 'package:classipod/core/constants/assets.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/widgets/artwork_image.dart';
import 'package:classipod/core/widgets/empty_state_widget.dart';
import 'package:classipod/features/menu/models/split_screen_type.dart';
import 'package:classipod/features/music/album/providers/album_details_provider.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimatedAlbumArtScroller extends ConsumerStatefulWidget {
  const AnimatedAlbumArtScroller({super.key});

  @override
  ConsumerState createState() => _AnimatedAlbumArtScrollerState();
}

class _AnimatedAlbumArtScrollerState
    extends ConsumerState<AnimatedAlbumArtScroller>
    with SingleTickerProviderStateMixin {
  String? _albumArtPath;
  late final AnimationController _animationController;
  late Animation<Alignment> _alignmentAnimation;
  final Random _random = Random();
  int? _directionIndex;
  static const _displayDuration = Duration(seconds: 7);
  static const _directions = [
    (Alignment.topLeft, Alignment.bottomRight),
    (Alignment.centerRight, Alignment.centerLeft),
    (Alignment.topCenter, Alignment.bottomCenter),
    (Alignment.bottomCenter, Alignment.topCenter),
    (Alignment.bottomLeft, Alignment.topRight),
    (Alignment.centerLeft, Alignment.centerRight),
    (Alignment.topRight, Alignment.bottomLeft),
    (Alignment.bottomRight, Alignment.topLeft),
  ];
  bool _isEmptyState = false;

  void _getRandomAlbumArt() {
    final albumDetails = ref.read(albumDetailsProvider);
    if (albumDetails.isEmpty) {
      setState(() {
        _isEmptyState = true;
      });
      return;
    }

    final albumsWithArtwork = albumDetails.where((album) {
      final albumArtPath = album.albumArtPath;
      if (albumArtPath == null) {
        return false;
      }
      return true;
    }).toList();

    setState(() {
      _isEmptyState = false;
      if (albumsWithArtwork.isEmpty) {
        _albumArtPath = null;
      } else {
        final otherAlbums = albumsWithArtwork
            .where((album) => album.albumArtPath != _albumArtPath)
            .toList();
        final candidates = otherAlbums.isEmpty
            ? albumsWithArtwork
            : otherAlbums;
        final randomAlbum = candidates[_random.nextInt(candidates.length)];
        _albumArtPath = randomAlbum.albumArtPath;
      }
    });
  }

  void _setRandomAnimationDirection() {
    final previousIndex = _directionIndex;
    var nextIndex = _random.nextInt(
      _directions.length - (previousIndex == null ? 0 : 1),
    );
    if (previousIndex != null && nextIndex >= previousIndex) {
      nextIndex++;
    }
    _directionIndex = nextIndex;
    final (begin, end) = _directions[nextIndex];
    _alignmentAnimation = Tween<Alignment>(
      begin: begin,
      end: Alignment.lerp(begin, end, 0.35),
    ).animate(_animationController);
  }

  void _repeatAnimation(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _setRandomAnimationDirection();
      _getRandomAlbumArt();
      if (!_isEmptyState) {
        unawaited(_animationController.forward(from: 0));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _getRandomAlbumArt();
    _animationController = AnimationController(
      vsync: this,
      duration: _displayDuration,
    );
    _setRandomAnimationDirection();
    _animationController.addStatusListener(_repeatAnimation);
    if (!_isEmptyState) unawaited(_animationController.forward());
    ref.listenManual(albumDetailsProvider, (_, albums) {
      _getRandomAlbumArt();
      if (albums.isEmpty) {
        _animationController.stop();
      } else {
        _setRandomAnimationDirection();
        unawaited(_animationController.forward(from: 0));
      }
    });
  }

  @override
  void dispose() {
    _animationController.removeStatusListener(_repeatAnimation);
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isEmptyState) {
      return EmptyStateWidget(
        emptyDescription: context.localization.noMusicFilesFound,
      );
    }

    return RepaintBoundary(
      key: const ValueKey(SplitScreenType.albumArt),
      child: AnimatedAlbumArt(
        animation: _alignmentAnimation,
        child: AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          child: Image(
            key: ValueKey(_albumArtPath),
            image: artworkImage(ref, _albumArtPath),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                Assets.defaultAlbumCoverImage,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              );
            },
          ),
        ),
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
    return SizedBox(
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: 1 / 2,
        child: ClipRect(
          child: Transform.scale(
            scale: 1.5,
            alignment: animation.value,
            child: SizedBox.expand(child: child),
          ),
        ),
      ),
    );
  }
}
