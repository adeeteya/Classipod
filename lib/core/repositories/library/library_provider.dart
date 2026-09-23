import 'dart:io';

import 'package:classipod/core/providers/device_directory_provider.dart';
import 'package:classipod/core/repositories/library/library_repository.dart';
import 'package:classipod/core/repositories/library/metadata_worker_stub.dart'
    if (dart.library.io) 'package:classipod/core/repositories/library/metadata_worker.dart';
import 'package:classipod/core/repositories/library/sources/file_access.dart';
import 'package:classipod/core/repositories/library/sources/file_library_source.dart';
import 'package:classipod/core/repositories/library/sources/media_store_source.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final libraryRepositoryProvider = Provider<LibraryRepository>((ref) {
  final directory = ref.read(deviceDirectoryProvider).requireValue;
  final files = FileLibrarySource(
    authorize: authorizeFileLocations,
    pickLocations: () async {
      if (Platform.isIOS) {
        final picked = await FilePicker.pickFiles(
          dialogTitle: 'Pick Song Files',
        );
        final paths = picked
            .map((file) => file.path)
            .whereType<String>()
            .toList();
        return paths.isEmpty ? null : {'files': paths};
      }
      final path = await FilePicker.getDirectoryPath(
        dialogTitle: 'Select Music Directory',
        windowsOptions: const WindowsOptions(lockParentWindow: true),
        linuxOptions: const LinuxOptions(lockParentWindow: true),
        initialDirectory: directory.musicFolderPath,
      );
      return path == null ? null : {'directory': path};
    },
  );
  MetadataWorker? worker;
  return LibraryRepository(
    artworkDirectory:
        '${directory.documentsDirectory.path}/ClassiPod/artwork-v1',
    discover: Platform.isAndroid ? discoverMediaStore : files.discover,
    selectSource: Platform.isAndroid ? null : files.selectAgain,
    readTags: (uri, {artworkDirectory}) async {
      worker ??= await MetadataWorker.start();
      return worker!.read(uri, artworkDirectory: artworkDirectory);
    },
    closeReader: () async {
      final previous = worker;
      worker = null;
      await previous?.close();
    },
  );
});
