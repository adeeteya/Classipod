import 'dart:async';

import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/features/custom_screen_elements/custom_screen.dart';
import 'package:classipod/features/menu/controller/split_screen_controller.dart';
import 'package:classipod/features/menu/models/split_screen_type.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:classipod/features/settings/widgets/settings_list_tile.dart';
import 'package:classipod/features/status_bar/widgets/status_bar.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum _LibrarySettingsItems {
  reindex,
  refreshLibrary,
  excludeDirectories;

  String title(BuildContext context) => switch (this) {
    excludeDirectories => context.localization.excludeDirectoriesScreenTitle,
    reindex => context.localization.reindexLibrarySettingTitle,
    refreshLibrary => context.localization.refreshLibrarySettingTitle,
  };

  SplitScreenType get preview => switch (this) {
    excludeDirectories => SplitScreenType.excludeDirectories,
    reindex => SplitScreenType.rescanMusicFiles,
    refreshLibrary => SplitScreenType.refreshLibrary,
  };
}

class LibrarySettingsScreen extends ConsumerStatefulWidget {
  const LibrarySettingsScreen({super.key});

  @override
  ConsumerState<LibrarySettingsScreen> createState() =>
      _LibrarySettingsScreenState();
}

class _LibrarySettingsScreenState extends ConsumerState<LibrarySettingsScreen>
    with CustomScreen {
  @override
  String get routeName => Routes.librarySettings.name;

  @override
  List<_LibrarySettingsItems> get displayItems => _LibrarySettingsItems.values;

  @override
  Future<void> onSelectPressed() =>
      _settingAction(displayItems[selectedDisplayItem]);

  Future<void> _settingAction(_LibrarySettingsItems item) async {
    setState(() => selectedDisplayItem = displayItems.indexOf(item));
    switch (item) {
      case _LibrarySettingsItems.excludeDirectories:
        context.goNamed(Routes.excludeDirectories.name);
        break;
      case _LibrarySettingsItems.reindex:
        await ref
            .read(settingsPreferencesControllerProvider.notifier)
            .rescanMusicFiles();
        break;
      case _LibrarySettingsItems.refreshLibrary:
        await ref
            .read(settingsPreferencesControllerProvider.notifier)
            .refreshLibrary();
        break;
    }
  }

  Future<void> _changeSplitScreenType() async {
    await Future<void>.delayed(const Duration(milliseconds: 150));
    if (!mounted || GoRouterState.of(context).name != routeName) return;
    ref.read(splitScreenControllerProvider.notifier).changeSplitScreenType =
        displayItems[selectedDisplayItem].preview;
  }

  @override
  Widget build(BuildContext context) {
    unawaited(_changeSplitScreenType());

    return CupertinoPageScaffold(
      child: Column(
        children: [
          StatusBar(title: Routes.librarySettings.title(context)),
          Flexible(
            child: CupertinoScrollbar(
              controller: scrollController,
              child: ListView.builder(
                controller: scrollController,
                itemCount: displayItems.length,
                prototypeItem: SettingsListTile(
                  text: '',
                  isSelected: false,
                  onTap: () {},
                ),
                itemBuilder: (context, index) => SettingsListTile(
                  text: displayItems[index].title(context),
                  isSelected: selectedDisplayItem == index,
                  onTap: () async => _settingAction(displayItems[index]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
