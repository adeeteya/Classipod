import 'dart:async';
import 'dart:math' as math;

import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/core/theme/ipod_gradients.dart';
import 'package:classipod/core/widgets/subtle_reflection.dart';
import 'package:classipod/features/device/models/device_action.dart';
import 'package:classipod/features/device/services/device_buttons_service_provider.dart';
import 'package:classipod/features/now_playing/provider/now_playing_details_provider.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScrubberController {
  _ScrubberBarState? _state;

  int? get position => _state?.position;
  bool get isInteracting => _state?.isInteracting ?? false;

  void step(int delta) => _state?._step(delta);
  Future<bool> commit() => _state?._commit() ?? Future.value(false);
}

class ScrubberBar extends ConsumerStatefulWidget {
  final double max;
  final double value;
  final bool active;
  final ScrubberController? controller;
  final VoidCallback? onChanged;

  const ScrubberBar({
    super.key,
    required this.max,
    required this.value,
    this.active = false,
    this.controller,
    this.onChanged,
  });

  @override
  ConsumerState<ScrubberBar> createState() => _ScrubberBarState();
}

class _ScrubberBarState extends ConsumerState<ScrubberBar> {
  Timer? _timer;
  int? _target;
  int? _origin;
  int? _committing;
  Future<void>? _seek;
  bool _changed = false;
  bool _holding = false;
  int _revision = 0;

  int? get position => _target ?? _committing;
  bool get isInteracting =>
      widget.active && (ref.read(clickWheelGestureProvider) || _holding);

  @override
  void initState() {
    super.initState();
    widget.controller?._state = this;
  }

  @override
  void didUpdateWidget(ScrubberBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller?._state = null;
      widget.controller?._state = this;
    }
    if (oldWidget.active != widget.active) _reset();
  }

  void _reset() {
    _timer?.cancel();
    _revision++;
    _target = _origin = _committing = null;
    _changed = _holding = false;
  }

  void _notify() {
    setState(() {});
    widget.onChanged?.call();
  }

  void _step(int delta) => _preview(
    (position ??
            ref.read(libraryAudioHandlerProvider).displayPosition.inSeconds) +
        delta,
  );

  void _preview(int target) {
    if (!widget.active || !widget.max.isFinite || widget.max <= 0) return;
    _origin ??=
        _committing ??
        ref.read(libraryAudioHandlerProvider).displayPosition.inSeconds;
    _target = target.clamp(0, widget.max.floor());
    _revision++;
    _notify();
    _schedule();
  }

  void _schedule() {
    _timer?.cancel();
    if (_target == null || isInteracting) return;
    _timer = Timer(const Duration(seconds: 1), () {
      unawaited(_commit(automatic: true));
    });
  }

  Future<bool> _commit({bool automatic = false}) async {
    _timer?.cancel();
    final revision = _revision;
    await _seek;
    if (!mounted ||
        !widget.active ||
        ModalRoute.of(context)?.isCurrent != true) {
      return false;
    }
    if (automatic && (revision != _revision || isInteracting)) return _changed;
    final target = _target;
    if (target == null) return _changed;
    final changed = target != _origin;
    _target = _origin = null;
    if (!changed) {
      _notify();
      return _changed;
    }
    _changed = true;
    _committing = target;
    _notify();
    final seek = ref
        .read(audioPlayerServiceProvider.notifier)
        .seekToDuration(target);
    _seek = seek;
    try {
      await seek;
    } finally {
      if (identical(_seek, seek)) {
        _seek = null;
        _committing = null;
        if (mounted) _notify();
      }
    }
    return _changed;
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.controller?._state = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(clickWheelGestureProvider, (_, active) {
      if (!widget.active) return;
      if (active) {
        _revision++;
        _timer?.cancel();
      } else {
        _schedule();
      }
      _notify();
    });
    ref.listen(
      nowPlayingDetailsProvider.select(
        (details) => (details.currentMetadata?.identity, details.currentIndex),
      ),
      (_, _) {
        _reset();
        _notify();
      },
    );
    ref.listen(deviceButtonsServiceProvider, (_, action) {
      if (!widget.active) return;
      if (action == DeviceAction.seekForwardLongPress ||
          action == DeviceAction.seekBackwardLongPress) {
        _holding = true;
        _revision++;
        _timer?.cancel();
      } else if (action == DeviceAction.longPressEnd) {
        _holding = false;
        _schedule();
      } else if (action == DeviceAction.menu ||
          action == DeviceAction.selectLongPress ||
          action == DeviceAction.seekForward ||
          action == DeviceAction.seekBackward) {
        _reset();
        _notify();
      }
    });
    final max = widget.max;
    final value = position?.toDouble() ?? widget.value;
    final isDarkTheme =
        CupertinoTheme.of(context).brightness == Brightness.dark;
    final gradient = isDarkTheme
        ? IpodGradients.darkSliderTrack
        : IpodGradients.sliderTrack;
    final borderColor = isDarkTheme
        ? AppPalette.darkSliderBorderColor
        : AppPalette.sliderBorderColor;
    final hasDuration = max.isFinite && max > 0;
    final progress = hasDuration && value.isFinite
        ? (value / max).clamp(0.0, 1.0)
        : 0.0;
    const markerSize = 12.5;
    const trackHeight = 20.0;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTapUp: !hasDuration
                  ? null
                  : (tapUpDetails) {
                      final fraction =
                          (tapUpDetails.localPosition.dx / constraints.maxWidth)
                              .clamp(0.0, 1.0);
                      _preview((fraction * max).floor());
                    },
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  SizedBox(
                    height: trackHeight,
                    width: constraints.maxWidth,
                    child: DecoratedBox(
                      decoration: BoxDecoration(gradient: gradient),
                    ),
                  ),
                  SubtleReflection(
                    height: trackHeight,
                    child: SizedBox(
                      height: trackHeight,
                      width: constraints.maxWidth,
                      child: ClipRect(
                        child: Stack(
                          children: [
                            Positioned(
                              top: (trackHeight - markerSize) / 2,
                              left:
                                  progress * constraints.maxWidth -
                                  markerSize / 2,
                              child: Transform.rotate(
                                angle: math.pi / 4,
                                child: const SizedBox(
                                  height: markerSize,
                                  width: markerSize,
                                  child: ColoredBox(
                                    color:
                                        AppPalette.nowProgressBarGradientColor8,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: IgnorePointer(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(color: borderColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
