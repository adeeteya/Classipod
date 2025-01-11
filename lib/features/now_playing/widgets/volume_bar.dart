import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/features/now_playing/widgets/box_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VolumeBar extends ConsumerWidget {
  const VolumeBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        const Icon(
          CupertinoIcons.volume_down,
          size: 18,
        ),
        StreamBuilder<double>(
          stream: ref.read(audioPlayerProvider).volumeStream,
          builder: (context, snapshot) {
            return BoxProgressBar(
              value: snapshot.data ?? 0.0,
            );
          },
        ),
        const Icon(
          CupertinoIcons.volume_up,
          size: 18,
        ),
      ],
    );
  }
}
