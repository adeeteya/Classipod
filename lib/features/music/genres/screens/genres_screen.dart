import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/widgets/empty_state_widget.dart';
import 'package:classipod/core/widgets/fast_scroll_indicator.dart';
import 'package:classipod/features/custom_screen_elements/custom_screen.dart';
import 'package:classipod/features/music/genres/providers/genres_provider.dart';
import 'package:classipod/features/music/genres/widgets/genre_list_tile.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class GenresScreen extends ConsumerStatefulWidget {
  const GenresScreen({super.key});

  @override
  ConsumerState createState() => _GenresScreenState();
}

class _GenresScreenState extends ConsumerState<GenresScreen> with CustomScreen {
  @override
  String get screenStateKey => routeName;

  @override
  double get displayTileHeight => 54;

  @override
  String get routeName => Routes.genres.name;

  @override
  List<String> get displayItems => ref.read(genresProvider);

  @override
  void onSelectPressed() => _selectGenre(selectedDisplayItem);

  void _selectGenre(int index) {
    setState(() => selectedDisplayItem = index);
    final selectedGenreName = ref.read(genresProvider).elementAt(index);
    context.goNamed(
      Routes.genreSongs.name,
      pathParameters: {"genreName": selectedGenreName},
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(genresProvider);
    final genreCounts = ref.watch(genreCountsProvider);
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
              itemCount: displayItems.length,
              itemExtent: displayTileHeight,
              labelAt: (index) => displayItems[index],
              child: CupertinoScrollbar(
                controller: scrollController,
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: displayItems.length,
                  itemExtent: displayTileHeight,
                  itemBuilder: (context, index) {
                    final genre = displayItems[index];
                    final counts = genreCounts[genre]!;
                    return GenreListTile(
                      genreName: genre,
                      artistCount: counts.artistCount,
                      albumCount: counts.albumCount,
                      isSelected: selectedDisplayItem == index,
                      onTap: () => _selectGenre(index),
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
