import 'dart:async';

import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/widgets/empty_state_widget.dart';
import 'package:classipod/features/custom_screen_widgets/custom_screen.dart';
import 'package:classipod/features/music/album/album_detail.dart';
import 'package:classipod/features/music/album/album_details_provider.dart';
import 'package:classipod/features/music/album/album_list_tile.dart';
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
  double get displayTileHeight => 50;

  @override
  String get routeName => Routes.albums.name;

  @override
  List<AlbumDetail> get displayItems => ref.read(albumDetailsProvider);

  @override
  Future<void> onSelectPressed() async =>
      _navigateToAlbumSelectionScreen(selectedDisplayItem);

  @override
  Future<void> onSelectLongPress() =>
      _navigateToAlbumMoreOptionsScreen(selectedDisplayItem);

  Future<void> _navigateToAlbumMoreOptionsScreen(int index) async {
    setState(() => selectedDisplayItem = index);
    await context.pushNamed(
      Routes.albumMoreOptions.name,
      extra: displayItems[index],
    );
  }

  void _navigateToAlbumSelectionScreen(int index) {
    setState(() => selectedDisplayItem = index);
    context.goNamed(
      Routes.albumSongs.name,
      extra: displayItems[index],
    );
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
          StatusBar(
            title: Routes.albums.title(context),
          ),
          Flexible(
            child: CupertinoScrollbar(
              controller: scrollController,
              child: ListView.builder(
                controller: scrollController,
                itemCount: displayItems.length,
                itemBuilder: (context, index) => AlbumListTile(
                  albumDetails: displayItems[index],
                  isSelected: selectedDisplayItem == index,
                  onTap: () async => _navigateToAlbumSelectionScreen(index),
                  onLongPress: () async =>
                      _navigateToAlbumMoreOptionsScreen(index),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
