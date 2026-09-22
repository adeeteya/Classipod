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
    await _invoke<void>('setShowWhenLocked', {'enabled': enabled});
  }

  /// Whether the app may start itself over the keyguard. Without it Android
  /// blocks the activity start that replaces the lock screen.
  static Future<bool> canDrawOverlays() async {
    final bool? result = await _invoke<bool>('canDrawOverlays');
    return result ?? false;
  }

  /// Sends the user to the system page where the permission is granted.
  static Future<void> requestDrawOverlays() async {
    await _invoke<void>('requestDrawOverlays');
  }

  static Future<T?> _invoke<T>(String method, [Object? arguments]) async {
    if (!isSupported) {
      return null;
    }
    try {
      return await _channel.invokeMethod<T>(method, arguments);
    } on PlatformException catch (error) {
      debugPrint('Lock screen channel failed on $method: ${error.message}');
      return null;
    } on MissingPluginException {
      debugPrint('Lock screen channel is not available on this platform.');
      return null;
    }
  }
}
