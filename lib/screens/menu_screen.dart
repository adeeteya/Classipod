import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retropod/core/widgets/display_list_tile.dart';
import 'package:retropod/providers/display_provider.dart';

class MenuScreen extends ConsumerWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDisplayItem = ref.watch(
        displayProvider.select((value) => value.selectedDisplayListItem));
    return ListView(
      children: [
        DisplayListTile(text: "Music", isSelected: selectedDisplayItem == 0),
        DisplayListTile(
            text: "Now Playing", isSelected: selectedDisplayItem == 1),
        DisplayListTile(
            text: "Shuffle Songs", isSelected: selectedDisplayItem == 2),
        DisplayListTile(text: "Settings", isSelected: selectedDisplayItem == 3),
      ],
    );
  }
}
