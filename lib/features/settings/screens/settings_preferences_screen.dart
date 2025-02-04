import 'package:classipod/core/constants/constants.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/features/custom_screen_widgets/custom_screen.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:classipod/features/settings/model/settings_preferences.dart';
import 'package:classipod/features/settings/screens/widgets/settings_list_tile.dart';
import 'package:classipod/features/status_bar/widgets/status_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

enum _SettingsDisplayItems {
  about,
  language,
  deviceColor,
  isTouchScreenEnabled,
  repeat,
  vibrate,
  clickWheelSound,
  splitScreenEnabled,
  immersiveMode,
  changeDirectory,
  resetSettings,
  donate;

  String title(BuildContext context) {
    switch (this) {
      case about:
        return context.localization.aboutScreenTitle;
      case language:
        return context.localization.languageScreenTitle;
      case isTouchScreenEnabled:
        return context.localization.touchScreenSettingTitle;
      case deviceColor:
        return context.localization.deviceColorSettingTitle;
      case repeat:
        return context.localization.repeatModeSettingTitle;
      case vibrate:
        return context.localization.vibrateSettingTitle;
      case clickWheelSound:
        return context.localization.clickWheelSettingTitle;
      case splitScreenEnabled:
        return context.localization.splitScreenSettingTitle;
      case immersiveMode:
        return context.localization.immersiveModeSettingTitle;
      case changeDirectory:
        return context.localization.changeDirectorySettingTitle;
      case resetSettings:
        return context.localization.resetSettingsTitle;
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
      case _SettingsDisplayItems.deviceColor:
        await ref
            .read(settingsPreferencesControllerProvider.notifier)
            .toggleDeviceColor();
        break;
      case _SettingsDisplayItems.isTouchScreenEnabled:
        await ref
            .read(settingsPreferencesControllerProvider.notifier)
            .toggleTouchScreen();
        break;
      case _SettingsDisplayItems.repeat:
        await ref
            .read(settingsPreferencesControllerProvider.notifier)
            .toggleRepeat();
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
      case _SettingsDisplayItems.changeDirectory:
        await ref
            .read(settingsPreferencesControllerProvider.notifier)
            .setNewMusicFolderPath();
        if (mounted) {
          context.goNamed(Routes.splash.name);
        }
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
    SettingsPreferences settingsState,
    _SettingsDisplayItems settingsItem,
  ) {
    switch (settingsItem) {
      case _SettingsDisplayItems.isTouchScreenEnabled:
        return settingsState.isTouchScreenEnabled;
      case _SettingsDisplayItems.repeat:
        return settingsState.repeat;
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
    SettingsPreferences settingsState,
    _SettingsDisplayItems settingsItem,
  ) {
    switch (settingsItem) {
      case _SettingsDisplayItems.deviceColor:
        return ref
            .read(settingsPreferencesControllerProvider)
            .deviceColor
            .title(context);
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

  @override
  Widget build(BuildContext context) {
    final settingsState = ref.watch(settingsPreferencesControllerProvider);
    return CupertinoPageScaffold(
      child: Column(
        children: [
          StatusBar(
            title: Routes.settings.title(context),
          ),
          Flexible(
            child: CupertinoScrollbar(
              controller: scrollController,
              child: ListView.builder(
                controller: scrollController,
                itemCount: displayItems.length,
                itemBuilder: (context, index) => SettingsListTile(
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
