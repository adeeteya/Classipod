import 'package:classipod/core/custom_screen.dart';
import 'package:classipod/core/extensions.dart';
import 'package:classipod/core/routes.dart';
import 'package:classipod/core/screens/no_music_screen.dart';
import 'package:classipod/core/widgets/display_list_tile.dart';
import 'package:classipod/features/music/artists/artist_names_provider.dart';
import 'package:classipod/features/status_bar/status_bar.dart';
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
  void onSelectPressed() {
    final selectedArtistName =
        ref.read(artistNamesProvider).elementAt(selectedDisplayItem);
    context.goNamed(
      Routes.artistSongs.name,
      queryParameters: {"artistName": selectedArtistName},
    );
  }

  @override
  Widget build(BuildContext context) {
    if (displayItems.isEmpty) {
      return NoMusicScreen(
        title: Routes.artists.title,
      );
    }

    return CupertinoPageScaffold(
      child: Column(
        children: [
          StatusBar(
            title: Routes.artists.title,
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
