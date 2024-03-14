import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retropod/core/widgets/display_list_tile.dart';
import 'package:retropod/providers/display_provider.dart';

class MusicMenuScreen extends ConsumerStatefulWidget {
  const MusicMenuScreen({super.key});

  @override
  ConsumerState createState() => _MusicMenuScreenState();
}

class _MusicMenuScreenState extends ConsumerState<MusicMenuScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
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
    return ListView.builder(
      controller: _scrollController,
      itemCount:
          ref.read(displayProvider.notifier).musicListDisplayItems.length,
      itemBuilder: (context, index) => DisplayListTile(
        text: ref.read(displayProvider.notifier).musicListDisplayItems[index],
        isSelected: selectedDisplayListItem == index,
      ),
    );
  }
}
