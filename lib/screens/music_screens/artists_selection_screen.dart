import 'package:classipod/core/widgets/display_list_tile.dart';
import 'package:classipod/providers/display_provider.dart';
import 'package:classipod/providers/music_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArtistsSelectionScreen extends ConsumerStatefulWidget {
  const ArtistsSelectionScreen({super.key});

  @override
  ConsumerState createState() => _ArtistsSelectionScreenState();
}

class _ArtistsSelectionScreenState
    extends ConsumerState<ArtistsSelectionScreen> {
  late final ScrollController _scrollController;
  late final List<String> artistNames;

  @override
  void initState() {
    _scrollController = ScrollController(
        initialScrollOffset: ref.read(displayProvider).scrollOffset);
    artistNames = ref.read(musicProvider.notifier).artistNames.toList();
    ref.listenManual(displayProvider.select((value) => value.scrollOffset),
        (previous, next) {
      _scrollController.jumpTo(next);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectedDisplayListItem = ref.watch(
        displayProvider.select((value) => value.selectedDisplayListItem));

    if (artistNames.isEmpty) {
      return const CupertinoPageScaffold(
        backgroundColor: CupertinoColors.white,
        child: Center(
          child: Text("No Music Files Present from the Selected Directory☹️"),
        ),
      );
    }

    return CupertinoScrollbar(
      controller: _scrollController,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: artistNames.length,
        itemBuilder: (context, index) => DisplayListTile(
          text: artistNames[index],
          isSelected: index == selectedDisplayListItem,
        ),
      ),
    );
  }
}
