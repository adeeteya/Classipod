import 'dart:io' as io;

import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:flutter/cupertino.dart';

/// Textures shipped with the app, so a texture finish is usable without
/// hunting for an image first.
enum BundledTexture {
  brushedAluminium('assets/images/textures/brushed_aluminium.webp'),
  carbonFibre('assets/images/textures/carbon_fibre.webp'),
  denim('assets/images/textures/denim.webp'),
  linen('assets/images/textures/linen.webp');

  final String assetPath;

  const BundledTexture(this.assetPath);

  String title(BuildContext context) {
    switch (this) {
      case brushedAluminium:
        return context.localization.brushedAluminiumTexture;
      case carbonFibre:
        return context.localization.carbonFibreTexture;
      case denim:
        return context.localization.denimTexture;
      case linen:
        return context.localization.linenTexture;
    }
  }
}

/// The texture covering the frame: either one of the bundled ones or an image
/// the user picked from the device.
@immutable
class DeviceTexture {
  static const String _bundledPrefix = 'bundled:';

  final BundledTexture? bundled;
  final String? filePath;

  const DeviceTexture.fromBundled(BundledTexture this.bundled)
    : filePath = null;

  const DeviceTexture.fromFile(String this.filePath) : bundled = null;

  /// Parses the stored preference, returning null when nothing usable is set.
  static DeviceTexture? fromStored(String? stored) {
    if (stored == null || stored.isEmpty) {
      return null;
    }
    if (stored.startsWith(_bundledPrefix)) {
      final String name = stored.substring(_bundledPrefix.length);
      for (final BundledTexture texture in BundledTexture.values) {
        if (texture.name == name) {
          return DeviceTexture.fromBundled(texture);
        }
      }
      return null;
    }
    return DeviceTexture.fromFile(stored);
  }

  String toStored() {
    final BundledTexture? bundledTexture = bundled;
    return bundledTexture == null
        ? filePath!
        : '$_bundledPrefix${bundledTexture.name}';
  }

  /// Null when a picked file has since been deleted or moved away.
  ImageProvider? get imageProvider {
    final BundledTexture? bundledTexture = bundled;
    if (bundledTexture != null) {
      return AssetImage(bundledTexture.assetPath);
    }
    final io.File file = io.File(filePath!);
    return file.existsSync() ? FileImage(file) : null;
  }

  /// Bundled textures are small tiles meant to repeat; a picked photo is not.
  ImageRepeat get repeat =>
      bundled == null ? ImageRepeat.noRepeat : ImageRepeat.repeat;

  BoxFit? get fit => bundled == null ? BoxFit.cover : null;

  String title(BuildContext context) {
    final BundledTexture? bundledTexture = bundled;
    return bundledTexture == null
        ? context.localization.customImageTexture
        : bundledTexture.title(context);
  }

  @override
  bool operator ==(Object other) {
    return other is DeviceTexture &&
        other.bundled == bundled &&
        other.filePath == filePath;
  }

  @override
  int get hashCode => Object.hash(bundled, filePath);
}
