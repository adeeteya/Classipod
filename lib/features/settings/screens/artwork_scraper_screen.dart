import 'dart:async';

import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/features/custom_screen_elements/custom_screen.dart';
import 'package:classipod/features/settings/controller/artwork_scraper_controller.dart';
import 'package:classipod/features/status_bar/widgets/status_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Downloads the covers of the albums whose files carry none.
///
/// The lookup starts as soon as the screen opens and can be run again with the
/// select button once it is done.
class ArtworkScraperScreen extends ConsumerStatefulWidget {
  const ArtworkScraperScreen({super.key});

  @override
  ConsumerState createState() => _ArtworkScraperScreenState();
}

class _ArtworkScraperScreenState extends ConsumerState with CustomScreen {
  @override
  String get routeName => Routes.artworkScraper.name;

  @override
  List<Object> get displayItems => const ['status'];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _start());
  }

  @override
  void onSelectPressed() => _start();

  void _start() {
    unawaited(
      ref.read(artworkScraperControllerProvider.notifier).fetchMissingArtwork(),
    );
  }

  String _statusText(ArtworkScraperState state) {
    if (state.isRunning) {
      return state.total == 0
          ? context.localization.artworkScraperSearching
          : "${state.completed}/${state.total}";
    }
    if (state.hasFailed) {
      return context.localization.artworkScraperFailed;
    }
    final result = state.result;
    if (result == null) {
      return context.localization.artworkScraperSearching;
    }
    if (result.albumsWithoutArtwork == 0) {
      return context.localization.artworkScraperNothingMissing;
    }
    return "${result.albumsFound}/${result.albumsWithoutArtwork}";
  }

  @override
  Widget build(BuildContext context) {
    final ArtworkScraperState scraperState = ref.watch(
      artworkScraperControllerProvider,
    );
    final bool isFinished = !scraperState.isRunning && !scraperState.hasFailed;

    return CupertinoPageScaffold(
      child: Column(
        children: [
          StatusBar(title: Routes.artworkScraper.title(context)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 12,
                children: [
                  Icon(
                    scraperState.hasFailed
                        ? CupertinoIcons.exclamationmark_circle
                        : CupertinoIcons.cloud_download,
                    size: 34,
                    color: context.appPrimaryTextColor,
                  ),
                  Text(
                    _statusText(scraperState),
                    textAlign: TextAlign.center,
                    style: CupertinoTheme.of(context).textTheme.textStyle
                        .copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: context.appPrimaryTextColor,
                        ),
                  ),
                  Text(
                    scraperState.isRunning
                        ? context.localization.artworkScraperRunning
                        : isFinished && scraperState.result != null
                        ? context.localization.artworkScraperDone
                        : context.localization.artworkScraperHint,
                    textAlign: TextAlign.center,
                    style: CupertinoTheme.of(context).textTheme.textStyle
                        .copyWith(
                          fontSize: 14,
                          color: context.appSecondaryTextColor,
                        ),
                  ),
                  if (scraperState.isRunning)
                    const CupertinoActivityIndicator(radius: 9),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
