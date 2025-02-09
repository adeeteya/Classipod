import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/models/metadata.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/widgets/options_list_tile.dart';
import 'package:classipod/features/custom_screen_widgets/custom_screen.dart';
import 'package:classipod/features/music/album/album_details_provider.dart';
import 'package:classipod/features/music/playlist/playlist_songs_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum _SongsMoreOptions {
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

class SongsMoreOptionsModal extends ConsumerStatefulWidget {
  final String routeName;
  final Metadata currentSongMetadata;
  final bool showAdditionalOptions;
  const SongsMoreOptionsModal({
    super.key,
    required this.routeName,
    required this.currentSongMetadata,
    this.showAdditionalOptions = true,
  });

  @override
  ConsumerState createState() => _SongsMoreOptionsModalState();
}

class _SongsMoreOptionsModalState extends ConsumerState<SongsMoreOptionsModal>
    with CustomScreen {
  @override
  String get routeName => widget.routeName;

  @override
  List<_SongsMoreOptions> get displayItems => [
        _SongsMoreOptions.addToOnTheGo,
        if (widget.showAdditionalOptions) _SongsMoreOptions.browseAlbum,
        if (widget.showAdditionalOptions) _SongsMoreOptions.browseArtist,
        _SongsMoreOptions.cancel,
      ];

  @override
  Future<void> onSelectPressed() =>
      _navigateToScreen(_SongsMoreOptions.values[selectedDisplayItem]);

  Future<void> _navigateToScreen(_SongsMoreOptions optionItem) async {
    setState(() => selectedDisplayItem = displayItems.indexOf(optionItem));
    switch (optionItem) {
      case _SongsMoreOptions.addToOnTheGo:
        ref
            .read(playlistSongsProvider(0).notifier)
            .addSongToPlaylist(widget.currentSongMetadata);
        context.pop();
        break;
      case _SongsMoreOptions.browseAlbum:
        final albumDetailIndex = ref
            .read(albumDetailsProvider)
            .indexWhere((e) => e == widget.currentSongMetadata.getAlbumDetail);
        if (albumDetailIndex != -1) {
          context.pushReplacementNamed(
            Routes.albumSongs.name,
            extra: ref.read(albumDetailsProvider)[albumDetailIndex],
          );
        }
        break;
      case _SongsMoreOptions.browseArtist:
        context.pushReplacementNamed(
          Routes.artistAlbums.name,
          pathParameters: {
            "artistName": widget.currentSongMetadata.getMainArtistName,
          },
        );
        break;
      case _SongsMoreOptions.cancel:
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
