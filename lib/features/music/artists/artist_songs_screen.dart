import 'package:classipod/core/models/metadata.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/features/custom_screen_widgets/custom_screen.dart';
import 'package:classipod/features/music/album/album_art_song_list_tile.dart';
import 'package:classipod/features/music/artists/artist_songs_provider.dart';
import 'package:classipod/features/status_bar/widgets/status_bar.dart';
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
  List<Metadata> get displayItems =>
      ref.read(artistSongsMetadataListProvider(widget.artistName));

  @override
  Future<void> onSelectPressed() async {
    await ref.read(audioPlayerServiceProvider.notifier).playSongAtOriginalIndex(
          displayItems[selectedDisplayItem].originalSongIndex,
        );
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
                  thumbnailPath: displayItems[index].thumbnailPath,
                  songName: displayItems[index].trackName,
                  trackArtistNames: displayItems[index].getTrackArtistNames,
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
