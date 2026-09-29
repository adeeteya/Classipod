import 'package:classipod/core/alerts/dialogs.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/repositories/library/missing_tracks_provider.dart';
import 'package:classipod/features/custom_screen_elements/custom_screen.dart';
import 'package:classipod/features/settings/widgets/settings_list_tile.dart';
import 'package:classipod/features/status_bar/widgets/status_bar.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MissingTracksScreen extends ConsumerStatefulWidget {
  const MissingTracksScreen({super.key});

  @override
  ConsumerState<MissingTracksScreen> createState() =>
      _MissingTracksScreenState();
}

class _MissingTracksScreenState extends ConsumerState<MissingTracksScreen>
    with CustomScreen {
  @override
  String get routeName => Routes.missingTracks.name;

  @override
  List<MissingTrack> get displayItems => ref.read(missingTracksProvider);

  @override
  Future<void> onSelectPressed() async {
    if (selectedDisplayItem >= displayItems.length) return;
    final track = displayItems[selectedDisplayItem];
    await Dialogs.showInfoDialog(
      context: context,
      title: track.song.getTrackName,
      content:
          '${track.location}\n\n${track.artworkOnly ? context.localization.missingTrackArtwork : context.localization.missingTrackRead}',
    );
  }

  @override
  Widget build(BuildContext context) {
    final tracks = ref.watch(missingTracksProvider);
    if (selectedDisplayItem >= tracks.length) selectedDisplayItem = 0;
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      child: Column(
        children: [
          StatusBar(title: context.localization.missingTracksTitle),
          Expanded(
            child: tracks.isEmpty
                ? Center(child: Text(context.localization.missingTracksEmpty))
                : CupertinoScrollbar(
                    controller: scrollController,
                    child: ListView.builder(
                      controller: scrollController,
                      itemExtent: displayTileHeight,
                      itemCount: tracks.length,
                      itemBuilder: (context, index) => SettingsListTile(
                        text:
                            '${tracks[index].song.getTrackName} — ${tracks[index].location}',
                        isSelected: selectedDisplayItem == index,
                        onTap: () async {
                          setState(() => selectedDisplayItem = index);
                          await onSelectPressed();
                        },
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
