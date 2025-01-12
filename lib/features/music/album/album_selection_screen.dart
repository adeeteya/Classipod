import 'package:classipod/core/custom_screen.dart';
import 'package:classipod/core/routes.dart';
import 'package:classipod/core/screens/no_music_screen.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/core/widgets/album_art_song_list_tile.dart';
import 'package:classipod/features/music/album/album_details.dart';
import 'package:classipod/features/music/album/album_details_provider.dart';
import 'package:classipod/features/status_bar/status_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AlbumsSelectionScreen extends ConsumerStatefulWidget {
  const AlbumsSelectionScreen({super.key});

  @override
  ConsumerState createState() => _AlbumsSelectionScreenState();
}

class _AlbumsSelectionScreenState extends ConsumerState<AlbumsSelectionScreen>
    with CustomScreen {
  @override
  double get displayTileHeight => 50;

  @override
  String get routeName => Routes.albums.name;

  @override
  List<AlbumDetails> get displayItems => ref.read(albumDetailsProvider);

  @override
  Future<void> onSelectPressed() async {
    final albumName =
        ref.read(albumDetailsProvider).elementAt(selectedDisplayItem).albumName;

    final albumMetadataList =
        ref.read(albumDetailsProvider.notifier).getAlbumMetadataList(albumName);

    await ref
        .read(audioPlayerServiceProvider.notifier)
        .setAudioSource(albumMetadataList);

    if (mounted) {
      await context.pushNamed(Routes.nowPlaying.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (displayItems.isEmpty) {
      return NoMusicScreen(title: Routes.albums.name);
    }

    return CupertinoPageScaffold(
      child: Column(
        children: [
          StatusBar(
            title: Routes.albums.title(context),
          ),
          Flexible(
            child: CupertinoScrollbar(
              controller: scrollController,
              child: ListView.builder(
                controller: scrollController,
                itemCount: displayItems.length,
                itemBuilder: (context, index) => AlbumArtSongListTile(
                  thumbnailPath: displayItems[index].thumbnailPath,
                  songName: displayItems[index].albumName,
                  trackArtistNames: displayItems[index].albumArtistName,
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
