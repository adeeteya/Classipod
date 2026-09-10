import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/services/audio_files_service.dart';
import 'package:classipod/core/widgets/marquee_text.dart';
import 'package:classipod/features/custom_screen_elements/custom_screen.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:classipod/features/settings/models/music_folder_node.dart';
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
                prototypeItem: const _MusicFolderTile(
                  label: '',
                  depth: 0,
                  trackCount: 0,
                  isSelected: false,
                  isCurrentRoot: false,
                  onTap: _noop,
                ),
                itemBuilder: (context, index) {
                  final MusicFolderNode? node = displayItems[index];
                  return _MusicFolderTile(
                    label:
                        node?.label ?? context.localization.allFoldersMenuTitle,
                    depth: node?.depth ?? 0,
                    trackCount:
                        node?.trackCount ??
                        ref.read(audioFilesServiceProvider).value?.length,
                    isSelected: selectedDisplayItem == index,
                    isCurrentRoot: node?.path == currentRootPath,
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

void _noop() {}

class _MusicFolderTile extends StatelessWidget {
  final String label;
  final int depth;
  final int? trackCount;
  final bool isSelected;
  final bool isCurrentRoot;
  final VoidCallback onTap;

  const _MusicFolderTile({
    required this.label,
    required this.depth,
    required this.trackCount,
    required this.isSelected,
    required this.isCurrentRoot,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color textColor = isSelected
        ? context.appInverseTextColor
        : context.appPrimaryTextColor;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 30,
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: isSelected
                ? const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppPalette.selectedTileGradientColor1,
                      AppPalette.selectedTileGradientColor2,
                    ],
                  )
                : null,
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: 4 + (depth * 10).toDouble(),
              right: 4,
            ),
            child: Row(
              spacing: 5,
              children: [
                Icon(
                  isCurrentRoot
                      ? CupertinoIcons.checkmark_circle_fill
                      : CupertinoIcons.folder,
                  size: 16,
                  color: textColor,
                ),
                Flexible(
                  child: MarqueeText(
                    label,
                    mode: TextScrollMode.bouncing,
                    intervalSpaces: null,
                    delayBefore: const Duration(seconds: 2),
                    pauseBetween: const Duration(seconds: 2),
                    pauseOnBounce: const Duration(seconds: 2),
                    style: CupertinoTheme.of(context).textTheme.textStyle
                        .copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                          overflow: TextOverflow.ellipsis,
                        ),
                  ),
                ),
                if (trackCount != null)
                  Text(
                    "$trackCount",
                    style: CupertinoTheme.of(context).textTheme.textStyle
                        .copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: isSelected
                              ? context.appInverseTextColor
                              : context.appSecondaryTextColor,
                        ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
