import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/widgets/input_text_bar.dart';
import 'package:classipod/features/custom_screen_elements/custom_input_text_screen.dart';
import 'package:classipod/features/music/playlist/models/playlist_option_type.dart';
import 'package:classipod/features/music/playlist/widgets/playlist_option_list_tile.dart';
import 'package:classipod/features/status_bar/widgets/status_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PlaylistRenameScreen extends ConsumerStatefulWidget {
  final String oldPlaylistName;
  const PlaylistRenameScreen({super.key, required this.oldPlaylistName});

  @override
  ConsumerState createState() => _PlaylistRenameScreenState();
}

class _PlaylistRenameScreenState extends ConsumerState<PlaylistRenameScreen>
    with CustomInputTextScreen {
  @override
  String get routeName => Routes.playlistRename.name;

  @override
  List<PlaylistOptionType> get displayItems => [
    PlaylistOptionType.renamePlaylist,
    PlaylistOptionType.renameConfirm,
    PlaylistOptionType.renameCancel,
  ];

  @override
  Future<void> onSelectAction() async {
    await _onPlaylistRenameAction(selectedDisplayItem);
  }

  Future<void> _onPlaylistRenameAction(int displayIndex) async {
    setState(() => selectedDisplayItem = displayIndex);
    if (selectedDisplayItem == 0) {
      reopenInputTextBar();
      return;
    } else if (selectedDisplayItem == 1) {
      context.pop(inputText);
    } else if (selectedDisplayItem == 2) {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              StatusBar(title: widget.oldPlaylistName),
              Flexible(
                child: CupertinoScrollbar(
                  controller: scrollController,
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: displayItems.length,
                    prototypeItem: PlaylistOptionListTile(
                      isSelected: false,
                      type: PlaylistOptionType.renameCancel,
                      onTap: () {},
                    ),
                    itemBuilder:
                        (context, index) => PlaylistOptionListTile(
                          isSelected: selectedDisplayItem == index,
                          onTap: () async => _onPlaylistRenameAction(index),
                          type: displayItems[index],
                        ),
                  ),
                ),
              ),
            ],
          ),
          if (isInputTextBarActive)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: InputTextBar(
                inputTextBarController: inputTextBarController,
                onSearchTextChanged: (value) {
                  setState(() {
                    inputText = value;
                  });
                },
              ),
            ),
        ],
      ),
    );
  }
}
