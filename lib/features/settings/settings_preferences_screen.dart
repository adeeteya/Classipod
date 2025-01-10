import 'package:classipod/features/settings/settings_preferences_controller.dart';
import 'package:classipod/core/custom_screen.dart';
import 'package:classipod/core/extensions.dart';
import 'package:classipod/core/routes.dart';
import 'package:classipod/core/widgets/settings_list_tile.dart';
import 'package:classipod/features/settings/settings_preferences.dart';
import 'package:classipod/features/settings/settings_preferences_provider.dart';
import 'package:classipod/screens/status_bar/status_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

enum _SettingsDisplayItems {
  about,
  darkMode,
  repeat,
  vibrate,
  clickWheelSound,
  immersiveMode,
  changeDirectory,
  donate,
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
  List<String> get displayItems =>
      _SettingsDisplayItems.values.map((e) => e.title).toList();

  @override
  Future<void> onSelectPressed() async {
    switch (_SettingsDisplayItems.values[selectedDisplayItem]) {
      case _SettingsDisplayItems.about:
        context.goNamed(Routes.about.name);
        break;
      case _SettingsDisplayItems.darkMode:
        await ref
            .read(settingsPreferencesControllerProvider.notifier)
            .toggleTheme();
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
      case _SettingsDisplayItems.immersiveMode:
        await ref
            .read(settingsPreferencesControllerProvider.notifier)
            .toggleImmersiveMode();
        break;
      case _SettingsDisplayItems.changeDirectory:
        await ref
            .read(settingsPreferencesControllerProvider.notifier)
            .setNewMusicFolderPath();
        break;
      case _SettingsDisplayItems.donate:
        await launchUrl(
          Uri.parse("https://www.paypal.me/adeeteya"),
          mode: LaunchMode.externalApplication,
        );
        break;
    }
  }

  bool? isOn(
    SettingsPreferences settingsState,
    _SettingsDisplayItems settingsItem,
  ) {
    switch (settingsItem) {
      case _SettingsDisplayItems.darkMode:
        return settingsState.isDarkMode;
      case _SettingsDisplayItems.repeat:
        return settingsState.repeat;
      case _SettingsDisplayItems.vibrate:
        return settingsState.vibrate;
      case _SettingsDisplayItems.clickWheelSound:
        return settingsState.clickWheelSound;
      case _SettingsDisplayItems.immersiveMode:
        return settingsState.immersiveMode;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final settingsState = ref.watch(settingsPreferencesProvider);
    return CupertinoPageScaffold(
      child: Column(
        children: [
          StatusBar(
            title: Routes.settings.title,
          ),
          Flexible(
            child: CupertinoScrollbar(
              controller: scrollController,
              child: ListView.builder(
                controller: scrollController,
                itemCount: displayItems.length,
                itemBuilder: (context, index) => SettingsListTile(
                  text: displayItems[index],
                  isOn:
                      isOn(settingsState, _SettingsDisplayItems.values[index]),
                  isSelected: selectedDisplayItem == index,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
