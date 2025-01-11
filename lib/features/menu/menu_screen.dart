import 'package:classipod/core/custom_screen.dart';
import 'package:classipod/core/extensions.dart';
import 'package:classipod/core/routes.dart';
import 'package:classipod/core/widgets/display_list_tile.dart';
import 'package:classipod/features/status_bar/status_bar.dart';
import 'package:classipod/services/audio_player_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum _MenuDisplayItems {
  music,
  nowPlaying,
  shuffleSongs,
  settings,
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
  List<String> get displayItems =>
      _MenuDisplayItems.values.map((e) => e.title).toList();

  @override
  void onMenuButtonPressed() {
    return;
  }

  @override
  Future<void> onSelectPressed() async {
    switch (_MenuDisplayItems.values[selectedDisplayItem]) {
      case _MenuDisplayItems.music:
        context.goNamed(Routes.music.name);
        break;
      case _MenuDisplayItems.nowPlaying:
        context.goNamed(Routes.nowPlaying.name);
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
      case _MenuDisplayItems.settings:
        context.goNamed(Routes.settings.name);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        children: [
          StatusBar(
            title: Routes.menu.title,
          ),
          Expanded(
            child: CupertinoScrollbar(
              controller: scrollController,
              child: ListView.builder(
                controller: scrollController,
                itemCount: displayItems.length,
                itemBuilder: (context, index) => DisplayListTile(
                  text: displayItems[index],
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
