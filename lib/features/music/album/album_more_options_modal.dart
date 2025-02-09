import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/widgets/options_list_tile.dart';
import 'package:classipod/features/custom_screen_widgets/custom_screen.dart';
import 'package:classipod/features/music/album/album_detail.dart';
import 'package:classipod/features/music/playlist/playlist_songs_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum _AlbumMoreOptions {
  addAlbumToOnTheGo,
  browseArtist,
  cancel;

  String title(BuildContext context) {
    switch (this) {
      case addAlbumToOnTheGo:
        return context.localization.addAlbumToOnTheGoPlaylist;
      case browseArtist:
        return context.localization.browseArtist;
      case cancel:
        return context.localization.cancelText;
    }
  }
}

class AlbumMoreOptionsModal extends ConsumerStatefulWidget {
  final String routeName;
  final AlbumDetail albumDetail;
  final bool showBrowseArtist;
  const AlbumMoreOptionsModal({
    super.key,
    required this.routeName,
    required this.albumDetail,
    this.showBrowseArtist = true,
  });

  @override
  ConsumerState createState() => _AlbumMoreOptionsModalState();
}

class _AlbumMoreOptionsModalState extends ConsumerState<AlbumMoreOptionsModal>
    with CustomScreen {
  @override
  String get routeName => widget.routeName;

  @override
  List<_AlbumMoreOptions> get displayItems => [
        _AlbumMoreOptions.addAlbumToOnTheGo,
        if (widget.showBrowseArtist) _AlbumMoreOptions.browseArtist,
        _AlbumMoreOptions.cancel,
      ];

  @override
  Future<void> onSelectPressed() =>
      _performAction(_AlbumMoreOptions.values[selectedDisplayItem]);

  Future<void> _performAction(_AlbumMoreOptions optionItem) async {
    setState(() => selectedDisplayItem = displayItems.indexOf(optionItem));
    switch (optionItem) {
      case _AlbumMoreOptions.addAlbumToOnTheGo:
        ref
            .read(playlistSongsProvider(0).notifier)
            .addAlbumToPlaylist(widget.albumDetail);
        context.pop();
        break;
      case _AlbumMoreOptions.browseArtist:
        context.pushReplacementNamed(
          Routes.artistAlbums.name,
          pathParameters: {
            "artistName": widget.albumDetail.albumArtistName,
          },
        );
        break;
      case _AlbumMoreOptions.cancel:
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
