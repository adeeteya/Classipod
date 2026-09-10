import 'package:classipod/core/services/artwork_scraper_service.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final artworkScraperControllerProvider =
    NotifierProvider<ArtworkScraperNotifier, ArtworkScraperState>(
      ArtworkScraperNotifier.new,
    );

@immutable
class ArtworkScraperState {
  final bool isRunning;
  final int completed;
  final int total;
  final ArtworkScrapeResult? result;
  final bool hasFailed;

  const ArtworkScraperState({
    this.isRunning = false,
    this.completed = 0,
    this.total = 0,
    this.result,
    this.hasFailed = false,
  });
}

class ArtworkScraperNotifier extends Notifier<ArtworkScraperState> {
  @override
  ArtworkScraperState build() => const ArtworkScraperState();

  Future<void> fetchMissingArtwork() async {
    if (state.isRunning || !ArtworkScraperService.isSupported) {
      return;
    }
    state = const ArtworkScraperState(isRunning: true);
    try {
      final ArtworkScrapeResult result = await ref
          .read(artworkScraperServiceProvider)
          .fetchMissingArtwork(
            onProgress: (completed, total) {
              state = ArtworkScraperState(
                isRunning: true,
                completed: completed,
                total: total,
              );
            },
          );
      state = ArtworkScraperState(
        completed: result.albumsWithoutArtwork,
        total: result.albumsWithoutArtwork,
        result: result,
      );
      if (result.albumsFound > 0) {
        // The covers are only visible once the library is read back.
        await ref
            .read(settingsPreferencesControllerProvider.notifier)
            .reloadLibrary();
      }
    } on Object catch (error) {
      debugPrint('Artwork scraping failed: $error');
      state = const ArtworkScraperState(hasFailed: true);
    }
  }
}
