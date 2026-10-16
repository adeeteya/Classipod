import 'dart:async';

import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/providers/filtered_audio_files_provider.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/core/services/song_deletion_service.dart';
import 'package:classipod/core/widgets/display_list_tile.dart';
import 'package:classipod/features/custom_screen_elements/custom_screen.dart';
import 'package:classipod/features/music/album/providers/album_details_provider.dart';
import 'package:classipod/features/music/playlist/providers/playlists_provider.dart';
import 'package:classipod/features/music/playlist/widgets/add_to_playlist_helper.dart';
import 'package:classipod/features/music/songs/provider/songs_provider.dart';
import 'package:classipod/features/music/songs/screens/song_edit_screen.dart';
import 'package:classipod/features/now_playing/provider/now_playing_details_provider.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum _NowPlayingMoreOptions {
  addToPlaylist,
  browseAlbum,
  browseArtist,
  editSong,
  deleteSong,
  sleepTimer,
  cancel;

  String title(BuildContext context) {
    switch (this) {
      case addToPlaylist:
        return context.localization.addToPlaylist;
      case browseAlbum:
        return context.localization.browseAlbum;
      case browseArtist:
        return context.localization.browseArtist;
      case editSong:
        return context.localization.editSongOption;
      case deleteSong:
        return context.localization.deleteSongOption;
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

  Future<void> _deleteCurrentSong(MusicMetadata song) async {
    final isCurrent =
        ref.read(nowPlayingDetailsProvider).currentMetadata?.identity ==
        song.identity;
    if (isCurrent) {
      await ref.read(audioPlayerServiceProvider.notifier).nextSong();
    }
    final deleted = await deleteSongFromDevice(song);
    if (!deleted) {
      if (!mounted) return;
      await showCupertinoDialog<void>(
        context: context,
        builder: (dialogContext) => CupertinoAlertDialog(
          title: Text(context.localization.deleteSongConfirmTitle),
          content: Text(context.localization.deleteSongFailedMessage),
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text(context.localization.cancelText),
            ),
          ],
        ),
      );
      return;
    }
    ref.invalidate(filteredAudioFilesProvider);
    ref.invalidate(albumDetailsProvider);
    ref.invalidate(songsProvider);
    ref.invalidate(playlistsProvider);
  }

  Future<void> _navigateToScreen(_NowPlayingMoreOptions optionItem) async {
    setState(() => selectedDisplayItem = displayItems.indexOf(optionItem));
    final currentSongMetadata = ref
        .read(nowPlayingDetailsProvider)
        .currentMetadata;
    switch (optionItem) {
      case _NowPlayingMoreOptions.addToPlaylist:
        if (currentSongMetadata == null) {
          _closeScreen();
          return;
        }
        await addSongsToChosenPlaylist(context, ref, [currentSongMetadata]);
        _closeScreen();
        break;
      case _NowPlayingMoreOptions.browseAlbum:
        final albumDetailIndex = ref
            .read(albumDetailsProvider)
            .indexWhere((e) => e == currentSongMetadata?.getAlbumDetail);
        if (albumDetailIndex != -1) {
          await Future<void>.value();
          if (!mounted) return;
          context.goNamed(
            Routes.albumSongs.name,
            queryParameters: const {'selectAlbum': 'true'},
            extra: ref.read(albumDetailsProvider)[albumDetailIndex],
          );
        }
        break;
      case _NowPlayingMoreOptions.browseArtist:
        final artistName =
            currentSongMetadata?.getMainArtistName ?? 'Unknown Artist';
        await Future<void>.value();
        if (!mounted) return;
        context.goNamed(
          Routes.artistAlbums.name,
          pathParameters: {'artistName': artistName},
          queryParameters: {'selectedArtist': artistName},
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
      case _NowPlayingMoreOptions.deleteSong:
        if (currentSongMetadata == null) {
          _closeScreen();
          return;
        }
        final confirmed = await showCupertinoDialog<bool>(
          context: context,
          builder: (dialogContext) => CupertinoAlertDialog(
            title: Text(context.localization.deleteSongConfirmTitle),
            content: Text(context.localization.deleteSongConfirmMessage),
            actions: [
              CupertinoDialogAction(
                onPressed: () => Navigator.of(dialogContext).pop(false),
                child: Text(context.localization.cancelText),
              ),
              CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () => Navigator.of(dialogContext).pop(true),
                child: Text(context.localization.deleteSongOption),
              ),
            ],
          ),
        );
        if (confirmed == true) {
          await _deleteCurrentSong(currentSongMetadata);
        }
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
