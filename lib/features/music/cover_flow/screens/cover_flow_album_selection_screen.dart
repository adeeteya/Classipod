import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/extensions/go_router_extensions.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/core/theme/ipod_gradients.dart';
import 'package:classipod/core/theme/ipod_typography.dart';
import 'package:classipod/core/widgets/hero_flight_content.dart';
import 'package:classipod/features/custom_screen_elements/custom_screen.dart';
import 'package:classipod/features/music/album/models/album_model.dart';
import 'package:classipod/features/music/cover_flow/widgets/cover_flow_album_song_list_tile.dart';
import 'package:classipod/features/now_playing/provider/now_playing_details_provider.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoverFlowAlbumSelectionScreen extends ConsumerStatefulWidget {
  final AlbumModel albumDetail;

  const CoverFlowAlbumSelectionScreen({super.key, required this.albumDetail});

  @override
  ConsumerState createState() => _CoverFlowAlbumSelectionScreenState();
}

class _CoverFlowAlbumSelectionScreenState
    extends ConsumerState<CoverFlowAlbumSelectionScreen>
    with CustomScreen {
  @override
  String get routeName => Routes.coverFlowSelection.name;

  final GlobalKey _contentKey = GlobalKey();

  @override
  List<MusicMetadata> get displayItems => widget.albumDetail.albumSongs;

  @override
  Future<void> onSelectPressed() => _playSongFromAlbum(selectedDisplayItem);

  @override
  void scrollForward() {
    if (selectedDisplayItem < displayItems.length - 1) {
      setState(() => selectedDisplayItem++);
    }
    _revealSelection();
  }

  @override
  void scrollBackward() {
    if (selectedDisplayItem > 0) {
      setState(() => selectedDisplayItem--);
    }
    _revealSelection();
  }

  void _revealSelection() {
    if (!scrollController.hasClients || displayItems.isEmpty) return;
    final position = scrollController.position;
    if (!position.hasContentDimensions) return;
    final top = selectedDisplayItem * displayTileHeight;
    final bottom = top + displayTileHeight;
    final double target;
    if (top < position.pixels) {
      target = top;
    } else if (bottom > position.pixels + position.viewportDimension) {
      target = bottom - position.viewportDimension;
    } else {
      return;
    }
    scrollController.jumpTo(
      target.clamp(position.minScrollExtent, position.maxScrollExtent),
    );
  }

  Future<void> _playSongFromAlbum(int index) async {
    setState(() => selectedDisplayItem = index);
    await ref
        .read(audioPlayerServiceProvider.notifier)
        .playAlbum(albumDetail: widget.albumDetail, songIndex: index);

    if (mounted) {
      await context.openUniqueNamed(Routes.nowPlaying.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    final String? currentlyPlayingOriginalIndex = ref
        .watch(nowPlayingDetailsProvider.select((e) => e.currentMetadata))
        ?.identity;
    return Hero(
      tag:
          "${widget.albumDetail.albumName}-${widget.albumDetail.albumArtistName}",
      placeholderBuilder: (_, size, child) => SizedBox.fromSize(
        size: size,
        child: Offstage(child: TickerMode(enabled: false, child: child)),
      ),
      child: HeroFlightContent(
        key: _contentKey,
        flightBuilder: (_) => _CoverFlowFlightPreview(
          initialOffset: scrollController.hasClients
              ? scrollController.offset
              : 0,
          builder: (controller) =>
              _buildPanel(context, currentlyPlayingOriginalIndex, controller),
        ),
        child: _buildPanel(
          context,
          currentlyPlayingOriginalIndex,
          scrollController,
        ),
      ),
    );
  }

  Widget _buildPanel(
    BuildContext context,
    String? currentlyPlayingOriginalIndex,
    ScrollController controller,
  ) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: context.appSurfaceColor,
            border: Border.all(color: context.appOutlineColor),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: IpodGradients.selectionFor(context),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.albumDetail.albumName,
                          style: IpodTypography.title.copyWith(
                            color: CupertinoColors.white,
                          ),
                          maxLines: 1,
                        ),
                        Text(
                          widget.albumDetail.albumArtistName,
                          style: IpodTypography.metadata.copyWith(
                            color: CupertinoColors.white,
                          ),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                child: CupertinoScrollbar(
                  controller: controller,
                  child: ListView.builder(
                    controller: controller,
                    itemCount: displayItems.length,
                    padding: EdgeInsets.zero,
                    itemExtent: displayTileHeight,
                    itemBuilder: (context, index) => CoverFlowAlbumSongListTile(
                      songName: displayItems[index].getTrackName,
                      songDuration: Duration(
                        milliseconds: displayItems[index].getTrackDuration,
                      ),
                      isSelected: selectedDisplayItem == index,
                      isCurrentlyPlaying:
                          currentlyPlayingOriginalIndex ==
                          displayItems[index].identity,
                      onTap: () async => _playSongFromAlbum(index),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CoverFlowFlightPreview extends StatefulWidget {
  const _CoverFlowFlightPreview({
    required this.initialOffset,
    required this.builder,
  });

  final double initialOffset;
  final Widget Function(ScrollController) builder;

  @override
  State<_CoverFlowFlightPreview> createState() =>
      _CoverFlowFlightPreviewState();
}

class _CoverFlowFlightPreviewState extends State<_CoverFlowFlightPreview> {
  late final ScrollController _controller = ScrollController(
    initialScrollOffset: widget.initialOffset,
    keepScrollOffset: false,
  );

  @override
  Widget build(BuildContext context) =>
      IgnorePointer(child: widget.builder(_controller));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
