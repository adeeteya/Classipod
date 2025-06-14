import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/widgets/empty_state_widget.dart';
import 'package:classipod/features/custom_screen_elements/custom_screen.dart';
import 'package:classipod/features/settings/controller/exclude_directories_controller.dart';
import 'package:classipod/features/settings/models/exclude_directory_model.dart';
import 'package:classipod/features/settings/widgets/exclude_directory_tile.dart';
import 'package:classipod/features/status_bar/widgets/status_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExcludeDirectoriesScreen extends ConsumerStatefulWidget {
  const ExcludeDirectoriesScreen({super.key});

  @override
  ConsumerState createState() => _ExcludeDirectoriesScreenState();
}

class _ExcludeDirectoriesScreenState
    extends ConsumerState<ExcludeDirectoriesScreen>
    with CustomScreen {
  @override
  String get routeName => Routes.excludeDirectories.name;

  @override
  List<ExcludeDirectoryModel> get displayItems =>
      ref.watch(excludedDirectoriesProvider);

  @override
  Future<void> onSelectPressed() =>
      _toggleExcludeDirectory(selectedDisplayItem);

  Future<void> _toggleExcludeDirectory(int index) async {
    setState(() => selectedDisplayItem = index);
    await ref
        .read(excludedDirectoriesProvider.notifier)
        .toggleExcludeDirectory(excludeDirectoryModelKey: index);
  }

  @override
  Widget build(BuildContext context) {
    if (displayItems.isEmpty) {
      return CupertinoPageScaffold(
        child: Column(
          children: [
            StatusBar(title: Routes.nowPlaying.title(context)),
            Expanded(
              child: EmptyStateWidget(
                emptyDescription: context.localization.noMusicFilesFound,
              ),
            ),
          ],
        ),
      );
    }
    return CupertinoPageScaffold(
      child: Column(
        children: [
          StatusBar(title: Routes.excludeDirectories.title(context)),
          Flexible(
            child: CupertinoScrollbar(
              controller: scrollController,
              child: ListView.builder(
                controller: scrollController,
                itemCount: displayItems.length,
                prototypeItem: ExcludeDirectoryTile(
                  excludeDirectoryModel: ExcludeDirectoryModel(
                    directoryPath: '',
                    isExcluded: false,
                  ),
                  isSelected: false,
                  onTap: () {},
                ),
                itemBuilder:
                    (context, index) => ExcludeDirectoryTile(
                      excludeDirectoryModel: displayItems[index],
                      isSelected: selectedDisplayItem == index,
                      onTap: () async => _toggleExcludeDirectory(index),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
