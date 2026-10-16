import 'dart:io';

import 'package:classipod/core/models/library_context.dart';
import 'package:flutter/foundation.dart';

/// Substrings que marcam um diretório como de podcasts. A checagem é feita
/// em minúsculas, então funciona de forma case insensitive.
const List<String> _podcastDirectoryMarkers = ['pod', 'cast'];

/// Substrings que marcam um diretório como de audiolivros, pela mesma regra
/// dos podcasts: qualquer pasta pai cujo nome contenha um destes pedaços.
const List<String> _audiobookDirectoryMarkers = ['book'];

/// Segmento de diretório que o Classipod nunca deve ler: a árvore `Android/`
/// guarda dados privados de outros apps (e o próprio Android bloqueia parte
/// dela), então qualquer caminho que passe por ela é excluído por padrão.
const String androidDataDirectorySegment = 'android';

/// Pastas padrão do Android que o Classipod inclui por default. Todo o resto
/// descoberto na varredura nasce excluído, e o usuário pode reverter pasta a
/// pasta na tela de exclusões.
const List<String> defaultIncludedDirectoryNames = [
  'music',
  'podcasts',
  'audiobooks',
];

/// Contextos de biblioteca derivados do caminho do arquivo.
///
/// A ordem importa: `audiobooks` vem antes de `podcasts` porque uma pasta
/// como `Audiobooks` casa com os marcadores dos dois, e cada arquivo precisa
/// cair em exatamente um contexto. O primeiro contexto que casar vence, e o
/// que não casar com nenhum é música.
const List<(LibraryContext, List<String>)> _pathMarkers = [
  (LibraryContext.audiobooks, _audiobookDirectoryMarkers),
  (LibraryContext.podcasts, _podcastDirectoryMarkers),
];

/// Pastas do caminho (sem o nome do arquivo), normalizadas e em minúsculas.
List<String> _directoriesOf(String? path) {
  if (path == null) return const [];
  final normalized = path.replaceAll('\\', '/').toLowerCase();
  final segments = normalized.split('/');
  // ignora o nome do arquivo, olha só as pastas
  return segments.length > 1
      ? segments.sublist(0, segments.length - 1)
      : segments;
}

bool _hasMarker(List<String> directories, List<String> markers) {
  return directories.any(
    (segment) => markers.any((marker) => segment.contains(marker)),
  );
}

/// Contexto ao qual um arquivo pertence segundo o caminho das pastas pai que
/// o contém ([LibraryContext.music] quando nenhuma pasta é reconhecida).
LibraryContext libraryContextOfPath(String? path) {
  final directories = _directoriesOf(path);
  for (final (context, markers) in _pathMarkers) {
    if (_hasMarker(directories, markers)) return context;
  }
  return LibraryContext.music;
}

bool isPodcastPath(String? path) {
  return libraryContextOfPath(path) == LibraryContext.podcasts;
}

bool isAudiobookPath(String? path) {
  return libraryContextOfPath(path) == LibraryContext.audiobooks;
}

/// Verdadeiro quando o caminho está dentro da árvore `Android/` de qualquer
/// volume (`/storage/emulated/0/Android`, `/storage/<cartão>/Android`, ...).
/// A comparação é por segmento exato, então pastas como `AndroidStuff` não
/// são afetadas.
bool isAndroidDataPath(String? path) {
  if (path == null) return false;
  final normalized = path.replaceAll('\\', '/').toLowerCase();
  return normalized
      .split('/')
      .any((segment) => segment == androidDataDirectorySegment);
}

/// Verdadeiro quando o diretório deve entrar na biblioteca por default: está
/// sob uma das pastas padrão ([defaultIncludedDirectoryNames]) em qualquer
/// volume, ou dentro dela mesma. `/storage/emulated/0/Music` e
/// `/storage/emulated/0/Music/Rock` entram; `/storage/emulated/0/Download`
/// não. A árvore `Android/` nunca entra, mesmo que contenha uma pasta com
/// nome padrão.
bool isDefaultIncludedDirectory(String? path) {
  if (path == null) return false;
  final normalized = path.replaceAll('\\', '/').toLowerCase();
  final segments = normalized.split('/');
  if (segments.any((segment) => segment == androidDataDirectorySegment)) {
    return false;
  }
  return segments.any(
    (segment) => defaultIncludedDirectoryNames.contains(segment),
  );
}

/// Valor inicial de `isExcluded` para um diretório recém-descoberto: só fica
/// incluído se estiver sob uma pasta padrão. O usuário pode reverter depois
/// na tela de exclusões.
///
/// A regra é específica do Android: é lá que a varredura do MediaStore devolve
/// tudo (Downloads, DCIM, outras árvores) e a política opt-in importa. Nas
/// outras plataformas o usuário escolhe a pasta-pai manualmente, então ela já
/// é o filtro e nada é excluído por padrão.
bool isExcludedByDefault(String? parentDirectoryPath) {
  if (!_isAndroidScan) return false;
  return !isDefaultIncludedDirectory(parentDirectoryPath);
}

/// Indireção sobre [Platform.isAndroid] para que os testes possam exercitar a
/// regra sem depender da plataforma host.
bool Function() _isAndroidScanResolver = () => !kIsWeb && Platform.isAndroid;

bool get _isAndroidScan => _isAndroidScanResolver();

/// Substitui o resolver de plataforma. Só para uso em testes.
@visibleForTesting
void setAndroidScanOverride(bool Function() resolver) {
  _isAndroidScanResolver = resolver;
}

/// Restaura o resolver padrão de plataforma. Só para uso em testes.
@visibleForTesting
void resetAndroidScanOverride() {
  _isAndroidScanResolver = () => !kIsWeb && Platform.isAndroid;
}
