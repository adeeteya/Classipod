import 'package:classipod/core/repositories/library/library_repository.dart';
import 'package:classipod/core/repositories/library/library_source.dart';
import 'package:on_audio_query/on_audio_query.dart';

Future<LibrarySnapshot> discoverMediaStore() async {
  await LibraryRepository.deleteLegacyMetadata();
  final snapshot = await OnAudioQuery().queryAndroidLibrary();
  return LibrarySnapshot(
    volumes: snapshot.volumes,
    songs: [
      for (final song in snapshot.songs)
        LibrarySong(
          uri: song.uri,
          volume: song.volume,
          path: song.path,
          size: song.size,
          modified: song.modified,
          metadata: Map<String, dynamic>.from(song.metadata),
        ),
    ],
  );
}
