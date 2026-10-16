import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/extensions/go_router_extensions.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/widgets/options_list_tile.dart';
import 'package:classipod/features/custom_screen_elements/custom_screen.dart';
import 'package:classipod/features/music/album/models/album_model.dart';
import 'package:classipod/features/music/album/providers/album_details_provider.dart';
import 'package:classipod/features/music/playlist/widgets/add_to_playlist_helper.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum _SearchMoreOptions {
  addToPlaylist,
  addAlbumToPlaylist,
  browseAlbum,
  browseArtist,
  cancel;

  String title(BuildContext context) {
    switch (this) {
      case addToPlaylist:
        return context.localization.addToPlaylist;
      case addAlbumToPlaylist:
        return context.localization.addAlbumToPlaylist;
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
  final MusicMetadata? songMetadata;
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
    if (widget.songMetadata != null) _SearchMoreOptions.addToPlaylist,
    if (widget.albumDetail != null) _SearchMoreOptions.addAlbumToPlaylist,
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
      case _SearchMoreOptions.addToPlaylist:
        final song = widget.songMetadata;
        if (song == null) break;
        await addSongsToChosenPlaylist(context, ref, [song]);
        if (mounted) context.pop();
        break;
      case _SearchMoreOptions.addAlbumToPlaylist:
        final album = widget.albumDetail;
        if (album == null) break;
        await addSongsToChosenPlaylist(context, ref, album.albumSongs);
        if (mounted) context.pop();
        break;
      case _SearchMoreOptions.browseAlbum:
        final albumDetailIndex = ref
            .read(albumDetailsProvider)
            .indexWhere((e) => e == widget.songMetadata?.getAlbumDetail);
        if (albumDetailIndex != -1) {
          await context.openUniqueNamed(
            Routes.albumSongs.name,
            replaceCurrent: true,
            extra: ref.read(albumDetailsProvider)[albumDetailIndex],
          );
        }
        break;
      case _SearchMoreOptions.browseArtist:
        await context.openUniqueNamed(
          Routes.artistAlbums.name,
          replaceCurrent: true,
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
        color: context.appSurfaceColor,
        border: Border.all(color: context.appOutlineColor),
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
            onTap: () async => _performAction(displayItems[index]),
          );
        },
      ),
    );
  }
}
