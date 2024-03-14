import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retropod/core/widgets/settings_list_tile.dart';
import 'package:retropod/providers/display_provider.dart';
import 'package:retropod/providers/settings_provider.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  final ScrollController _scrollController = ScrollController();
  late final List<String> settingsTiles;

  @override
  void initState() {
    settingsTiles = ref.read(settingsProvider.notifier).settingsListTiles;
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
    ref.watch(settingsProvider);
    return CupertinoScrollbar(
      controller: _scrollController,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: settingsTiles.length,
        itemBuilder: (context, index) => SettingsListTile(
          text: settingsTiles[index],
          isOn: ref.read(settingsProvider.notifier).isOn(index),
          isSelected: selectedDisplayListItem == index,
        ),
      ),
    );
  }
}
