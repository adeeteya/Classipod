import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/features/custom_screen_elements/custom_screen.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:classipod/features/settings/models/click_wheel_size.dart';
import 'package:classipod/features/settings/models/screen_usage.dart';
import 'package:classipod/features/settings/widgets/settings_list_tile.dart';
import 'package:classipod/features/status_bar/widgets/status_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScreenUsageSelectionScreen extends ConsumerStatefulWidget {
  const ScreenUsageSelectionScreen({super.key});

  @override
  ConsumerState createState() => _ScreenUsageSelectionScreenState();
}

class _ScreenUsageSelectionScreenState extends ConsumerState with CustomScreen {
  @override
  String get routeName => Routes.screenUsage.name;

  List<int> _options = ScreenUsage.allOptions;

  @override
  List<int> get displayItems => _options;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final ClickWheelSize clickWheelSize = ref
        .read(settingsPreferencesControllerProvider)
        .clickWheelSize;
    _options = ScreenUsage.optionsFor(context, clickWheelSize);
    final int currentPercentage = ref
        .read(settingsPreferencesControllerProvider)
        .screenUsagePercentage;
    final int currentIndex = _options.indexOf(currentPercentage);
    selectedDisplayItem = currentIndex == -1
        ? _options.length - 1
        : currentIndex;
  }

  @override
  Future<void> onSelectPressed() => _selectScreenUsage(selectedDisplayItem);

  Future<void> _selectScreenUsage(int index) async {
    setState(() => selectedDisplayItem = index);
    await ref
        .read(settingsPreferencesControllerProvider.notifier)
        .setScreenUsagePercentage(displayItems[index]);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        children: [
          StatusBar(title: Routes.screenUsage.title(context)),
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
                  text: ScreenUsage.title(displayItems[index]),
                  isSelected: selectedDisplayItem == index,
                  onTap: () async => _selectScreenUsage(index),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
