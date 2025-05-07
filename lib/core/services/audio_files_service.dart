import 'dart:async';
import 'dart:collection';
import 'dart:io';

import 'package:classipod/core/constants/constants.dart';
import 'package:classipod/core/constants/keys.dart';
import 'package:classipod/core/constants/online_audio_files_metadata.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/repositories/metadata_reader_repository.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:on_audio_query/on_audio_query.dart';

final audioFilesServiceProvider = AsyncNotifierProvider<
  AudioFilesServiceNotifier,
  UnmodifiableListView<MusicMetadata>
>(AudioFilesServiceNotifier.new);

class AudioFilesServiceNotifier
    extends AsyncNotifier<UnmodifiableListView<MusicMetadata>> {
  @override
  Future<UnmodifiableListView<MusicMetadata>> build() async {
    return getAudioFilesMetadata();
  }

  Future<UnmodifiableListView<MusicMetadata>> getAudioFilesMetadata() async {
    state = const AsyncLoading();
    try {
      if (ref.read(settingsPreferencesControllerProvider).fetchOnlineMusic) {
        return UnmodifiableListView(onlineDemoAudioFilesMetaData);
      }
      // Fetch metadata from local files
      else {
        final Box<MusicMetadata> metadataBox = Hive.box<MusicMetadata>(
          Constants.metadataBoxName,
        );
        // Check if the metadata box is empty
        if (metadataBox.isEmpty) {
          if (kIsWeb) {
            // FilePickerWeb.registerWith(Registrar());
            await showDialog(
              context: deviceFrameGlobalKey.currentContext!,
              builder:
                  (context) => AlertDialog(
                    title: const Text("Pick Files"),
                    content: const Text(
                      "Select all the music files to add to the library.",
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => context.pop(),
                        child: const Text("Ok"),
                      ),
                    ],
                  ),
            );
            final pickedFiles = await FilePicker.platform.pickFiles(
              dialogTitle: 'Select Music Files',
              type: FileType.audio,
              allowMultiple: true,
              lockParentWindow: true,
            );
            if (pickedFiles != null) {
              final result = await compute(
                ref
                    .read(metadataReaderRepositoryProvider)
                    .extractMetadataFromFiles,
                pickedFiles.paths
                    .where((e) => e != null)
                    .map((e) => e!)
                    .toList(growable: false),
              );
              await metadataBox.addAll(result);
              return UnmodifiableListView(result);
            } else {
              return UnmodifiableListView([]);
            }
          }
          // Pick Directory on Windows
          else if (Platform.isWindows) {
            final newDirectory = await FilePicker.platform.getDirectoryPath(
              dialogTitle: "Select Music Directory",
              lockParentWindow: true,
              initialDirectory:
                  ref
                      .read(settingsPreferencesControllerProvider)
                      .musicFolderPath,
            );
            if (newDirectory != null) {
              final result = await compute(
                ref
                    .read(metadataReaderRepositoryProvider)
                    .extractMetadataFromDirectory,
                newDirectory,
              );
              await metadataBox.addAll(result);
              return UnmodifiableListView(result);
            } else {
              return UnmodifiableListView([]);
            }
          }
          // Android and iOS Automatically Fetch Music Files
          else {
            final OnAudioQuery audioQuery = OnAudioQuery();
            final queriedSongs = await audioQuery.querySongs();

            final result = await compute(
              ref
                  .read(metadataReaderRepositoryProvider)
                  .extractMetadataFromFiles,
              queriedSongs.map((e) => e.data).toList(growable: false),
            );
            await metadataBox.addAll(result);
            return UnmodifiableListView(result);
          }
        }
        // Return cached metadata
        else {
          return UnmodifiableListView(metadataBox.values);
        }
      }
    } catch (e) {
      return UnmodifiableListView([]);
    }
  }
}
