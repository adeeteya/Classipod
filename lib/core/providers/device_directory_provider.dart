import 'dart:io';

import 'package:classipod/core/models/device_directory.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

final deviceDirectoryProvider = FutureProvider<DeviceDirectory>((ref) async {
  final results = await Future.wait<Directory?>([
    getTemporaryDirectory(),
    getApplicationDocumentsDirectory(),
    getDownloadsDirectory(),
  ]);
  return DeviceDirectory(
    tempDirectory: results[0]!,
    documentsDirectory: results[1]!,
    downloadsDirectory: results[2],
  );
});
