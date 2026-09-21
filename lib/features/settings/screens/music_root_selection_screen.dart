import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/services/audio_files_service.dart';

import 'package:classipod/features/custom_screen_elements/custom_screen.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:classipod/features/settings/models/music_folder_node.dart';
import 'package:classipod/features/settings/widgets/selection_list_tile.dart';
import 'package:classipod/features/status_bar/widgets/status_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MusicRootSelectionScreen extends ConsumerStatefulWidget {
  const MusicRootSelectionScreen({super.key});

  @override
  ConsumerState createState() => _MusicRootSelectionScreenState();
}

class _MusicRootSelectionScreenState extends ConsumerState with CustomScreen {
  List<MusicFolderNode> _folders = const [];

  @override
  String get routeName => Routes.musicRoot.name;

  /// The first entry is the "every folder" option, so it has no node.
  @override
  List<MusicFolderNode?> get displayItems => [null, ..._folders];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _folders = MusicFolderNode.buildTree(
      ref
              .read(audioFilesServiceProvider)
              .value
              ?.map((MusicMetadata metadata) => metadata.parentDirectoryPath)
              .whereType<String>() ??
          const <String>[],
    );
    final String? currentRootPath = ref
        .read(settingsPreferencesControllerProvider)
        .musicRootPath;
    final int currentIndex = displayItems.indexWhere(
      (node) => node?.path == currentRootPath,
    );
    selectedDisplayItem = currentIndex == -1 ? 0 : currentIndex;
  }

  @override
  Future<void> onSelectPressed() => _selectRoot(selectedDisplayItem);

  Future<void> _selectRoot(int index) async {
    setState(() => selectedDisplayItem = index);
    await ref
        .read(settingsPreferencesControllerProvider.notifier)
        .setMusicRootPath(displayItems[index]?.path);
  }

  @override
  Widget build(BuildContext context) {
    final String? currentRootPath = ref.watch(
      settingsPreferencesControllerProvider.select(
        (settings) => settings.musicRootPath,
      ),
    );

    return CupertinoPageScaffold(
      child: Column(
        children: [
          StatusBar(title: Routes.musicRoot.title(context)),
          Flexible(
            child: CupertinoScrollbar(
              controller: scrollController,
              child: ListView.builder(
                controller: scrollController,
                itemCount: displayItems.length,
                prototypeItem: SelectionListTile(
                  text: '',
                  isSelected: false,
                  onTap: () {},
                ),
                itemBuilder: (context, index) {
                  final MusicFolderNode? node = displayItems[index];
                  final int? trackCount =
                      node?.trackCount ??
                      ref.read(audioFilesServiceProvider).value?.length;
                  return SelectionListTile(
                    text:
                        node?.label ?? context.localization.allFoldersMenuTitle,
                    value: trackCount == null ? null : "$trackCount",
                    indentLevel: node?.depth ?? 0,
                    isActive: node?.path == currentRootPath,
                    isSelected: selectedDisplayItem == index,
                    onTap: () async => _selectRoot(index),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
