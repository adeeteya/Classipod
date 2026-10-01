import 'dart:async';

import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter/foundation.dart';

class FastScrollIndicator extends StatefulWidget {
  const FastScrollIndicator({
    super.key,
    required this.wheelScrollIndex,
    required this.itemCount,
    required this.itemExtent,
    required this.labelAt,
    required this.child,
  });

  final ValueListenable<int> wheelScrollIndex;
  final int itemCount;
  final double itemExtent;
  final String Function(int index) labelAt;
  final Widget child;

  @override
  State<FastScrollIndicator> createState() => _FastScrollIndicatorState();
}

class _FastScrollIndicatorState extends State<FastScrollIndicator> {
  Timer? _movementWindow;
  Timer? _hideTimer;
  double _distance = 0;
  String? _label;

  @override
  void initState() {
    super.initState();
    widget.wheelScrollIndex.addListener(_onWheelScroll);
  }

  @override
  void didUpdateWidget(FastScrollIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.wheelScrollIndex != widget.wheelScrollIndex) {
      oldWidget.wheelScrollIndex.removeListener(_onWheelScroll);
      widget.wheelScrollIndex.addListener(_onWheelScroll);
    }
  }

  void _onWheelScroll() {
    _recordMovement(1, widget.wheelScrollIndex.value);
  }

  void _recordMovement(double rows, int index) {
    if (rows == 0 || widget.itemCount == 0) return;
    _movementWindow ??= Timer(const Duration(milliseconds: 200), () {
      _distance = 0;
      _movementWindow = null;
    });
    _distance += rows;
    final isFast = _distance >= 12;
    if (!isFast && _label == null) return;

    final title = widget
        .labelAt(index.clamp(0, widget.itemCount - 1))
        .trimLeft();
    final initial = title.characters.firstOrNull ?? '';
    final label = RegExp(r'^\d$').hasMatch(initial)
        ? '123'
        : initial.toUpperCase();
    setState(() => _label = label.isEmpty ? null : label);
    if (!isFast) return;
    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(milliseconds: 650), () {
      setState(() => _label = null);
    });
  }

  bool _onScroll(ScrollNotification notification) {
    if (notification.depth == 0 &&
        notification is ScrollUpdateNotification &&
        notification.metrics.axis == Axis.vertical &&
        Scrollable.maybeOf(notification.context!)
                ?.position
                .isScrollingNotifier
                .value ==
            true) {
      _recordMovement(
        (notification.scrollDelta ?? 0).abs() / widget.itemExtent,
        (notification.metrics.pixels.clamp(
                  0,
                  notification.metrics.maxScrollExtent,
                ) /
                widget.itemExtent)
            .floor(),
      );
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    return NotificationListener<ScrollNotification>(
      onNotification: _onScroll,
      child: Stack(
        fit: StackFit.expand,
        children: [
          widget.child,
          if (_label != null)
            Center(
              child: IgnorePointer(
                child: Container(
                  width: 72,
                  height: 72,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isDark
                        ? CupertinoColors.white
                        : CupertinoColors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    _label!,
                    key: const ValueKey('fast-scroll-letter'),
                    style: TextStyle(
                      color: isDark
                          ? CupertinoColors.black
                          : CupertinoColors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    widget.wheelScrollIndex.removeListener(_onWheelScroll);
    _movementWindow?.cancel();
    _hideTimer?.cancel();
    super.dispose();
  }
}
