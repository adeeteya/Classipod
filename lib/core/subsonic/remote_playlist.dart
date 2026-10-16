import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/subsonic/subsonic_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RemotePlaylist {
  final String id;
  final String name;
  final int songCount;

  const RemotePlaylist({
    required this.id,
    required this.name,
    required this.songCount,
  });
}

final remotePlaylistsProvider = FutureProvider<List<RemotePlaylist>>((
  ref,
) async {
  final serverId = ref.watch(
    subsonicControllerProvider.select((state) {
      final current = state.value;
      return current?.enabled == true && current?.signedIn == true
          ? current?.config?.id
          : null;
    }),
  );
  if (serverId == null) return [];
  return ref.read(subsonicControllerProvider.notifier).fetchPlaylists();
});

final remotePlaylistSongsProvider =
    FutureProvider.family<List<MusicMetadata>, String>((ref, playlistId) async {
      final serverId = ref.watch(
        subsonicControllerProvider.select((state) {
          final current = state.value;
          return current?.enabled == true && current?.signedIn == true
              ? current?.config?.id
              : null;
        }),
      );
      if (serverId == null) return [];
      return ref
          .read(subsonicControllerProvider.notifier)
          .fetchPlaylistSongs(playlistId);
    });
