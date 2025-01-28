import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/extensions/locale_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/widgets/display_list_tile.dart';
import 'package:classipod/features/custom_screen_widgets/custom_screen.dart';
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
    final splitScreenEnabled = ref.watch(
      currentSettingsPreferencesProvider.select(
        (value) => value.splitScreenEnabled,
      ),
    );

    return CupertinoPageScaffold(
      child: Row(
        children: [
          Expanded(
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
          ),
          if (splitScreenEnabled)
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppPalette.emptyScreenGradient1,
                        AppPalette.emptyScreenGradient2,
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          left: 0,
                          top: 20,
                          child: Text(
                            "Bienvenue",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppPalette.emptyScreenLightIconColor
                                  .withValues(alpha: 0.5),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                          right: -25,
                          top: 40,
                          child: Text(
                            "欢迎",
                            style: TextStyle(
                              fontSize: 30,
                              color: AppPalette.emptyScreenLightIconColor
                                  .withValues(alpha: 0.5),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                          right: -30,
                          bottom: 20,
                          child: Text(
                            "Willkomen",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppPalette.emptyScreenLightIconColor
                                  .withValues(alpha: 0.5),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Center(
                          child: Text(
                            "Welcome",
                            style: TextStyle(
                              fontSize: 25,
                              color: CupertinoColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
