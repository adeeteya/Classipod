import 'package:classipod/core/custom_screen.dart';
import 'package:classipod/core/routes.dart';
import 'package:classipod/core/widgets/display_list_tile.dart';
import 'package:classipod/providers/music_provider.dart';
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
  List<String> get displayItems =>
      ref.read(musicProvider.notifier).artistNames.toList();

  @override
  void onSelectPressed() {
    final selectedArtistName = ref
        .read(musicProvider.notifier)
        .artistNames
        .elementAt(selectedDisplayItem);
    context.goNamed(Routes.artistSongs.name,
        pathParameters: {"artistName": selectedArtistName});
  }

  @override
  Widget build(BuildContext context) {
    if (displayItems.isEmpty) {
      return const CupertinoPageScaffold(
        child: Center(
          child: Text("No Music Files Present from the Selected Directory☹️"),
        ),
      );
    }

    return CupertinoPageScaffold(
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
    );
  }
}
