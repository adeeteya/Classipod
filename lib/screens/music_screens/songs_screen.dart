import 'package:classipod/core/custom_screen.dart';
import 'package:classipod/core/extensions.dart';
import 'package:classipod/core/routes.dart';
import 'package:classipod/core/widgets/song_list_tile.dart';
import 'package:classipod/features/status_bar/status_bar.dart';
import 'package:classipod/models/metadata.dart';
import 'package:classipod/providers/music_provider.dart';
import 'package:classipod/screens/no_music_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SongsScreen extends ConsumerStatefulWidget {
  const SongsScreen({super.key});

  @override
  ConsumerState createState() => _SongsScreenState();
}

class _SongsScreenState extends ConsumerState<SongsScreen> with CustomScreen {
  @override
  double get displayTileHeight => 40;

  @override
  String get routeName => Routes.songs.name;

  @override
  List<Metadata> get displayItems =>
      ref.read(musicProvider.notifier).completeMusicFileMetaDataList;

  @override
  Future<void> onSelectPressed() async {
    await ref.read(musicProvider.notifier).playAtIndex(selectedDisplayItem);
    if (mounted) {
      await context.pushNamed(Routes.nowPlaying.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (displayItems.isEmpty) {
      return NoMusicScreen(
        title: Routes.songs.title,
      );
    }

    return CupertinoPageScaffold(
      child: Column(
        children: [
          StatusBar(
            title: Routes.songs.title,
          ),
          Flexible(
            child: CupertinoScrollbar(
              controller: scrollController,
              child: ListView.builder(
                controller: scrollController,
                itemCount: displayItems.length,
                itemBuilder: (context, index) => SongListTile(
                  songName: displayItems[index].trackName,
                  trackArtistNames: displayItems[index].getTrackArtistNames,
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
