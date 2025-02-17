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
  String get routeName => Uri.parse(widget.artistName).path;

  @override
  List<AlbumModel> get displayItems =>
      ref.read(artistAlbumDetailListProvider(widget.artistName));

  @override
  Future<void> onSelectPressed() =>
      _navigateToAlbumSelectionScreen(selectedDisplayItem);

  @override
  Future<void> onSelectLongPress() =>
      _navigateToAlbumMoreOptionsScreen(selectedDisplayItem);

  Future<void> _navigateToAlbumMoreOptionsScreen(int index) async {
    setState(() => selectedDisplayItem = index);
    await context.pushNamed(
      Routes.artistAlbumsMoreOptions.name,
      pathParameters: {"artistName": widget.artistName},
      extra: displayItems[index],
    );
  }

  Future<void> _navigateToAlbumSelectionScreen(int index) async {
    setState(() => selectedDisplayItem = index);
    await context.pushNamed(Routes.albumSongs.name, extra: displayItems[index]);
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
                itemCount: displayItems.length,
                itemBuilder:
                    (context, index) => AlbumListTile(
                      albumDetails: displayItems[index],
                      isSelected: selectedDisplayItem == index,
                      showArtistName: false,
                      onTap: () async => _navigateToAlbumSelectionScreen(index),
                      onLongPress:
                          () async => _navigateToAlbumMoreOptionsScreen(index),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
