import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/features/music/playlist/models/playlist_model.dart';
import 'package:classipod/features/music/playlist/providers/playlists_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Opens the playlist picker and adds [songs] to whatever the user chose.
///
/// Every library screen offering "Add to Playlist" calls this, so the picker
/// and the on-the-go fallback behave identically everywhere. The on-the-go
/// playlist has no Hive key, so it takes the in-memory path; saved playlists
/// are written to the box.
Future<void> addSongsToChosenPlaylist(
  BuildContext context,
  WidgetRef ref,
  List<MusicMetadata> songs,
) async {
  final playlist = await context.pushNamed(
    Routes.playlistSelection.name,
    extra: songs,
  );
  if (playlist is! PlaylistModel) return;

  final notifier = ref.read(playlistsProvider.notifier);
  if (playlist.key == null) {
    notifier.addSongsToOnTheGoPlaylist(songs);
  } else {
    await notifier.addSongsToPlaylist(playlistKey: playlist.key, songs: songs);
  }
}
