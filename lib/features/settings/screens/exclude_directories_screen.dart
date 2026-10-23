import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/extensions/go_router_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/widgets/empty_state_widget.dart';
import 'package:classipod/core/widgets/input_text_bar.dart';
import 'package:classipod/features/custom_screen_elements/custom_screen.dart';
import 'package:classipod/features/device/models/device_action.dart';
import 'package:classipod/features/settings/controller/exclude_directories_controller.dart';
import 'package:classipod/features/settings/models/exclude_directory_model.dart';
import 'package:classipod/features/settings/widgets/exclude_directory_tile.dart';
import 'package:classipod/features/settings/widgets/name_filter_tile.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
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
  void initState() {
    super.initState();
    ref.read(excludedDirectoriesProvider.notifier).beginEditing();
  }

  @override
  String get routeName => Routes.excludeDirectories.name;

  bool isAddingFolderFilter = false;
  String folderFilterInput = '';
  InputTextBarController inputTextBarController = InputTextBarController();

  List<ExcludeDirectoryModel> get allDirectories =>
      ref.watch(excludedDirectoriesProvider);

  List<String> get savedFilters => ref.watch(excludedNameFiltersProvider);

  bool get isTypingFolderFilter =>
      isAddingFolderFilter && folderFilterInput.trim().isNotEmpty;

  @override
  List<ExcludeDirectoryModel> get displayItems =>
      isTypingFolderFilter ? matchingDirectories : allDirectories;

  List<ExcludeDirectoryModel> get matchingDirectories {
    final String target = folderFilterInput.trim().toLowerCase();
    return allDirectories
        .where((item) => item.directoryPath.toLowerCase().contains(target))
        .toList();
  }

  void _resetScroll() {
    if (scrollController.hasClients) {
      scrollController.jumpTo(0);
    }
  }

  void _startAddingFolderFilter() {
    setState(() {
      selectedDisplayItem = 0;
      isAddingFolderFilter = true;
      folderFilterInput = '';
      inputTextBarController = InputTextBarController();
    });
    _resetScroll();
  }

  Future<void> _stopAddingFolderFilter({required bool saveFilter}) async {
    final String filterName = folderFilterInput.trim();
    setState(() {
      isAddingFolderFilter = false;
      folderFilterInput = '';
      inputTextBarController = InputTextBarController();
      selectedDisplayItem = 0;
    });
    _resetScroll();
    if (saveFilter && filterName.isNotEmpty) {
      await ref
          .read(excludedNameFiltersProvider.notifier)
          .addNameFilter(filterName);
    }
  }

  Future<void> _removeFolderFilter(String filterName) async {
    await ref
        .read(excludedNameFiltersProvider.notifier)
        .removeNameFilter(filterName);
    final int maxSelectedIndex = allDirectories.length + savedFilters.length;
    if (selectedDisplayItem > maxSelectedIndex) {
      setState(() => selectedDisplayItem = maxSelectedIndex);
    }
  }

  Future<void> _toggleExcludeDirectory({
    required int listIndex,
    required int directoryIndex,
  }) async {
    setState(() => selectedDisplayItem = listIndex);
    await ref
        .read(excludedDirectoriesProvider.notifier)
        .toggleExcludeDirectory(excludeDirectoryModelKey: directoryIndex);
  }

  @override
  Future<void> onSelectPressed() async {
    if (isAddingFolderFilter) {
      return;
    }
    final int index = selectedDisplayItem;
    if (index == 0) {
      _startAddingFolderFilter();
    } else if (index <= savedFilters.length) {
      await _removeFolderFilter(savedFilters[index - 1]);
    } else {
      await _toggleExcludeDirectory(
        listIndex: index,
        directoryIndex: index - savedFilters.length - 1,
      );
    }
  }

  @override
  Future<void> onSelectLongPress() async {
    if (isAddingFolderFilter) {
      await _stopAddingFolderFilter(saveFilter: false);
    }
  }

  @override
  Future<void> deviceControlHandler(
    dynamic inputSource,
    DeviceAction? newState,
  ) async {
    if (newState == null ||
        !mounted ||
        context.router.locationNamed != routeName) {
      return;
    }
    if (isAddingFolderFilter) {
      switch (newState) {
        case DeviceAction.menu:
          await _stopAddingFolderFilter(saveFilter: true);
          break;
        case DeviceAction.selectLongPress:
        case DeviceAction.select:
          inputTextBarController.selectAlphabet();
          break;
        case DeviceAction.rotateForward:
          inputTextBarController.moveToNextAlphabet();
          break;
        case DeviceAction.rotateBackward:
          inputTextBarController.moveBackToPreviousAlphabet();
          break;
        case DeviceAction.seekForward:
          inputTextBarController.addSpace();
          break;
        case DeviceAction.seekBackward:
          inputTextBarController.removeCharacter();
          break;
        case DeviceAction.seekBackwardLongPress:
          inputTextBarController.clearText();
          break;
        default:
          break;
      }
      return;
    }
    await super.deviceControlHandler(inputSource, newState);
  }

  @override
  Widget build(BuildContext context) {
    extraDisplayItems = isTypingFolderFilter ? 1 : savedFilters.length + 1;
    if (allDirectories.isEmpty) {
      return CupertinoPageScaffold(
        child: Column(
          children: [
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
      resizeToAvoidBottomInset: false,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              Flexible(
                child: CupertinoScrollbar(
                  controller: scrollController,
                  child: _buildList(context),
                ),
              ),
            ],
          ),
          if (isAddingFolderFilter)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: InputTextBar(
                inputTextBarController: inputTextBarController,
                onSearchTextChanged: (text) {
                  setState(() => folderFilterInput = text);
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    if (isTypingFolderFilter && matchingDirectories.isEmpty) {
      return EmptyStateWidget(
        emptyDescription: context.localization.noFoldersMatchFilter,
      );
    }
    return ListView.builder(
      controller: scrollController,
      itemCount: displayItems.length + extraDisplayItems,
      prototypeItem: ExcludeDirectoryTile(
        excludeDirectoryModel: ExcludeDirectoryModel(
          directoryPath: '',
          isExcluded: false,
        ),
        isSelected: false,
        onTap: () {},
      ),
      itemBuilder: (context, index) {
        if (index == 0) {
          return NameFilterTile(
            title: context.localization.addFolderNameFilterTile,
            icon: CupertinoIcons.plus_circle_fill,
            iconColor: AppPalette.batteryBarGradientColor6,
            isSelected: selectedDisplayItem == 0,
            onTap: () => isAddingFolderFilter
                ? _stopAddingFolderFilter(saveFilter: true)
                : _startAddingFolderFilter(),
          );
        }
        if (isTypingFolderFilter) {
          return ExcludeDirectoryTile(
            excludeDirectoryModel: displayItems[index - 1],
            isSelected: false,
            nameFilters: savedFilters,
            onTap: () {},
          );
        }
        if (index <= savedFilters.length) {
          final String filterName = savedFilters[index - 1];
          return NameFilterTile(
            title: filterName,
            icon: CupertinoIcons.minus_circle_fill,
            iconColor: AppPalette.lowBatteryBarGradientColor2,
            isSelected: selectedDisplayItem == index,
            onTap: () async => _removeFolderFilter(filterName),
          );
        }
        final int directoryIndex = index - savedFilters.length - 1;
        return ExcludeDirectoryTile(
          excludeDirectoryModel: allDirectories[directoryIndex],
          isSelected: selectedDisplayItem == index,
          nameFilters: savedFilters,
          onTap: () => _toggleExcludeDirectory(
            listIndex: index,
            directoryIndex: directoryIndex,
          ),
        );
      },
    );
  }
}
