import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/widgets/display_list_tile.dart';
import 'package:classipod/core/widgets/no_music_widget.dart';
import 'package:classipod/features/custom_screen_widgets/custom_screen.dart';
import 'package:classipod/features/music/artists/artist_names_provider.dart';
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
  List<String> get displayItems => ref.read(artistNamesProvider);

  @override
  void onSelectPressed() => _selectArtist(selectedDisplayItem);

  void _selectArtist(int index) {
    setState(() => selectedDisplayItem = index);
    final selectedArtistName = ref.read(artistNamesProvider).elementAt(index);
    context.goNamed(
      Routes.artistSongs.name,
      queryParameters: {"artistName": selectedArtistName},
    );
  }

  @override
  Widget build(BuildContext context) {
    if (displayItems.isEmpty) {
      return NoMusicWidget(
        title: Routes.artists.title(context),
      );
    }

    return CupertinoPageScaffold(
      child: Column(
        children: [
          StatusBar(
            title: Routes.artists.title(context),
          ),
          Flexible(
            child: CupertinoScrollbar(
              controller: scrollController,
              child: ListView.builder(
                controller: scrollController,
                itemCount: displayItems.length,
                itemBuilder: (context, index) => DisplayListTile(
                  text: displayItems[index],
                  isSelected: selectedDisplayItem == index,
                  onTap: () => _selectArtist(index),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
