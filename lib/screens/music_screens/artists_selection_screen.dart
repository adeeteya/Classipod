import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retropod/core/widgets/display_list_tile.dart';
import 'package:retropod/providers/display_provider.dart';
import 'package:retropod/providers/music_provider.dart';

class ArtistsSelectionScreen extends ConsumerStatefulWidget {
  const ArtistsSelectionScreen({super.key});

  @override
  ConsumerState createState() => _ArtistsSelectionScreenState();
}

class _ArtistsSelectionScreenState
    extends ConsumerState<ArtistsSelectionScreen> {
  final ScrollController _scrollController = ScrollController();
  late final List<String> artistNames;

  @override
  void initState() {
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
