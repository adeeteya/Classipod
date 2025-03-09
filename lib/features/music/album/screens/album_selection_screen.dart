import 'dart:async';

import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/services/audio_files_service.dart';
import 'package:classipod/core/widgets/empty_state_widget.dart';
import 'package:classipod/features/custom_screen_elements/custom_screen.dart';
import 'package:classipod/features/music/album/models/album_model.dart';
import 'package:classipod/features/music/album/providers/album_details_provider.dart';
import 'package:classipod/features/music/album/widgets/album_list_tile.dart';
import 'package:classipod/features/status_bar/widgets/status_bar.dart';
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
  double get displayTileHeight => 54;

  @override
  int get extraDisplayItems => 1;

  @override
  String get routeName => Routes.albums.name;

  @override
  List<AlbumModel> get displayItems => ref.read(albumDetailsProvider);

  @override
  Future<void> onSelectPressed() async =>
      _navigateToAlbumSelectionScreen(selectedDisplayItem);

  @override
  Future<void> onSelectLongPress() =>
      _navigateToAlbumMoreOptionsScreen(selectedDisplayItem);

  Future<void> _navigateToAlbumMoreOptionsScreen(int index) async {
    setState(() => selectedDisplayItem = index);
    //If the index is 0, it means the user has selected the "All Albums" option
    if (index == 0) {
      return;
    } else {
      await context.pushNamed(
        Routes.albumMoreOptions.name,
        extra: displayItems[index - 1],
      );
    }
  }

  void _navigateToAlbumSelectionScreen(int index) {
    setState(() => selectedDisplayItem = index);
    if (index == 0) {
      context.goNamed(
        Routes.albumSongs.name,
        extra: AlbumModel(
          albumName: context.localization.allAlbums,
          albumArtistName: "",
          albumSongs: ref.read(audioFilesServiceProvider).requireValue,
        ),
      );
    } else {
      context.goNamed(Routes.albumSongs.name, extra: displayItems[index - 1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (displayItems.isEmpty) {
      return CupertinoPageScaffold(
        child: Column(
          children: [
            StatusBar(title: Routes.albums.title(context)),
            Expanded(
              child: EmptyStateWidget(
                emptyDescription: context.localization.noAlbumsFound,
              ),
            ),
          ],
        ),
      );
    }

    return CupertinoPageScaffold(
      child: Column(
        children: [
          StatusBar(title: Routes.albums.title(context)),
          Flexible(
            child: CupertinoScrollbar(
              controller: scrollController,
              child: ListView.builder(
                controller: scrollController,
                itemCount: displayItems.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    final allSongs =
                        ref.read(audioFilesServiceProvider).requireValue;
                    return AlbumListTile(
                      albumDetails: AlbumModel(
                        albumName: context.localization.allAlbums,
                        albumArtistName: context.localization.nSongs(
                          allSongs.length,
                        ),
                        albumSongs: allSongs,
                      ),
                      isSelected: selectedDisplayItem == 0,
                      onTap: () async => _navigateToAlbumSelectionScreen(0),
                      onLongPress: () {},
                    );
                  }

                  return AlbumListTile(
                    albumDetails: displayItems[index - 1],
                    isSelected: selectedDisplayItem == index,
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
