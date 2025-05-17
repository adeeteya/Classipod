import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/extensions/go_router_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/services/audio_files_service.dart';
import 'package:classipod/features/about/widget/about_list_tile.dart';
import 'package:classipod/features/device/models/device_action.dart';
import 'package:classipod/features/device/services/device_buttons_service_provider.dart';
import 'package:classipod/features/music/album/providers/album_details_provider.dart';
import 'package:classipod/features/music/artists/providers/artist_names_provider.dart';
import 'package:classipod/features/status_bar/widgets/status_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AboutScreen extends ConsumerWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(deviceButtonsServiceProvider, (prevState, newState) {
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
          StatusBar(title: Routes.about.title(context)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  context.localization.appTitle,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.black,
                  ),
                ),
                const SizedBox(height: 10),
                AboutListTile(
                  titleText: context.localization.songsScreenTitle,
                  valueText:
                      "${ref.read(audioFilesServiceProvider).requireValue.length}",
                ),
                AboutListTile(
                  titleText: context.localization.artistsScreenTitle,
                  valueText: "${ref.read(artistNamesProvider).length}",
                ),
                AboutListTile(
                  titleText: context.localization.albumsScreenTitle,
                  valueText: "${ref.read(albumDetailsProvider).length}",
                ),
                AboutListTile(
                  titleText: context.localization.versionAboutScreenTitle,
                  valueText: "1.10.1",
                ),
                AboutListTile(
                  titleText: context.localization.madeWithLoveTitle,
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
