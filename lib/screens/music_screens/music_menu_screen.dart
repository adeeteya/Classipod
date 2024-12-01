import 'package:classipod/core/custom_screen.dart';
import 'package:classipod/core/extensions.dart';
import 'package:classipod/core/routes.dart';
import 'package:classipod/core/widgets/display_list_tile.dart';
import 'package:classipod/screens/status_bar/status_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum _MusicListDisplayItems {
  coverFlow,
  artists,
  albums,
  songs,
}

class MusicMenuScreen extends ConsumerStatefulWidget {
  const MusicMenuScreen({super.key});

  @override
  ConsumerState createState() => _MusicMenuScreenState();
}

class _MusicMenuScreenState extends ConsumerState<MusicMenuScreen>
    with CustomScreen {
  @override
  String get routeName => Routes.music.name;

  @override
  List<String> get displayItems =>
      _MusicListDisplayItems.values.map((e) => e.title).toList();

  @override
  void onSelectPressed() {
    switch (_MusicListDisplayItems.values[selectedDisplayItem]) {
      case _MusicListDisplayItems.coverFlow:
        context.goNamed(Routes.coverFlow.name);
        break;
      case _MusicListDisplayItems.artists:
        context.goNamed(Routes.artists.name);
        break;
      case _MusicListDisplayItems.albums:
        context.goNamed(Routes.albums.name);
        break;
      case _MusicListDisplayItems.songs:
        context.goNamed(Routes.songs.name);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        children: [
          StatusBar(
            title: Routes.music.title,
          ),
          Flexible(
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
