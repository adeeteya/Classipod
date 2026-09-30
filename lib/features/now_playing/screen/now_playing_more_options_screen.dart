import 'dart:async';

import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/widgets/display_list_tile.dart';
import 'package:classipod/features/custom_screen_elements/custom_screen.dart';
import 'package:classipod/features/music/album/providers/album_details_provider.dart';
import 'package:classipod/features/music/playlist/providers/playlists_provider.dart';
import 'package:classipod/features/music/songs/screens/song_edit_screen.dart';
import 'package:classipod/features/now_playing/provider/now_playing_details_provider.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum _NowPlayingMoreOptions {
  addToOnTheGo,
  browseAlbum,
  browseArtist,
  editSong,
  sleepTimer,
  cancel;

  String title(BuildContext context) {
    switch (this) {
      case addToOnTheGo:
        return context.localization.addToOnTheGoPlaylist;
      case browseAlbum:
        return context.localization.browseAlbum;
      case browseArtist:
        return context.localization.browseArtist;
      case editSong:
        return context.localization.editSongOption;
      case sleepTimer:
        return context.localization.sleepTimerTitle;
      case cancel:
        return context.localization.cancelText;
    }
  }
}

class NowPlayingMoreOptionsScreen extends ConsumerStatefulWidget {
  const NowPlayingMoreOptionsScreen({super.key});

  @override
  ConsumerState createState() => _NowPlayingMoreOptionsScreenState();
}

class _NowPlayingMoreOptionsScreenState
    extends ConsumerState<NowPlayingMoreOptionsScreen>
    with CustomScreen {
  @override
  String get routeName => Routes.nowPlayingMoreOptions.name;

  @override
  List<_NowPlayingMoreOptions> get displayItems =>
      _NowPlayingMoreOptions.values;

  @override
  Future<void> onSelectPressed() =>
      _navigateToScreen(_NowPlayingMoreOptions.values[selectedDisplayItem]);

  @override
  void onMenuButtonPressed() => _closeScreen();

  void _closeScreen() {
    // Let every device-action listener see the options route before popping.
    // Otherwise Now Playing can handle the same Menu/Select press again.
    scheduleMicrotask(() {
      if (mounted && ModalRoute.of(context)?.isCurrent == true) {
        context.pop();
      }
    });
  }

  Future<void> _navigateToScreen(_NowPlayingMoreOptions optionItem) async {
    setState(() => selectedDisplayItem = displayItems.indexOf(optionItem));
    final currentSongMetadata = ref
        .read(nowPlayingDetailsProvider)
        .currentMetadata;
    switch (optionItem) {
      case _NowPlayingMoreOptions.addToOnTheGo:
        ref
            .read(playlistsProvider.notifier)
            .addSongToPlaylist(currentSongMetadata);
        _closeScreen();
        break;
      case _NowPlayingMoreOptions.browseAlbum:
        final albumDetailIndex = ref
            .read(albumDetailsProvider)
            .indexWhere((e) => e == currentSongMetadata?.getAlbumDetail);
        if (albumDetailIndex != -1) {
          await context.pushNamed(
            Routes.albumSongs.name,
            extra: ref.read(albumDetailsProvider)[albumDetailIndex],
          );
        }
        break;
      case _NowPlayingMoreOptions.browseArtist:
        await context.pushNamed(
          Routes.artistAlbums.name,
          pathParameters: {
            "artistName":
                currentSongMetadata?.getMainArtistName ?? "Unknown Artist",
          },
        );
        break;
      case _NowPlayingMoreOptions.editSong:
        if (currentSongMetadata == null) {
          _closeScreen();
          return;
        }
        await showCupertinoDialog(
          context: context,
          builder: (dialogContext) =>
              SongEditScreen(songMetadata: currentSongMetadata),
        );
        if (mounted) {
          _closeScreen();
        }
        break;
      case _NowPlayingMoreOptions.sleepTimer:
        await context.pushNamed(Routes.sleepTimer.name);
        break;
      case _NowPlayingMoreOptions.cancel:
        _closeScreen();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoScrollbar(
        controller: scrollController,
        child: ListView.builder(
          controller: scrollController,
          itemCount: displayItems.length,
          prototypeItem: const DisplayListTile(text: '', isSelected: false),
          itemBuilder: (context, index) {
            return DisplayListTile(
              text: displayItems[index].title(context),
              isSelected: index == selectedDisplayItem,
              onTap: () async => _navigateToScreen(displayItems[index]),
            );
          },
        ),
      ),
    );
  }
}
