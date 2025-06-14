import 'package:hive_ce_flutter/hive_flutter.dart';

class ExcludeDirectoryModel extends HiveObject {
  final String directoryPath;
  final bool isExcluded;

  ExcludeDirectoryModel({
    required this.directoryPath,
    required this.isExcluded,
  });

  ExcludeDirectoryModel copyWith({String? directoryPath, bool? isExcluded}) {
    return ExcludeDirectoryModel(
      directoryPath: directoryPath ?? this.directoryPath,
      isExcluded: isExcluded ?? this.isExcluded,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ExcludeDirectoryModel &&
        other.directoryPath == directoryPath &&
        other.isExcluded == isExcluded;
  }

  @override
  int get hashCode => Object.hash(directoryPath, isExcluded);

  @override
  String toString() {
    return 'ExcludedDirectoryModel(directoryPath: $directoryPath, isExcluded: $isExcluded)';
  }
}
