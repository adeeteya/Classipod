import 'dart:io' as io;

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Bridges to the Android host activity so that the app can be displayed and
/// used on top of the lock screen.
abstract final class LockScreenService {
  static const MethodChannel _channel = MethodChannel(
    'com.adeeteya.classipod/lock_screen',
  );

  /// Only Android exposes an activity level flag for this behaviour.
  static bool get isSupported => !kIsWeb && io.Platform.isAndroid;

  static Future<void> setShowWhenLocked({required bool enabled}) async {
    if (!isSupported) {
      return;
    }
    try {
      await _channel.invokeMethod<void>('setShowWhenLocked', {
        'enabled': enabled,
      });
    } on PlatformException catch (error) {
      debugPrint('Failed to update the lock screen flag: ${error.message}');
    } on MissingPluginException {
      debugPrint('Lock screen channel is not available on this platform.');
    }
  }
}
