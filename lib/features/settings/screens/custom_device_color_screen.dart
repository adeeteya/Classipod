import 'dart:async';

import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/features/custom_screen_elements/custom_screen.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:classipod/features/settings/widgets/selection_list_tile.dart';
import 'package:classipod/features/status_bar/widgets/status_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum _ColorChannel { hue, saturation, brightness }

/// Picks an arbitrary device colour with three sliders.
///
/// The click wheel moves between the rows as everywhere else; pressing select
/// on a slider starts adjusting it, and then the wheel changes its value until
/// select or menu is pressed again.
class CustomDeviceColorScreen extends ConsumerStatefulWidget {
  const CustomDeviceColorScreen({super.key});

  @override
  ConsumerState createState() => _CustomDeviceColorScreenState();
}

class _CustomDeviceColorScreenState extends ConsumerState with CustomScreen {
  static const double _hueStep = 4;
  static const double _unitStep = 0.02;

  /// Marks the row that clears the custom colour, which has no channel.
  static const String _presetRow = 'preset';

  late HSVColor _color;
  bool _isAdjusting = false;

  @override
  String get routeName => Routes.customDeviceColor.name;

  @override
  List<Object> get displayItems => [..._ColorChannel.values, _presetRow];

  @override
  void initState() {
    super.initState();
    final settings = ref.read(settingsPreferencesControllerProvider);
    final int? storedValue = settings.customDeviceColorValue;
    _color = HSVColor.fromColor(
      storedValue != null
          ? Color(storedValue)
          : settings.deviceColor.style.frameGradientColors.last,
    );
  }

  @override
  void scrollForward() {
    if (_isAdjusting) {
      _changeSelectedChannel(1);
      return;
    }
    super.scrollForward();
  }

  @override
  void scrollBackward() {
    if (_isAdjusting) {
      _changeSelectedChannel(-1);
      return;
    }
    super.scrollBackward();
  }

  @override
  void onMenuButtonPressed() {
    if (_isAdjusting) {
      setState(() => _isAdjusting = false);
      return;
    }
    super.onMenuButtonPressed();
  }

  @override
  Future<void> onSelectPressed() async {
    if (displayItems[selectedDisplayItem] == _presetRow) {
      await _usePresetColor();
      return;
    }
    setState(() => _isAdjusting = !_isAdjusting);
  }

  void _changeSelectedChannel(int direction) {
    final Object item = displayItems[selectedDisplayItem];
    if (item is! _ColorChannel) {
      return;
    }
    setState(() {
      switch (item) {
        case _ColorChannel.hue:
          _color = _color.withHue((_color.hue + (direction * _hueStep)) % 360);
        case _ColorChannel.saturation:
          _color = _color.withSaturation(
            (_color.saturation + (direction * _unitStep)).clamp(0.0, 1.0),
          );
        case _ColorChannel.brightness:
          _color = _color.withValue(
            (_color.value + (direction * _unitStep)).clamp(0.0, 1.0),
          );
      }
    });
    _applyColor();
  }

  void _applyColor() {
    unawaited(
      ref
          .read(settingsPreferencesControllerProvider.notifier)
          .setCustomDeviceColor(_color.toColor()),
    );
  }

  Future<void> _usePresetColor() async {
    setState(() => _isAdjusting = false);
    await ref
        .read(settingsPreferencesControllerProvider.notifier)
        .setCustomDeviceColor(null);
  }

  void _setFromDrag(_ColorChannel channel, double fraction) {
    setState(() {
      switch (channel) {
        case _ColorChannel.hue:
          _color = _color.withHue((fraction * 360).clamp(0.0, 359.9));
        case _ColorChannel.saturation:
          _color = _color.withSaturation(fraction.clamp(0.0, 1.0));
        case _ColorChannel.brightness:
          _color = _color.withValue(fraction.clamp(0.0, 1.0));
      }
    });
    _applyColor();
  }

  double _fractionOf(_ColorChannel channel) {
    switch (channel) {
      case _ColorChannel.hue:
        return _color.hue / 360;
      case _ColorChannel.saturation:
        return _color.saturation;
      case _ColorChannel.brightness:
        return _color.value;
    }
  }

