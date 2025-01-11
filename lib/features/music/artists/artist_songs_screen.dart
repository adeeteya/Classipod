import 'package:classipod/core/custom_screen.dart';
import 'package:classipod/core/routes.dart';
import 'package:classipod/core/widgets/album_art_song_list_tile.dart';
import 'package:classipod/features/music/artists/artist_songs_provider.dart';
import 'package:classipod/features/status_bar/status_bar.dart';
import 'package:classipod/services/audio_files_service.dart';
import 'package:classipod/services/audio_player_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ArtistSongsScreen extends ConsumerStatefulWidget {
  final String artistName;
  const ArtistSongsScreen({super.key, required this.artistName});

  @override
  ConsumerState createState() => _ArtistSongsScreenState();
}

class _ArtistSongsScreenState extends ConsumerState<ArtistSongsScreen>
    with CustomScreen {
  @override
  double get displayTileHeight => 50;

  @override
  String get routeName => Routes.artistSongs.name;

  @override
  List<int> get displayItems =>
      ref.read(artistSongIndexesProvider(widget.artistName));

  @override
  Future<void> onSelectPressed() async {
    await ref
        .read(audioPlayerServiceProvider.notifier)
        .playSongAtIndex(displayItems[selectedDisplayItem]);
    if (mounted) {
      await context.pushNamed(Routes.nowPlaying.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        children: [
          StatusBar(
            title: widget.artistName,
          ),
          Flexible(
            child: CupertinoScrollbar(
              controller: scrollController,
              child: ListView.builder(
                controller: scrollController,
                itemCount: displayItems.length,
                itemBuilder: (context, index) => AlbumArtSongListTile(
                  thumbnailPath: ref
                      .read(audioFilesServiceProvider)
                      .requireValue[displayItems[index]]
                      .thumbnailPath,
                  songName: ref
                      .read(audioFilesServiceProvider)
                      .requireValue[displayItems[index]]
                      .trackName,
                  trackArtistNames: ref
                      .read(audioFilesServiceProvider)
                      .requireValue[displayItems[index]]
                      .getTrackArtistNames,
                  isSelected: selectedDisplayItem == index,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
