import 'package:classipod/core/widgets/box_progress_bar.dart';
import 'package:classipod/providers/music_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VolumeBar extends ConsumerWidget {
  const VolumeBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        const Icon(CupertinoIcons.volume_down),
        StreamBuilder<double>(
            stream: ref.read(musicProvider.notifier).getVolumeStream(),
            builder: (context, snapshot) {
              return BoxProgressBar(
                max: 1.0,
                value: snapshot.data ?? 0.0,
              );
            }),
        const Icon(CupertinoIcons.volume_up),
      ],
    );
  }
}