  String _titleOf(_ColorChannel channel) {
    switch (channel) {
      case _ColorChannel.hue:
        return context.localization.customDeviceColorHue;
      case _ColorChannel.saturation:
        return context.localization.customDeviceColorSaturation;
      case _ColorChannel.brightness:
        return context.localization.customDeviceColorBrightness;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool hasCustomColor =
        ref.watch(
          settingsPreferencesControllerProvider.select(
            (settings) => settings.customDeviceColorValue,
          ),
        ) !=
        null;

    return CupertinoPageScaffold(
      child: Column(
        children: [
          StatusBar(title: Routes.customDeviceColor.title(context)),
          Flexible(
            child: ListView(
              controller: scrollController,
              children: [
                for (int index = 0; index < displayItems.length; index++)
                  if (displayItems[index] case final _ColorChannel channel)
                    _ColorChannelTile(
                      title: _titleOf(channel),
                      fraction: _fractionOf(channel),
                      isSelected: selectedDisplayItem == index,
                      isAdjusting: _isAdjusting && selectedDisplayItem == index,
                      onTap: () => setState(() {
                        if (selectedDisplayItem == index) {
                          _isAdjusting = !_isAdjusting;
                        } else {
                          selectedDisplayItem = index;
                          _isAdjusting = false;
                        }
                      }),
                      onDrag: (fraction) => _setFromDrag(channel, fraction),
                    )
                  else
                    SelectionListTile(
                      text: context.localization.usePresetDeviceColor,
                      isSelected: selectedDisplayItem == index,
                      isActive: !hasCustomColor,
                      onTap: _usePresetColor,
                    ),
                _ColorPreviewTile(color: _color.toColor()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// A settings row whose value is a bar, drawn like the volume and seek bars.
class _ColorChannelTile extends StatelessWidget {
  final String title;
  final double fraction;
  final bool isSelected;
  final bool isAdjusting;
  final VoidCallback onTap;
  final ValueChanged<double> onDrag;

  const _ColorChannelTile({
    required this.title,
    required this.fraction,
    required this.isSelected,
    required this.isAdjusting,
    required this.onTap,
    required this.onDrag,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme =
        CupertinoTheme.of(context).brightness == Brightness.dark;
    final Color borderColor = isDarkTheme
        ? AppPalette.darkSliderBorderColor
        : AppPalette.sliderBorderColor;
    final List<Color> inactiveGradientColors = isDarkTheme
        ? const [
            AppPalette.darkSliderGradientColor1,
            AppPalette.darkSliderGradientColor2,
          ]
        : const [
            AppPalette.inActiveSliderGradientColor1,
            AppPalette.inActiveSliderGradientColor2,
          ];
    final Color textColor = isSelected
        ? context.appInverseTextColor
        : context.appPrimaryTextColor;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 30,
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: isSelected
                ? const Border(
                    top: BorderSide(
                      color: AppPalette.selectedTileTopBorderColor,
                    ),
                    bottom: BorderSide(
                      color: AppPalette.selectedTileBottomBorderColor,
                    ),
                  )
                : null,
            gradient: isSelected
                ? const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppPalette.selectedTileGradientColor1,
                      AppPalette.selectedTileGradientColor2,
                    ],
                  )
                : null,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              spacing: 6,
              children: [
                if (isAdjusting)
                  Icon(
                    CupertinoIcons.arrow_left_right,
                    size: 14,
                    color: textColor,
                  ),
                Text(
                  title,
                  style: CupertinoTheme.of(context).textTheme.textStyle
                      .copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      void handleDrag(Offset localPosition) =>
                          onDrag(localPosition.dx / constraints.maxWidth);

                      return GestureDetector(
                        onHorizontalDragStart: (details) =>
                            handleDrag(details.localPosition),
                        onHorizontalDragUpdate: (details) =>
                            handleDrag(details.localPosition),
                        onTapDown: (details) =>
                            handleDrag(details.localPosition),
                        child: SizedBox(
                          height: 14,
                          child: Stack(
                            children: [
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  border: Border.all(color: borderColor),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: inactiveGradientColors,
                                  ),
                                ),
                                child: const SizedBox(
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                              Container(
                                height: 14,
                                width: fraction * constraints.maxWidth,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      AppPalette.nowProgressBarGradientColor1,
                                      AppPalette.nowProgressBarGradientColor4,
                                      AppPalette.nowProgressBarGradientColor8,
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Shows the colour being built, the way the device colour screen shows its
/// swatches.
class _ColorPreviewTile extends StatelessWidget {
  final Color color;

  const _ColorPreviewTile({required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 6, 4, 4),
      child: SizedBox(
        height: 26,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(width: 1.5),
          ),
          child: const SizedBox(width: double.infinity),
        ),
      ),
    );
  }
}
