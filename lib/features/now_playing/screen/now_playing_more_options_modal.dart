import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/widgets/options_list_tile.dart';
import 'package:classipod/features/custom_screen_elements/custom_screen.dart';
import 'package:classipod/features/music/album/providers/album_details_provider.dart';
import 'package:classipod/features/music/playlist/providers/playlists_provider.dart';
import 'package:classipod/features/now_playing/provider/now_playing_details_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum _NowPlayingMoreOptions {
  addToOnTheGo,
  browseAlbum,
  browseArtist,
  cancel;

  String title(BuildContext context) {
    switch (this) {
      case addToOnTheGo:
        return context.localization.addToOnTheGoPlaylist;
      case browseAlbum:
        return context.localization.browseAlbum;
      case browseArtist:
        return context.localization.browseArtist;
      case cancel:
        return context.localization.cancelText;
    }
  }
}

class NowPlayingMoreOptionsModal extends ConsumerStatefulWidget {
  const NowPlayingMoreOptionsModal({super.key});

  @override
  ConsumerState createState() => _NowPlayingMoreOptionsModalState();
}

class _NowPlayingMoreOptionsModalState
    extends ConsumerState<NowPlayingMoreOptionsModal>
    with CustomScreen {
  @override
  String get routeName => Routes.nowPlayingMoreOptions.name;

  @override
  List<_NowPlayingMoreOptions> get displayItems =>
      _NowPlayingMoreOptions.values;

  @override
  Future<void> onSelectPressed() =>
      _navigateToScreen(_NowPlayingMoreOptions.values[selectedDisplayItem]);

  Future<void> _navigateToScreen(_NowPlayingMoreOptions optionItem) async {
    setState(() => selectedDisplayItem = displayItems.indexOf(optionItem));
    final currentSongMetadata =
        ref.read(nowPlayingDetailsProvider).currentMetadata;
    switch (optionItem) {
      case _NowPlayingMoreOptions.addToOnTheGo:
        ref
            .read(playlistsProvider.notifier)
            .addSongToPlaylist(currentSongMetadata);
        context.pop();
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
      case _NowPlayingMoreOptions.cancel:
        context.pop();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        border: Border.all(),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        controller: scrollController,
        itemCount: displayItems.length,
        prototypeItem: const OptionsListTile(text: '', isSelected: false),
        itemBuilder: (context, index) {
          return OptionsListTile(
            text: displayItems[index].title(context),
            isSelected: index == selectedDisplayItem,
            onTap: () async => _navigateToScreen(displayItems[index]),
          );
        },
      ),
    );
  }
}
