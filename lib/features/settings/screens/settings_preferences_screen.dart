import 'dart:async';

import 'package:classipod/core/constants/constants.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/features/custom_screen_elements/custom_screen.dart';
import 'package:classipod/features/menu/controller/split_screen_controller.dart';
import 'package:classipod/features/menu/models/split_screen_type.dart';
import 'package:classipod/features/now_playing/provider/now_playing_details_provider.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:classipod/features/settings/models/settings_preferences_model.dart';
import 'package:classipod/features/settings/widgets/settings_list_tile.dart';
import 'package:classipod/features/status_bar/widgets/status_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

enum _SettingsDisplayItems {
  about,
  shuffle,
  repeat,
  language,
  deviceColor,
  clickWheelSize,
  clickWheelSensitivity,
  isTouchScreenEnabled,
  vibrate,
  clickWheelSound,
  volumeMode,
  splitScreenEnabled,
  immersiveMode,
  showAppTutorial,
  rescanMusicFiles,
  excludeDirectories,
  resetSettings,
  donate;

  String title(BuildContext context) {
    switch (this) {
      case about:
        return context.localization.aboutScreenTitle;
      case shuffle:
        return context.localization.shuffleSettingTitle;
      case repeat:
        return context.localization.repeatModeSettingTitle;
      case language:
        return context.localization.languageScreenTitle;
      case isTouchScreenEnabled:
        return context.localization.touchScreenSettingTitle;
      case deviceColor:
        return context.localization.deviceColorSettingTitle;
      case clickWheelSize:
        return context.localization.clickWheelSizeSettingTitle;
      case clickWheelSensitivity:
        return context.localization.clickWheelSensitivitySettingTitle;
      case volumeMode:
        return context.localization.volumeModeSettingTitle;
      case vibrate:
        return context.localization.vibrateSettingTitle;
      case clickWheelSound:
        return context.localization.clickWheelSettingTitle;
      case splitScreenEnabled:
        return context.localization.splitScreenSettingTitle;
      case immersiveMode:
        return context.localization.immersiveModeSettingTitle;
      case showAppTutorial:
        return context.localization.showAppTutorialSettingTitle;
      case rescanMusicFiles:
        return context.localization.rescanMusicFilesSettingTitle;
      case resetSettings:
        return context.localization.resetSettingsTitle;
      case excludeDirectories:
        return context.localization.excludeDirectoriesScreenTitle;
      case donate:
        return context.localization.donateSettingTitle;
    }
  }
}

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen>
    with CustomScreen {
  @override
  String get routeName => Routes.settings.name;

  @override
  List<_SettingsDisplayItems> get displayItems => _SettingsDisplayItems.values;

  @override
  Future<void> onSelectPressed() =>
      _settingAction(displayItems[selectedDisplayItem]);

  Future<void> _settingAction(_SettingsDisplayItems settingItem) async {
    setState(() => selectedDisplayItem = displayItems.indexOf(settingItem));
    switch (settingItem) {
      case _SettingsDisplayItems.about:
        context.goNamed(Routes.about.name);
        break;
      case _SettingsDisplayItems.language:
        context.goNamed(Routes.language.name);
        break;
      case _SettingsDisplayItems.shuffle:
        await ref.read(audioPlayerServiceProvider.notifier).toggleShuffleMode();
        break;
      case _SettingsDisplayItems.repeat:
        await ref
            .read(settingsPreferencesControllerProvider.notifier)
            .toggleRepeatMode();
        break;
      case _SettingsDisplayItems.deviceColor:
        await ref
            .read(settingsPreferencesControllerProvider.notifier)
            .toggleDeviceColor();
        break;
      case _SettingsDisplayItems.clickWheelSize:
        await ref
            .read(settingsPreferencesControllerProvider.notifier)
            .toggleClickWheelSize();
        break;
      case _SettingsDisplayItems.clickWheelSensitivity:
        await ref
            .read(settingsPreferencesControllerProvider.notifier)
            .toggleClickWheelSensitivity();
        break;
      case _SettingsDisplayItems.isTouchScreenEnabled:
        await ref
            .read(settingsPreferencesControllerProvider.notifier)
            .toggleTouchScreen();
        break;
      case _SettingsDisplayItems.vibrate:
        await ref
            .read(settingsPreferencesControllerProvider.notifier)
            .toggleVibrate();
        break;
      case _SettingsDisplayItems.clickWheelSound:
        await ref
            .read(settingsPreferencesControllerProvider.notifier)
            .toggleClickWheelSound(context);
        break;
      case _SettingsDisplayItems.volumeMode:
        await ref
            .read(settingsPreferencesControllerProvider.notifier)
            .toggleVolumeMode();
        break;
      case _SettingsDisplayItems.splitScreenEnabled:
        await ref
            .read(settingsPreferencesControllerProvider.notifier)
            .toggleSplitScreen();
        break;
      case _SettingsDisplayItems.immersiveMode:
        await ref
            .read(settingsPreferencesControllerProvider.notifier)
            .toggleImmersiveMode();
        break;
      case _SettingsDisplayItems.showAppTutorial:
        await ref
            .read(settingsPreferencesControllerProvider.notifier)
            .showAppTutorial();
        break;
      case _SettingsDisplayItems.rescanMusicFiles:
        await ref
            .read(settingsPreferencesControllerProvider.notifier)
            .rescanMusicFiles();
        break;
      case _SettingsDisplayItems.excludeDirectories:
        context.goNamed(Routes.excludeDirectories.name);
        break;
      case _SettingsDisplayItems.resetSettings:
        await ref
            .read(settingsPreferencesControllerProvider.notifier)
            .resetSettings();
        break;
      case _SettingsDisplayItems.donate:
        await launchUrl(
          Uri.parse(Constants.donationLinkUrl),
          mode: LaunchMode.externalApplication,
        );
        break;
    }
  }

  bool? _isOn(
    SettingsPreferencesModel settingsState,
    _SettingsDisplayItems settingsItem,
  ) {
    switch (settingsItem) {
      case _SettingsDisplayItems.shuffle:
        return ref.watch(nowPlayingDetailsProvider).isShuffleEnabled;
      case _SettingsDisplayItems.isTouchScreenEnabled:
        return settingsState.isTouchScreenEnabled;
      case _SettingsDisplayItems.vibrate:
        return settingsState.vibrate;
      case _SettingsDisplayItems.clickWheelSound:
        return settingsState.clickWheelSound;
      case _SettingsDisplayItems.splitScreenEnabled:
        return settingsState.splitScreenEnabled;
      case _SettingsDisplayItems.immersiveMode:
        return settingsState.immersiveMode;
      default:
        return null;
    }
  }

  String? _getValue(
    SettingsPreferencesModel settingsState,
    _SettingsDisplayItems settingsItem,
  ) {
    switch (settingsItem) {
      case _SettingsDisplayItems.deviceColor:
        return settingsState.deviceColor.title(context);
      case _SettingsDisplayItems.clickWheelSize:
        return settingsState.clickWheelSize.title(context);
      case _SettingsDisplayItems.clickWheelSensitivity:
        return settingsState.clickWheelSensitivity.title(context);
      case _SettingsDisplayItems.repeat:
        return settingsState.repeatMode.title(context);
      case _SettingsDisplayItems.volumeMode:
        return settingsState.volumeMode.title(context);
      default:
        final bool? isOn = _isOn(settingsState, settingsItem);
        if (isOn != null) {
          if (isOn) {
            return context.localization.tileValueOn;
          } else {
            return context.localization.tileValueOff;
          }
        }
        return null;
    }
  }

  Future<void> _changeSplitScreenType() async {
    await Future.delayed(const Duration(milliseconds: 150));
    switch (displayItems[selectedDisplayItem]) {
      case _SettingsDisplayItems.language:
        ref.read(splitScreenControllerProvider.notifier).changeSplitScreenType =
            SplitScreenType.language;
        break;

      case _SettingsDisplayItems.deviceColor:
        ref.read(splitScreenControllerProvider.notifier).changeSplitScreenType =
            SplitScreenType.deviceColor;
        break;
      case _SettingsDisplayItems.clickWheelSize:
        ref.read(splitScreenControllerProvider.notifier).changeSplitScreenType =
            SplitScreenType.clickWheelSize;
        break;
      case _SettingsDisplayItems.clickWheelSensitivity:
        ref.read(splitScreenControllerProvider.notifier).changeSplitScreenType =
            SplitScreenType.clickWheelSensitivity;
        break;
      case _SettingsDisplayItems.isTouchScreenEnabled:
        ref.read(splitScreenControllerProvider.notifier).changeSplitScreenType =
            SplitScreenType.touchScreen;
        break;
      case _SettingsDisplayItems.shuffle:
        ref.read(splitScreenControllerProvider.notifier).changeSplitScreenType =
            SplitScreenType.shuffle;
        break;
      case _SettingsDisplayItems.repeat:
        ref.read(splitScreenControllerProvider.notifier).changeSplitScreenType =
            SplitScreenType.repeat;
        break;
      case _SettingsDisplayItems.vibrate:
        ref.read(splitScreenControllerProvider.notifier).changeSplitScreenType =
            SplitScreenType.vibrate;
        break;
      case _SettingsDisplayItems.clickWheelSound:
        ref.read(splitScreenControllerProvider.notifier).changeSplitScreenType =
            SplitScreenType.clickWheelSound;
        break;
      case _SettingsDisplayItems.volumeMode:
        ref.read(splitScreenControllerProvider.notifier).changeSplitScreenType =
            SplitScreenType.volumeMode;
        break;
      case _SettingsDisplayItems.splitScreenEnabled:
        ref.read(splitScreenControllerProvider.notifier).changeSplitScreenType =
            SplitScreenType.splitScreenMode;
        break;
      case _SettingsDisplayItems.immersiveMode:
        ref.read(splitScreenControllerProvider.notifier).changeSplitScreenType =
            SplitScreenType.immersiveMode;
        break;
      case _SettingsDisplayItems.showAppTutorial:
        ref.read(splitScreenControllerProvider.notifier).changeSplitScreenType =
            SplitScreenType.showTutorialScreen;
        break;
      case _SettingsDisplayItems.rescanMusicFiles:
        ref.read(splitScreenControllerProvider.notifier).changeSplitScreenType =
            SplitScreenType.rescanMusicFiles;
        break;
      case _SettingsDisplayItems.excludeDirectories:
        ref.read(splitScreenControllerProvider.notifier).changeSplitScreenType =
            SplitScreenType.excludeDirectories;
        break;
      case _SettingsDisplayItems.resetSettings:
        ref.read(splitScreenControllerProvider.notifier).changeSplitScreenType =
            SplitScreenType.resetSettings;
        break;
      case _SettingsDisplayItems.donate:
        ref.read(splitScreenControllerProvider.notifier).changeSplitScreenType =
            SplitScreenType.donate;
        break;
      default:
        ref.read(splitScreenControllerProvider.notifier).changeSplitScreenType =
            SplitScreenType.settings;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final settingsState = ref.watch(settingsPreferencesControllerProvider);

    unawaited(_changeSplitScreenType());

    return CupertinoPageScaffold(
      child: Column(
        children: [
          StatusBar(title: Routes.settings.title(context)),
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
                itemBuilder:
                    (context, index) => SettingsListTile(
                      text: displayItems[index].title(context),
                      value: _getValue(settingsState, displayItems[index]),
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
