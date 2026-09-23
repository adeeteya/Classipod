import 'dart:io';

import 'package:flutter/services.dart';

const _channel = MethodChannel('classipod/library_file_access');

/// Pick and bookmark the original URL before returning it to Dart.
Future<Map<String, dynamic>?> pickMusicDirectory() =>
    _channel.invokeMapMethod<String, dynamic>('pickDirectory');

/// Apple sandbox access needs a bookmark across launches, not just a path.
Future<Map<String, dynamic>> authorizeFileLocations(
  Map<String, dynamic> locations,
) async {
  if ((!Platform.isMacOS && !Platform.isIOS) ||
      locations['directory'] == null) {
    return locations;
  }
  final authorized = await _channel.invokeMapMethod<String, dynamic>(
    'accessDirectory',
    locations,
  );
  if (authorized == null) throw StateError('Could not access music directory');
  return {...locations, ...authorized};
}
