import 'package:classipod/core/widgets/about_list_tile.dart';
import 'package:classipod/providers/music_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AboutScreen extends ConsumerWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      child: Padding(
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
                  "${ref.read(musicProvider.notifier).completeMusicFileMetaDataList.length}",
            ),
            AboutListTile(
              titleText: "Artists",
              valueText:
                  "${ref.read(musicProvider.notifier).artistNames.length}",
            ),
            AboutListTile(
              titleText: "Albums",
              valueText:
                  "${ref.read(musicProvider.notifier).albumNames.length}",
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
    );
  }
}

//TODO: Update App Version Before Upload
