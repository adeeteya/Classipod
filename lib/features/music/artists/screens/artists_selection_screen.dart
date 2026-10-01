import 'dart:async';

import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/widgets/display_list_tile.dart';
import 'package:classipod/core/widgets/empty_state_widget.dart';
import 'package:classipod/core/widgets/fast_scroll_indicator.dart';
import 'package:classipod/features/custom_screen_elements/custom_screen.dart';
import 'package:classipod/features/music/artists/providers/artist_names_provider.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ArtistsSelectionScreen extends ConsumerStatefulWidget {
  final String? selectedArtist;

  const ArtistsSelectionScreen({super.key, this.selectedArtist});

  @override
  ConsumerState createState() => _ArtistsSelectionScreenState();
}

class _ArtistsSelectionScreenState extends ConsumerState<ArtistsSelectionScreen>
    with CustomScreen {
  String? _revealedArtist;

  @override
  String get screenStateKey => routeName;

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
      unawaited(context.pushNamed<void>(Routes.albums.name));
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
    ref.watch(artistNamesProvider);
    final artist = widget.selectedArtist;
    if (artist != null && artist != _revealedArtist) {
      final index = displayItems.indexOf(artist);
      if (index >= 0) {
        _revealedArtist = artist;
        revealDisplayItem(index + 1);
      }
    }
    if (displayItems.isEmpty) {
      return CupertinoPageScaffold(
        child: Column(
          children: [
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
          Flexible(
            child: FastScrollIndicator(
              wheelScrollIndex: wheelScrollIndex,
              itemCount: displayItems.length + 1,
              itemExtent: displayTileHeight,
              labelAt: (index) => index == 0 ? '' : displayItems[index - 1],
              child: CupertinoScrollbar(
                controller: scrollController,
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: displayItems.length + 1,
                  prototypeItem: const DisplayListTile(
                    text: '',
                    isSelected: false,
                  ),
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
          ),
        ],
      ),
    );
  }
}
