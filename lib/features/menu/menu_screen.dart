import 'package:classipod/core/widgets/animated_album_art_scroller.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuScreen extends ConsumerWidget {
  final Widget child;
  const MenuScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final splitScreenEnabled = ref.watch(
      currentSettingsPreferencesProvider.select((e) => e.splitScreenEnabled),
    );

    return CupertinoPageScaffold(
      child: splitScreenEnabled
          ? Row(
              children: [
                Expanded(child: child),
                const Expanded(child: AnimatedAlbumArtScroller()),
              ],
            )
          : child,
    );
  }
}
