import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retropod/core/widgets/settings_list_tile.dart';
import 'package:retropod/providers/display_provider.dart';
import 'package:retropod/providers/settings_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDisplayItem = ref.watch(
        displayProvider.select((value) => value.selectedDisplayListItem));
    final settingsData = ref.watch(settingsProvider);
    return ListView(
      children: [
        SettingsListTile(
          text: "Dark Mode",
          isOn: settingsData.isDarkMode,
          isSelected: selectedDisplayItem == 0,
        ),
        SettingsListTile(
          text: "Repeat",
          isOn: settingsData.repeat,
          isSelected: selectedDisplayItem == 1,
        ),
      ],
    );
  }
}
