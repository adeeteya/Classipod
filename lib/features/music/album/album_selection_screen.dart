import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/core/widgets/empty_state_widget.dart';
import 'package:classipod/features/custom_screen_widgets/custom_screen.dart';
import 'package:classipod/features/music/album/album_details.dart';
import 'package:classipod/features/music/album/album_details_provider.dart';
import 'package:classipod/features/music/album/album_list_tile.dart';
import 'package:classipod/features/now_playing/provider/now_playing_provider.dart';
import 'package:classipod/features/status_bar/widgets/status_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
  Future<void> onSelectPressed() async => _playAlbum(selectedDisplayItem);

  Future<void> _playAlbum(int index) async {
    setState(() => selectedDisplayItem = index);

    final albumName = ref.read(albumDetailsProvider).elementAt(index).albumName;

    final albumMetadataList =
        ref.read(albumDetailsProvider.notifier).getAlbumMetadataList(albumName);

    //If Current album is already playing, then do nothing
    if (listEquals(
      ref.read(nowPlayingMetadataListProvider),
      albumMetadataList,
    )) {
    } else {
      await ref
          .read(audioPlayerServiceProvider.notifier)
          .setAudioSource(albumMetadataList);
    }

    if (mounted) {
      await context.pushNamed(Routes.nowPlaying.name);
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
                  onTap: () async => _playAlbum(index),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
