import 'package:classipod/core/constants/assets.dart';
import 'package:classipod/features/settings/models/device_color.dart';
import 'package:classipod/features/settings/models/device_finish.dart';
import 'package:classipod/features/settings/models/device_texture.dart';
import 'package:flutter/cupertino.dart';

/// Everything the device widgets need to paint themselves, resolved from the
/// chosen preset or custom colour and the chosen finish.
@immutable
class DeviceAppearance {
  final DeviceColorStyle style;

  /// Image laid over the frame, if the finish calls for one.
  final ImageProvider? frameImage;
  final double frameImageOpacity;
  final ImageRepeat frameImageRepeat;
  final BoxFit? frameImageFit;

  const DeviceAppearance({
    required this.style,
    this.frameImage,
    this.frameImageOpacity = 1,
    this.frameImageRepeat = ImageRepeat.noRepeat,
    this.frameImageFit,
  });

  /// Decoration painting the frame: the colour or gradient of the current
  /// style, with the finish image on top when there is one.
  BoxDecoration get frameDecoration {
    final Color? solidFrameColor = style.solidFrameColor;
    final ImageProvider? image = frameImage;
    return BoxDecoration(
      color: solidFrameColor,
      image: image == null
          ? null
          : DecorationImage(
              image: image,
              fit: frameImageFit,
              repeat: frameImageRepeat,
              opacity: frameImageOpacity,
            ),
      gradient: solidFrameColor == null
          ? LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: style.frameGradientColors,
            )
          : null,
    );
  }

  /// Opacity the bundled textures are laid over the frame colour with. Low
  /// enough that the colour still reads as the device colour.
  static const double _bundledTextureOpacity = 0.35;
  static const double _customImageOpacity = 0.9;

  factory DeviceAppearance.resolve({
    required DeviceColor deviceColor,
    required Color? customColor,
    required DeviceFinish finish,
    required DeviceTexture? texture,
  }) {
    final DeviceColorStyle baseStyle = customColor == null
        ? deviceColor.style
        : styleFromColor(customColor);

    switch (finish) {
      case DeviceFinish.classic:
        return DeviceAppearance(
          style: baseStyle,
          frameImage: baseStyle.solidFrameColor == null
              ? const AssetImage(Assets.noiseImage)
              : null,
          frameImageOpacity: baseStyle.noiseOpacity,
          frameImageFit: BoxFit.cover,
        );
      case DeviceFinish.flat:
        return DeviceAppearance(style: _flatten(baseStyle));
      case DeviceFinish.texture:
        final ImageProvider? image = texture?.imageProvider;
        if (image == null) {
          // The picked file went away; fall back to the flat finish rather
          // than showing a broken frame.
          return DeviceAppearance(style: _flatten(baseStyle));
        }
        return DeviceAppearance(
          style: _flatten(baseStyle),
          frameImage: image,
          frameImageOpacity: texture!.bundled == null
              ? _customImageOpacity
              : _bundledTextureOpacity,
          frameImageRepeat: texture.repeat,
          frameImageFit: texture.fit,
        );
    }
  }

  /// Drops the gradient and the noise, keeping a single solid frame colour.
  static DeviceColorStyle _flatten(DeviceColorStyle style) {
    final Color solidColor =
        style.solidFrameColor ??
        Color.lerp(
          style.frameGradientColors.first,
          style.frameGradientColors.last,
          0.5,
        )!;
    return DeviceColorStyle(
      noiseOpacity: 0,
      frameGradientColors: [solidColor, solidColor],
      solidFrameColor: solidColor,
      controlBackgroundColor: style.controlBackgroundColor,
      controlBorderColor: style.controlBorderColor,
      innerButtonGradientColors: style.innerButtonGradientColors,
      buttonAccentColor: style.buttonAccentColor,
      buttonIconColor: style.buttonIconColor,
      isDark: style.isDark,
    );
  }

  /// Derives a whole device style from a single colour, so the click wheel and
  /// the buttons stay legible whatever the user picked.
  static DeviceColorStyle styleFromColor(Color color) {
    final HSLColor hsl = HSLColor.fromColor(color);
    final bool isDark = color.computeLuminance() < 0.4;

    Color shifted(double lightnessDelta) => hsl
        .withLightness((hsl.lightness + lightnessDelta).clamp(0.0, 1.0))
        .toColor();

    final Color controlBackgroundColor = isDark
        ? shifted(-0.22)
        : shifted(0.34);
    final Color contrastColor = isDark ? CupertinoColors.white : shifted(-0.42);

    return DeviceColorStyle(
      noiseOpacity: 0.6,
      frameGradientColors: [shifted(0.1), shifted(-0.1)],
      controlBackgroundColor: controlBackgroundColor,
      controlBorderColor: shifted(isDark ? -0.3 : -0.16),
      innerButtonGradientColors: [
        isDark ? shifted(-0.16) : shifted(0.4),
        isDark ? shifted(-0.28) : shifted(0.26),
      ],
      buttonAccentColor: contrastColor,
      buttonIconColor: contrastColor,
      isDark: isDark,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DeviceAppearance &&
        other.style == style &&
        other.frameImage == frameImage &&
        other.frameImageOpacity == frameImageOpacity &&
        other.frameImageRepeat == frameImageRepeat &&
        other.frameImageFit == frameImageFit;
  }

  @override
  int get hashCode => Object.hash(
    style,
    frameImage,
    frameImageOpacity,
    frameImageRepeat,
    frameImageFit,
  );
}
