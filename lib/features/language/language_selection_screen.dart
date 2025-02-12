import 'package:classipod/core/extensions/locale_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/widgets/display_list_tile.dart';
import 'package:classipod/features/custom_screen_elements/custom_screen.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:classipod/features/status_bar/widgets/status_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageSelectionScreen extends ConsumerStatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  ConsumerState createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState
    extends ConsumerState<LanguageSelectionScreen> with CustomScreen {
  @override
  String get routeName => Routes.language.name;

  @override
  List<Locale> get displayItems => AppLocalizations.supportedLocales;

  @override
  Future<void> onSelectPressed() => _selectLanguage(selectedDisplayItem);

  Future<void> _selectLanguage(int index) async {
    setState(() => selectedDisplayItem = index);
    await ref
        .read(settingsPreferencesControllerProvider.notifier)
        .setLanguage(displayItems[index]);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        children: [
          StatusBar(
            title: Routes.language.title(context),
          ),
          Flexible(
            child: CupertinoScrollbar(
              controller: scrollController,
              child: ListView.builder(
                controller: scrollController,
                itemCount: displayItems.length,
                itemBuilder: (context, index) => DisplayListTile(
                  text: displayItems[index].getNativeLanguageName(),
                  isSelected: selectedDisplayItem == index,
                  onTap: () async => _selectLanguage(index),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
