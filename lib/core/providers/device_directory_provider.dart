import 'dart:io';

import 'package:classipod/core/models/device_directory.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

final deviceDirectoryProvider = FutureProvider<DeviceDirectory>((ref) async {
  final results = await Future.wait<Directory>([
    getApplicationCacheDirectory(),
    getApplicationDocumentsDirectory(),
  ]);
  return DeviceDirectory(
    cacheDirectory: results[0],
    documentsDirectory: results[1],
  );
});
