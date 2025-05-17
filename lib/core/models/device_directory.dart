import 'dart:io';

import 'package:classipod/core/constants/constants.dart';

class DeviceDirectory {
  final Directory cacheDirectory;
  final Directory documentsDirectory;

  DeviceDirectory({
    required this.cacheDirectory,
    required this.documentsDirectory,
  });

  String get musicFolderPath {
    if (Platform.isAndroid) {
      return Constants.androidDefaultMusicFolderPath;
    } else if (Platform.isWindows) {
      final pathList = documentsDirectory.path.split('\\');
      pathList[pathList.length - 1] = 'Music';
      return pathList.join('\\');
    } else if (Platform.isLinux) {
      return Platform.environment['HOME'] ?? '/';
    } else {
      final pathList = documentsDirectory.path.split('/');
      pathList[pathList.length - 1] = 'Music';
      return pathList.join('/');
    }
  }

  @override
  bool operator ==(Object other) {
    return other is DeviceDirectory &&
        other.cacheDirectory.path == cacheDirectory.path &&
        other.documentsDirectory.path == documentsDirectory.path;
  }

  @override
  int get hashCode => Object.hash(cacheDirectory, documentsDirectory);

  @override
  String toString() {
    return 'DeviceDirectory(cacheDirectory: ${cacheDirectory.path}, documentsDirectory: ${documentsDirectory.path})';
  }
}
