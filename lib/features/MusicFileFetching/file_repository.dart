import 'dart:io';

import 'package:audio_metadata_reader/audio_metadata_reader.dart';
import 'package:classipod/core/helper_functions.dart';
import 'package:path_provider/path_provider.dart';

class FileRepository {
  Future<void> getFilesMetadata(List<String> filePaths) async {
    AudioMetadata audioMetadata;
    final tempDirectory = await getTemporaryDirectory();
    final tempPath = tempDirectory.path;
    for (String path in filePaths) {
      if (isSupportedAudioFormat(path)) {
        String thumbnailFileName = path
            .replaceAll('/', '-')
            .replaceAll(' ', '')
            .replaceAll(".mp3", '.jpg');
        bool thumbnailExists =
            File('$tempPath/$thumbnailFileName').existsSync();

        //Fetch album art if it doesn't exist
        if (!thumbnailExists) {
          audioMetadata = await readMetadata(File(path), getImage: true);
          if (audioMetadata.pictures.isNotEmpty) {
            File thumbnailFile = await File('$tempPath/$thumbnailFileName')
                .create(recursive: true);
            if (path.endsWith('.mp3')) {
              // Store only the image data without the 0,0 elements at the start
              thumbnailFile.writeAsBytesSync(audioMetadata.pictures[0].bytes);
            } else {
              // Store the image data as it is
              thumbnailFile.writeAsBytesSync(audioMetadata.pictures[0].bytes);
            }
          }
        }

        //No need to fetch album art as it already exists
        else {
          audioMetadata = await readMetadata(File(path));
        }
      }
    }
  }
}
