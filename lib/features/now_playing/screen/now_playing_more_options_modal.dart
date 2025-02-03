import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/core/widgets/options_list_tile.dart';
import 'package:classipod/features/custom_screen_widgets/custom_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum _NowPlayingMoreOptions {
  browseArtist,
  browseAlbum;

  String title(BuildContext context) {
    switch (this) {
      case browseArtist:
        return context.localization.browseArtist;
      case browseAlbum:
        return context.localization.browseAlbum;
    }
  }
}

class NowPlayingMoreOptionsModal extends ConsumerStatefulWidget {
  const NowPlayingMoreOptionsModal({super.key});

  @override
  ConsumerState createState() => _NowPlayingMoreOptionsModalState();
}

class _NowPlayingMoreOptionsModalState
    extends ConsumerState<NowPlayingMoreOptionsModal> with CustomScreen {
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
    final currentSongMetadata = ref.read(currentSongMetadataProvider);
    switch (optionItem) {
      case _NowPlayingMoreOptions.browseArtist:
        context.goNamed(
          Routes.artistSongs.name,
          pathParameters: {
            "artistName":
                currentSongMetadata?.getMainArtistName ?? "Unknown Artist",
          },
        );
        break;
      case _NowPlayingMoreOptions.browseAlbum:
        context.goNamed(Routes.albums.name);
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
