import 'package:classipod/features/menu/models/split_screen_type.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

class SplitScreenPreviewTransition extends StatefulWidget {
  final SplitScreenType type;
  final Widget child;

  const SplitScreenPreviewTransition({
    super.key,
    required this.type,
    required this.child,
  });

  @override
  State<SplitScreenPreviewTransition> createState() =>
      _SplitScreenPreviewTransitionState();
}

class _SplitScreenPreviewTransitionState
    extends State<SplitScreenPreviewTransition>
    with SingleTickerProviderStateMixin {
  static const _duration = Duration(milliseconds: 150);
  late final AnimationController _albumController;
  late final Animation<Offset> _albumPosition;
  Widget? _background;
  Widget? _albumArt;

  @override
  void initState() {
    super.initState();
    final isAlbumArt = widget.type == SplitScreenType.albumArt;
    _albumController = AnimationController(
      vsync: this,
      duration: _duration,
      value: isAlbumArt ? 1 : 0,
    );
    _albumPosition = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(_albumController);
    _updatePreview();
  }

  void _updatePreview() {
    if (widget.type == SplitScreenType.albumArt) {
      _albumArt = widget.child;
    } else {
      _background = KeyedSubtree(
        key: ValueKey(widget.type),
        child: SizedBox.expand(child: widget.child),
      );
    }
  }

  @override
  void didUpdateWidget(covariant SplitScreenPreviewTransition oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updatePreview();
    if (widget.type == oldWidget.type) return;
    if (widget.type == SplitScreenType.albumArt) {
      _albumController.forward();
    } else {
      _albumController.reverse();
    }
  }

  @override
  void dispose() {
    _albumController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Stack(
        fit: StackFit.expand,
        children: [
          _background ?? const SizedBox.shrink(),
          AnimatedBuilder(
            animation: _albumController,
            builder: (context, child) {
              if (_albumController.isDismissed) {
                return const SizedBox.shrink();
              }
              return SlideTransition(
                position: _albumPosition,
                child: ColoredBox(
                  color: CupertinoTheme.of(context).scaffoldBackgroundColor,
                  child: _albumArt,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
