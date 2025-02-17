import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/models/metadata.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/widgets/options_list_tile.dart';
import 'package:classipod/features/custom_screen_elements/custom_screen.dart';
import 'package:classipod/features/music/album/models/album_model.dart';
import 'package:classipod/features/music/album/providers/album_details_provider.dart';
import 'package:classipod/features/music/playlist/providers/playlists_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum _SearchMoreOptions {
  addToOnTheGo,
  addAlbumToOnTheGo,
  browseAlbum,
  browseArtist,
  cancel;

  String title(BuildContext context) {
    switch (this) {
      case addToOnTheGo:
        return context.localization.addToOnTheGoPlaylist;
      case addAlbumToOnTheGo:
        return context.localization.addAlbumToOnTheGoPlaylist;
      case browseAlbum:
        return context.localization.browseAlbum;
      case browseArtist:
        return context.localization.browseArtist;
      case cancel:
        return context.localization.cancelText;
    }
  }
}

class SearchMoreOptionsModal extends ConsumerStatefulWidget {
  final Metadata? songMetadata;
  final AlbumModel? albumDetail;

  const SearchMoreOptionsModal({
    super.key,
    this.songMetadata,
    this.albumDetail,
  });

  @override
  ConsumerState createState() => _SearchMoreOptionsModalState();
}

class _SearchMoreOptionsModalState extends ConsumerState<SearchMoreOptionsModal>
    with CustomScreen {
  @override
  String get routeName => Routes.searchMoreOptions.name;

  @override
  List<_SearchMoreOptions> get displayItems => [
    if (widget.songMetadata != null) _SearchMoreOptions.addToOnTheGo,
    if (widget.albumDetail != null) _SearchMoreOptions.addAlbumToOnTheGo,
    if (widget.songMetadata != null) _SearchMoreOptions.browseAlbum,
    _SearchMoreOptions.browseArtist,
    _SearchMoreOptions.cancel,
  ];

  @override
  Future<void> onSelectPressed() =>
      _performAction(displayItems[selectedDisplayItem]);

  Future<void> _performAction(_SearchMoreOptions optionItem) async {
    setState(() => selectedDisplayItem = displayItems.indexOf(optionItem));
    switch (optionItem) {
      case _SearchMoreOptions.addToOnTheGo:
        ref
            .read(playlistsProvider.notifier)
            .addSongToPlaylist(widget.songMetadata);
        context.pop();
        break;
      case _SearchMoreOptions.addAlbumToOnTheGo:
        ref
            .read(playlistsProvider.notifier)
            .addAlbumToPlaylist(widget.albumDetail);
        context.pop();
        break;
      case _SearchMoreOptions.browseAlbum:
        final albumDetailIndex = ref
            .read(albumDetailsProvider)
            .indexWhere((e) => e == widget.songMetadata?.getAlbumDetail);
        if (albumDetailIndex != -1) {
          context.pushReplacementNamed(
            Routes.albumSongs.name,
            extra: ref.read(albumDetailsProvider)[albumDetailIndex],
          );
        }
        break;
      case _SearchMoreOptions.browseArtist:
        context.pushReplacementNamed(
          Routes.artistAlbums.name,
          pathParameters: {
            "artistName":
                widget.songMetadata?.getMainArtistName ??
                widget.albumDetail?.albumArtistName ??
                '',
          },
        );
        break;
      case _SearchMoreOptions.cancel:
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
            onTap: () async => _performAction(displayItems[index]),
          );
        },
      ),
    );
  }
}
