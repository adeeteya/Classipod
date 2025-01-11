import 'package:classipod/core/extensions.dart';
import 'package:classipod/core/routes.dart';
import 'package:classipod/core/widgets/about_list_tile.dart';
import 'package:classipod/models/device_action.dart';
import 'package:classipod/providers/device_buttons_provider.dart';
import 'package:classipod/screens/status_bar/status_bar.dart';
import 'package:classipod/services/audio_files_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AboutScreen extends ConsumerWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(deviceButtonProvider, (prevState, newState) {
      if (newState == null ||
          context.router.locationNamed != Routes.about.name) {
        return;
      } else if (newState == DeviceAction.menu) {
        context.pop();
      }
    });

    return CupertinoPageScaffold(
      child: Column(
        children: [
          StatusBar(
            title: Routes.about.title,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  "ClassiPod",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.black,
                  ),
                ),
                const SizedBox(height: 10),
                AboutListTile(
                  titleText: "Songs",
                  valueText:
                      "${ref.read(audioFilesServiceProvider).requireValue.length}",
                ),
                AboutListTile(
                  titleText: "Artists",
                  valueText:
                      "${ref.read(audioFilesServiceProvider).requireValue.length}",
                ),
                AboutListTile(
                  titleText: "Albums",
                  valueText:
                      "${ref.read(audioFilesServiceProvider).requireValue.length}",
                ),
                const AboutListTile(
                  titleText: "Version",
                  valueText: "1.00",
                ),
                const AboutListTile(
                  titleText: "Made with ❤️ by",
                  valueText: "Aditya",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
