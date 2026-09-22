import 'dart:io';
import 'dart:isolate';

import 'package:classipod/core/constants/constants.dart';
import 'package:classipod/core/repositories/library/file_metadata_reader.dart';
import 'package:classipod/core/repositories/library/library_source.dart';
import 'package:hive_ce/hive.dart';

class FileLibrarySource {
  final Future<Map<String, dynamic>?> Function() pickLocations;
  final Future<Map<String, dynamic>> Function(Map<String, dynamic>)? authorize;
  bool _selectAgain = false;

  FileLibrarySource({required this.pickLocations, this.authorize});

  void selectAgain() => _selectAgain = true;

  Future<LibrarySnapshot> discover() async {
    final box = await Hive.openBox<dynamic>(Constants.libraryBoxName);
    final saved = box.get('locations') as Map?;
    var locations = saved == null ? null : Map<String, dynamic>.from(saved);
    if (locations == null || _selectAgain) {
      final picked = await pickLocations();
      if (picked != null) {
        locations = picked;
      }
      _selectAgain = false;
    }
    if (locations == null) {
      return const LibrarySnapshot(songs: [], volumes: []);
    }
    try {
      locations = await authorize?.call(locations) ?? locations;
    } catch (_) {
      _selectAgain = true;
      rethrow;
    }
    await box.put('locations', locations);
    await box.flush();
    final selection = locations;
    return Isolate.run(() => discoverFileLocations(selection));
  }
}

Future<LibrarySnapshot> discoverFileLocations(
  Map<String, dynamic> locations,
) async {
  final songs = <LibrarySong>[];
  final volumes = <String>{};
  const reader = FileMetadataReader();

  Future<void> addFile(File file, String volume) async {
    if (!reader.isSupportedAudioFormat(file.path)) return;
    final stat = await file.stat();
    if (stat.type == FileSystemEntityType.notFound) return;
    if (stat.type != FileSystemEntityType.file) return;
    songs.add(
      LibrarySong(
        uri: file.absolute.uri.toString(),
        volume: volume,
        path: file.absolute.path,
        size: stat.size,
        modified: stat.modified.microsecondsSinceEpoch,
        metadata: {'_display_name': file.uri.pathSegments.last},
      ),
    );
  }

  final root = locations['directory'] as String?;
  if (root != null) {
    final directory = Directory(root).absolute;
    if (await directory.exists()) {
      final volume = directory.uri.toString();
      await for (final entity in directory.list(
        recursive: true,
        followLinks: false,
      )) {
        if (entity is File) await addFile(entity, volume);
      }
      volumes.add(volume);
    }
  } else {
    final paths = List<String>.from(locations['files'] as List? ?? []);
    for (final path in paths) {
      final file = File(path).absolute;
      final parent = file.parent;
      if (await parent.exists()) {
        final volume = parent.uri.toString();
        await addFile(file, volume);
        volumes.add(volume);
      }
    }
  }
  return LibrarySnapshot(songs: songs, volumes: volumes.toList());
}
