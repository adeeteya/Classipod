import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/services/audio_files_service.dart';
import 'package:classipod/core/widgets/display_list_tile.dart';
import 'package:classipod/core/widgets/empty_state_widget.dart';
import 'package:classipod/features/custom_screen_elements/custom_screen.dart';
import 'package:classipod/features/music/album/models/album_model.dart';
import 'package:classipod/features/music/artists/providers/artist_names_provider.dart';
import 'package:classipod/features/status_bar/widgets/status_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ArtistsSelectionScreen extends ConsumerStatefulWidget {
  const ArtistsSelectionScreen({super.key});

  @override
  ConsumerState createState() => _ArtistsSelectionScreenState();
}

class _ArtistsSelectionScreenState extends ConsumerState<ArtistsSelectionScreen>
    with CustomScreen {
  @override
  String get routeName => Routes.artists.name;

  @override
  int get extraDisplayItems => 1;

  @override
  List<String> get displayItems => ref.read(artistNamesProvider);

  @override
  void onSelectPressed() => _selectArtist(selectedDisplayItem);

  void _selectArtist(int index) {
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
      final selectedArtistName = ref
          .read(artistNamesProvider)
          .elementAt(index - 1);
      context.goNamed(
        Routes.artistAlbums.name,
        pathParameters: {"artistName": selectedArtistName},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (displayItems.isEmpty) {
      return CupertinoPageScaffold(
        child: Column(
          children: [
            StatusBar(title: Routes.artists.title(context)),
            Expanded(
              child: EmptyStateWidget(
                emptyDescription: context.localization.noMusicFilesFound,
              ),
            ),
          ],
        ),
      );
    }

    return CupertinoPageScaffold(
      child: Column(
        children: [
          StatusBar(title: Routes.artists.title(context)),
          Flexible(
            child: CupertinoScrollbar(
              controller: scrollController,
              child: ListView.builder(
                controller: scrollController,
                itemCount: displayItems.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return DisplayListTile(
                      text: context.localization.allAlbums,
                      isSelected: selectedDisplayItem == 0,
                      onTap: () => _selectArtist(0),
                    );
                  }

                  return DisplayListTile(
                    text: displayItems[index - 1],
                    isSelected: selectedDisplayItem == index,
                    onTap: () => _selectArtist(index),
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
