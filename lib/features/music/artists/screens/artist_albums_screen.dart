import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/features/custom_screen_elements/custom_screen.dart';
import 'package:classipod/features/music/album/models/album_model.dart';
import 'package:classipod/features/music/album/widgets/album_list_tile.dart';
import 'package:classipod/features/music/artists/providers/artist_albums_provider.dart';
import 'package:classipod/features/status_bar/widgets/status_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ArtistAlbumsScreen extends ConsumerStatefulWidget {
  final String artistName;

  const ArtistAlbumsScreen({super.key, required this.artistName});

  @override
  ConsumerState createState() => _ArtistAlbumsScreenState();
}

class _ArtistAlbumsScreenState extends ConsumerState<ArtistAlbumsScreen>
    with CustomScreen {
  @override
  double get displayTileHeight => 54;

  @override
  int get extraDisplayItems => 1;

  @override
  String get routeName => Uri.encodeComponent(widget.artistName);

  @override
  List<AlbumModel> get displayItems =>
      ref.read(artistAlbumDetailListProvider(widget.artistName));

  @override
  Future<void> onSelectPressed() =>
      _navigateToAlbumSelectionScreen(selectedDisplayItem);

  @override
  Future<void> onSelectLongPress() =>
      _navigateToAlbumMoreOptionsScreen(selectedDisplayItem);

  AlbumModel allSongsAlbum() {
    final List<MusicMetadata> allSongs = [];
    for (int i = 0; i < displayItems.length; i++) {
      allSongs.addAll(displayItems[i].albumSongs);
    }
    return AlbumModel(
      albumName: context.localization.allSongs,
      albumArtistName: widget.artistName,
      albumSongs: allSongs,
    );
  }

  Future<void> _navigateToAlbumMoreOptionsScreen(int index) async {
    setState(() => selectedDisplayItem = index);
    if (index == 0) {
      await context.pushNamed(
        Routes.artistAlbumsMoreOptions.name,
        pathParameters: {"artistName": widget.artistName},
        extra: allSongsAlbum(),
      );
    } else {
      await context.pushNamed(
        Routes.artistAlbumsMoreOptions.name,
        pathParameters: {"artistName": widget.artistName},
        extra: displayItems[index - 1],
      );
    }
  }

  Future<void> _navigateToAlbumSelectionScreen(int index) async {
    setState(() => selectedDisplayItem = index);
    if (index == 0) {
      await context.pushNamed(Routes.albumSongs.name, extra: allSongsAlbum());
    } else {
      await context.pushNamed(
        Routes.albumSongs.name,
        extra: displayItems[index - 1],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        children: [
          StatusBar(title: widget.artistName),
          Flexible(
            child: CupertinoScrollbar(
              controller: scrollController,
              child: ListView.builder(
                controller: scrollController,
                itemCount: displayItems.length + 1,
                prototypeItem: AlbumListTile(
                  albumDetails: AlbumModel(
                    albumName: '',
                    albumArtistName: '',
                    albumSongs: [],
                  ),
                  isSelected: false,
                  onTap: () {},
                  onLongPress: () {},
                ),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return AlbumListTile(
                      albumDetails: allSongsAlbum(),
                      isSelected: selectedDisplayItem == 0,
                      showArtistName: false,
                      isAllSongsAlbum: true,
                      onTap: () async => _navigateToAlbumSelectionScreen(0),
                      onLongPress:
                          () async => _navigateToAlbumMoreOptionsScreen(0),
                    );
                  }

                  return AlbumListTile(
                    albumDetails: displayItems[index - 1],
                    isSelected: selectedDisplayItem == index,
                    showArtistName: false,
                    onTap: () async => _navigateToAlbumSelectionScreen(index),
                    onLongPress:
                        () async => _navigateToAlbumMoreOptionsScreen(index),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
