import 'dart:io' as io;

import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/features/custom_screen_elements/custom_screen.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:classipod/features/settings/models/device_finish.dart';
import 'package:classipod/features/settings/models/device_texture.dart';
import 'package:classipod/features/settings/widgets/selection_list_tile.dart';
import 'package:classipod/features/status_bar/widgets/status_bar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

/// Sentinel row that opens the system image picker.
enum _TextureAction { chooseImage }

class DeviceTextureSelectionScreen extends ConsumerStatefulWidget {
  const DeviceTextureSelectionScreen({super.key});

  @override
  ConsumerState createState() => _DeviceTextureSelectionScreenState();
}

class _DeviceTextureSelectionScreenState extends ConsumerState
    with CustomScreen {
  @override
  String get routeName => Routes.deviceTexture.name;

  @override
  List<Object> get displayItems => [
    ...BundledTexture.values,
    _TextureAction.chooseImage,
  ];

  @override
  void initState() {
    super.initState();
    final DeviceTexture? current = DeviceTexture.fromStored(
      ref.read(settingsPreferencesControllerProvider).deviceTexture,
    );
    final int currentIndex = displayItems.indexOf(current?.bundled ?? Object());
    if (currentIndex != -1) {
      selectedDisplayItem = currentIndex;
    }
  }

  @override
  Future<void> onSelectPressed() => _select(selectedDisplayItem);

  Future<void> _select(int index) async {
    setState(() => selectedDisplayItem = index);
    final Object item = displayItems[index];
    if (item is BundledTexture) {
      await _applyTexture(DeviceTexture.fromBundled(item));
      return;
    }
    await _pickImage();
  }

  Future<void> _applyTexture(DeviceTexture texture) async {
    final notifier = ref.read(settingsPreferencesControllerProvider.notifier);
    await notifier.setDeviceTexture(texture);
    // Picking a texture is meaningless unless the finish uses one.
    await notifier.setDeviceFinish(DeviceFinish.texture);
  }

  Future<void> _pickImage() async {
    final FilePickerResult? result = await FilePicker.pickFiles(
      type: FileType.image,
      dialogTitle: context.localization.deviceTextureSettingTitle,
    );
    final String? pickedPath = result?.files.singleOrNull?.path;
    if (pickedPath == null) {
      return;
    }
    // The picked file may live in a cache the system clears, so keep a copy
    // next to the app's own data.
    final io.Directory documentsDirectory =
        await getApplicationDocumentsDirectory();
    final int dotIndex = pickedPath.lastIndexOf('.');
    final String extension = dotIndex == -1
        ? ''
        : pickedPath.substring(dotIndex);
    final String storedPath =
        '${documentsDirectory.path}/device_texture$extension';
    await io.File(pickedPath).copy(storedPath);
    // A previously cached copy under the same name must not be shown instead.
    await FileImage(io.File(storedPath)).evict();
    await _applyTexture(DeviceTexture.fromFile(storedPath));
  }

  @override
  Widget build(BuildContext context) {
    final DeviceTexture? currentTexture = DeviceTexture.fromStored(
      ref.watch(
        settingsPreferencesControllerProvider.select(
          (settings) => settings.deviceTexture,
        ),
      ),
    );

    return CupertinoPageScaffold(
      child: Column(
        children: [
          StatusBar(title: Routes.deviceTexture.title(context)),
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
                  final Object item = displayItems[index];
                  final bool isActive = item is BundledTexture
                      ? currentTexture?.bundled == item
                      : currentTexture?.filePath != null;
                  return SelectionListTile(
                    text: item is BundledTexture
                        ? item.title(context)
                        : context.localization.chooseImageTexture,
                    isActive: isActive,
                    isSelected: selectedDisplayItem == index,
                    onTap: () async => _select(index),
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
