import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/widgets/display_list_tile.dart';
import 'package:classipod/core/widgets/empty_state_widget.dart';
import 'package:classipod/features/custom_screen_widgets/custom_screen.dart';
import 'package:classipod/features/music/genres/genres_provider.dart';
import 'package:classipod/features/status_bar/widgets/status_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class GenresScreen extends ConsumerStatefulWidget {
  const GenresScreen({super.key});

  @override
  ConsumerState createState() => _GenresScreenState();
}

class _GenresScreenState extends ConsumerState<GenresScreen> with CustomScreen {
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
    if (displayItems.isEmpty) {
      return CupertinoPageScaffold(
        child: Column(
          children: [
            StatusBar(title: Routes.genres.title(context)),
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
          StatusBar(
            title: Routes.genres.title(context),
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
                  onTap: () => _selectGenre(index),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
