import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/repositories/library/library_progress.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

class LibraryLoadingProgress extends StatelessWidget {
  final LibraryProgress progress;

  const LibraryLoadingProgress({required this.progress, super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.localization;
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Text(
            progress.phase == LibraryPhase.discovering
                ? strings.findingSongs
                : strings.songsLoaded(
                    progress.songsLoaded,
                    progress.songsTotal,
                  ),
            style: const TextStyle(color: CupertinoColors.white, fontSize: 13),
          ),
          Text(
            progress.artworkTotal == null
                ? strings.checkingArtwork
                : strings.artworkCached(
                    progress.artworkCached,
                    progress.artworkTotal!,
                  ),
            style: const TextStyle(color: CupertinoColors.white, fontSize: 13),
          ),
          if (progress.failures > 0)
            Text(
              strings.libraryReadFailures(progress.failures),
              style: const TextStyle(
                color: CupertinoColors.white,
                fontSize: 12,
              ),
            ),
          const SizedBox(height: 10),
          const CupertinoActivityIndicator(color: CupertinoColors.white),
        ],
      ),
    );
  }
}
