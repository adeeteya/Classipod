import 'dart:async';

import 'package:classipod/core/alerts/dialogs.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/extensions/go_router_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/repositories/library/missing_tracks_provider.dart';
import 'package:classipod/core/services/audio_files_service.dart';
import 'package:classipod/core/subsonic/subsonic_controller.dart';
import 'package:classipod/features/custom_screen_elements/custom_screen.dart';
import 'package:classipod/features/menu/controller/split_screen_controller.dart';
import 'package:classipod/features/menu/models/split_screen_type.dart';
import 'package:classipod/features/settings/controller/hide_local_music_controller.dart';
import 'package:classipod/features/settings/controller/prevent_duplicate_tracks_controller.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:classipod/features/settings/widgets/settings_list_tile.dart';
import 'package:classipod/features/settings/widgets/subsonic_dialog.dart';
import 'package:classipod/features/status_bar/widgets/status_bar.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum _LibrarySettingsItems {
  subsonic,
  configureSubsonic,
  hideLocalMusic,
  preventDuplicateTracks,
  reindex,
  refreshLibrary,
  missingTracks,
  excludeDirectories;

  String title(BuildContext context) => switch (this) {
    subsonic => context.localization.subsonicTitle,
    preventDuplicateTracks => context.localization.preventDuplicateTracksTitle,
    hideLocalMusic => context.localization.hideLocalMusicTitle,
    missingTracks => context.localization.missingTracksTitle,
    configureSubsonic => context.localization.subsonicConfigure,
    excludeDirectories => context.localization.excludeDirectoriesScreenTitle,
    reindex => context.localization.reindexLibrarySettingTitle,
    refreshLibrary => context.localization.refreshLibrarySettingTitle,
  };

  SplitScreenType get preview => switch (this) {
    subsonic || configureSubsonic => SplitScreenType.subsonic,
    hideLocalMusic => SplitScreenType.hideLocalMusic,
    preventDuplicateTracks => SplitScreenType.preventDuplicateTracks,
    excludeDirectories => SplitScreenType.excludeDirectories,
    missingTracks => SplitScreenType.missingTracks,
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
  bool _handlingSetting = false;
  List<_LibrarySettingsItems> _displayItems = [
    for (final item in _LibrarySettingsItems.values)
      if (item != _LibrarySettingsItems.configureSubsonic &&
          item != _LibrarySettingsItems.hideLocalMusic &&
          item != _LibrarySettingsItems.missingTracks)
        item,
  ];
  @override
  String get routeName => Routes.librarySettings.name;

  @override
  List<_LibrarySettingsItems> get displayItems => _displayItems;

  @override
  Future<void> onSelectPressed() =>
      _settingAction(displayItems[selectedDisplayItem]);

  Future<void> _settingAction(_LibrarySettingsItems item) async {
    if (_handlingSetting) return;
    _handlingSetting = true;
    try {
      setState(() => selectedDisplayItem = displayItems.indexOf(item));
      switch (item) {
        case _LibrarySettingsItems.subsonic:
          final controller = ref.read(subsonicControllerProvider.notifier);
          final enabled =
              ref.read(subsonicControllerProvider).value?.enabled ?? false;
          try {
            if (!await controller.setEnabled(!enabled) && mounted) {
              await showSubsonicDialog(context);
            }
          } catch (_) {
            if (mounted) {
              await Dialogs.showInfoDialog(
                context: context,
                title: context.localization.subsonicTitle,
                content: context.localization.subsonicStorageError,
              );
            }
          }
          break;
        case _LibrarySettingsItems.preventDuplicateTracks:
          await ref
              .read(preventDuplicateTracksProvider.notifier)
              .setEnabled(!ref.read(preventDuplicateTracksProvider));
          break;
        case _LibrarySettingsItems.hideLocalMusic:
          await ref
              .read(hideLocalMusicProvider.notifier)
              .setHidden(!ref.read(hideLocalMusicProvider));
          break;
        case _LibrarySettingsItems.configureSubsonic:
          await showSubsonicDialog(context);
          break;
        case _LibrarySettingsItems.missingTracks:
          context.goNamed(Routes.missingTracks.name);
          break;
        case _LibrarySettingsItems.excludeDirectories:
          context.goNamed(Routes.excludeDirectories.name);
          break;
        case _LibrarySettingsItems.reindex:
          if (!await _ensureSignedIn()) return;
          await ref
              .read(settingsPreferencesControllerProvider.notifier)
              .rescanMusicFiles();
          break;
        case _LibrarySettingsItems.refreshLibrary:
          if (!await _ensureSignedIn()) return;
          await ref
              .read(settingsPreferencesControllerProvider.notifier)
              .refreshLibrary();
          break;
      }
    } finally {
      _handlingSetting = false;
    }
  }

  Future<bool> _ensureSignedIn() async {
    final remote = ref.read(subsonicControllerProvider).value;
    if (remote?.enabled == true && remote?.signedIn != true) {
      await showSubsonicDialog(context);
      return ref.read(subsonicControllerProvider).value?.signedIn == true;
    }
    return true;
  }

  Future<void> _changeSplitScreenType() async {
    await Future<void>.delayed(const Duration(milliseconds: 150));
    if (!mounted || context.router.locationNamed != routeName) return;
    ref.read(splitScreenControllerProvider.notifier).changeSplitScreenType =
        displayItems[selectedDisplayItem].preview;
  }

  @override
  Widget build(BuildContext context) {
    unawaited(_changeSplitScreenType());
    final preventDuplicates = ref.watch(preventDuplicateTracksProvider);
    final hideLocalMusic = ref.watch(hideLocalMusicProvider);
    final remote = ref.watch(subsonicControllerProvider).value;
    final local = ref.watch(localLibraryProvider);
    final missingTracks = ref.watch(missingTracksProvider);
    final selectedItem = displayItems[selectedDisplayItem];
    _displayItems = [
      for (final item in _LibrarySettingsItems.values)
        if (((item != _LibrarySettingsItems.configureSubsonic &&
                    item != _LibrarySettingsItems.hideLocalMusic) ||
                remote?.enabled == true) &&
            (item != _LibrarySettingsItems.missingTracks ||
                missingTracks.isNotEmpty))
          item,
    ];
    final selectedIndex = displayItems.indexOf(selectedItem);
    selectedDisplayItem = selectedIndex < 0 ? 0 : selectedIndex;

    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      child: Column(
        children: [
          StatusBar(title: Routes.librarySettings.title(context)),
          if (local.hasError)
            Padding(
              padding: const EdgeInsets.all(4),
              child: Text(context.localization.libraryLoadError),
            ),
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
                  value: displayItems[index] == _LibrarySettingsItems.subsonic
                      ? remote?.enabled == true
                            ? context.localization.subsonicOn
                            : context.localization.subsonicOff
                      : displayItems[index] ==
                            _LibrarySettingsItems.hideLocalMusic
                      ? hideLocalMusic
                            ? context.localization.subsonicOn
                            : context.localization.subsonicOff
                      : displayItems[index] ==
                            _LibrarySettingsItems.preventDuplicateTracks
                      ? preventDuplicates
                            ? context.localization.subsonicOn
                            : context.localization.subsonicOff
                      : null,
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
