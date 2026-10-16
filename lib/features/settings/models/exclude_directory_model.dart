import 'package:hive_ce_flutter/hive_flutter.dart';

class ExcludeDirectoryModel extends HiveObject {
  final String directoryPath;
  final bool isExcluded;

  /// Verdadeiro depois que o usuário alternou este diretório manualmente.
  /// A regra de inclusão padrão (só Music/Podcasts entram) nunca revisita
  /// um diretório marcado como customizado, então a escolha dele sobrevive
  /// às indexações seguintes.
  final bool isUserCustomized;

  ExcludeDirectoryModel({
    required this.directoryPath,
    required this.isExcluded,
    this.isUserCustomized = false,
  });

  ExcludeDirectoryModel copyWith({
    String? directoryPath,
    bool? isExcluded,
    bool? isUserCustomized,
  }) {
    return ExcludeDirectoryModel(
      directoryPath: directoryPath ?? this.directoryPath,
      isExcluded: isExcluded ?? this.isExcluded,
      isUserCustomized: isUserCustomized ?? this.isUserCustomized,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ExcludeDirectoryModel &&
        other.directoryPath == directoryPath &&
        other.isExcluded == isExcluded &&
        other.isUserCustomized == isUserCustomized;
  }

  @override
  int get hashCode => Object.hash(directoryPath, isExcluded, isUserCustomized);

  @override
  String toString() {
    return 'ExcludedDirectoryModel(directoryPath: $directoryPath, '
        'isExcluded: $isExcluded, isUserCustomized: $isUserCustomized)';
  }
}
