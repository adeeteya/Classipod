import 'package:classipod/core/models/metadata.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/core/widgets/no_music_widget.dart';
import 'package:classipod/features/custom_screen_widgets/custom_screen.dart';
import 'package:classipod/features/music/songs/song_list_tile.dart';
import 'package:classipod/features/music/songs/songs_provider.dart';
import 'package:classipod/features/status_bar/widgets/status_bar.dart';
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
  List<Metadata> get displayItems => ref.read(songsProvider);

  @override
  Future<void> onSelectPressed() => _playSong(selectedDisplayItem);

  Future<void> _playSong(int displayIndex) async {
    setState(() => selectedDisplayItem = displayIndex);
    final int originalSongIndex = displayItems[displayIndex].originalSongIndex;

    await ref
        .read(audioPlayerServiceProvider.notifier)
        .playSongAtOriginalIndex(originalSongIndex);

    if (mounted) {
      await context.pushNamed(Routes.nowPlaying.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (displayItems.isEmpty) {
      return NoMusicWidget(
        title: Routes.songs.title(context),
      );
    }

    return CupertinoPageScaffold(
      child: Column(
        children: [
          StatusBar(
            title: Routes.songs.title(context),
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
                  onTap: () async => _playSong(index),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
