import 'dart:io';

import 'package:classipod/core/constants/constants.dart';

class DeviceDirectory {
  final Directory tempDirectory;
  final Directory documentsDirectory;
  final Directory? downloadsDirectory;

  DeviceDirectory({
    required this.tempDirectory,
    required this.documentsDirectory,
    required this.downloadsDirectory,
  });

  String get musicFolderPath {
    if (Platform.isAndroid) {
      return Constants.androidDefaultMusicFolderPath;
    } else if (Platform.isWindows) {
      final pathList =
          downloadsDirectory?.path.split('\\') ??
          documentsDirectory.path.split('\\');
      pathList[pathList.length - 1] = 'Music';
      return pathList.join('\\');
    } else {
      final pathList =
          downloadsDirectory?.path.split('/') ??
          documentsDirectory.path.split('/');
      pathList[pathList.length - 1] = 'Music';
      return pathList.join('/');
    }
  }

  @override
  bool operator ==(Object other) {
    return other is DeviceDirectory &&
        other.tempDirectory.path == tempDirectory.path &&
        other.documentsDirectory.path == documentsDirectory.path &&
        other.downloadsDirectory?.path == downloadsDirectory?.path;
  }

  @override
  int get hashCode =>
      Object.hash(tempDirectory, documentsDirectory, downloadsDirectory);
}
