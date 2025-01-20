import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/core/widgets/display_list_tile.dart';
import 'package:classipod/features/custom_screen_widgets/custom_screen.dart';
import 'package:classipod/features/status_bar/widgets/status_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum _MenuDisplayItems {
  music,
  nowPlaying,
  settings,
  shuffleSongs;

  String title(BuildContext context) {
    switch (this) {
      case music:
        return context.localization.musicMenuScreenTitle;
      case nowPlaying:
        return context.localization.nowPlayingScreenTitle;
      case settings:
        return context.localization.settingsScreenTitle;
      case shuffleSongs:
        return context.localization.shuffleSongsMenuTitle;
    }
  }
}

class MenuScreen extends ConsumerStatefulWidget {
  const MenuScreen({super.key});

  @override
  ConsumerState createState() => _MenuScreenState();
}

class _MenuScreenState extends ConsumerState<MenuScreen> with CustomScreen {
  @override
  String get routeName => Routes.menu.name;

  @override
  List<_MenuDisplayItems> get displayItems => _MenuDisplayItems.values;

  @override
  void onMenuButtonPressed() {
    return;
  }

  @override
  Future<void> onSelectPressed() =>
      _navigateToScreen(_MenuDisplayItems.values[selectedDisplayItem]);

  Future<void> _navigateToScreen(_MenuDisplayItems menuItem) async {
    setState(() => selectedDisplayItem = displayItems.indexOf(menuItem));
    switch (menuItem) {
      case _MenuDisplayItems.music:
        context.goNamed(Routes.music.name);
        break;
      case _MenuDisplayItems.nowPlaying:
        context.goNamed(Routes.nowPlaying.name);
        break;
      case _MenuDisplayItems.settings:
        context.goNamed(Routes.settings.name);
        break;
      case _MenuDisplayItems.shuffleSongs:
        await ref
            .read(audioPlayerServiceProvider.notifier)
            .shuffle()
            .then((value) {
          if (mounted) {
            context.goNamed(Routes.nowPlaying.name);
          }
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        children: [
          StatusBar(
            title: Routes.menu.title(context),
          ),
          Expanded(
            child: CupertinoScrollbar(
              controller: scrollController,
              child: ListView.builder(
                controller: scrollController,
                itemCount: displayItems.length,
                itemBuilder: (context, index) => DisplayListTile(
                  text: displayItems[index].title(context),
                  isSelected: selectedDisplayItem == index,
                  onTap: () async => _navigateToScreen(displayItems[index]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
