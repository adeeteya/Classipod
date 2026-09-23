import 'package:classipod/core/repositories/library/library_progress.dart';
import 'package:classipod/features/app_startup/widgets/library_loading_progress.dart';
import 'package:classipod/l10n/generated/app_localizations.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Future<void> show(WidgetTester tester, LibraryProgress progress) async {
    await tester.pumpWidget(
      CupertinoApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('en'),
        home: Center(child: LibraryLoadingProgress(progress: progress)),
      ),
    );
  }

  testWidgets(
    'discovery shows its label and extraction shows the artwork count',
    (tester) async {
      await show(tester, const LibraryProgress());
      expect(find.text('Finding songs…'), findsOneWidget);
      expect(find.textContaining('Artwork cached:'), findsNothing);
      await show(
        tester,
        const LibraryProgress(
          phase: LibraryPhase.metadata,
          showCounts: true,
          songsLoaded: 1,
          songsTotal: 2,
          artworkCached: 1,
        ),
      );
      expect(find.text('Artwork cached: 1'), findsOneWidget);
    },
  );

  testWidgets('song and artwork counts are above the loader', (tester) async {
    await show(
      tester,
      const LibraryProgress(
        phase: LibraryPhase.artwork,
        showCounts: true,
        songsLoaded: 120,
        songsTotal: 120,
        artworkCached: 80,
        artworkTotal: 100,
        failures: 2,
      ),
    );
    final songs = find.text('Songs loaded: 120 / 120');
    final artwork = find.text('Artwork cached: 80');
    expect(songs, findsOneWidget);
    expect(artwork, findsOneWidget);
    expect(find.text('Could not read 2 items'), findsOneWidget);
    expect(
      tester.getBottomLeft(artwork).dy,
      lessThan(tester.getTopLeft(find.byType(CupertinoActivityIndicator)).dy),
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('warm startup hides counts through completion', (tester) async {
    for (final phase in [
      LibraryPhase.metadata,
      LibraryPhase.artwork,
      LibraryPhase.saving,
      LibraryPhase.complete,
    ]) {
      await show(
        tester,
        LibraryProgress(
          phase: phase,
          songsLoaded: 100,
          songsTotal: 100,
          artworkCached: 80,
          failures: 1,
        ),
      );
      expect(find.textContaining('Songs loaded:'), findsNothing);
      expect(find.textContaining('Artwork cached:'), findsNothing);
      expect(find.byType(CupertinoActivityIndicator), findsOneWidget);
      expect(find.text('Could not read 1 items'), findsOneWidget);
    }
  });

  testWidgets('empty library shows zero totals', (tester) async {
    await show(
      tester,
      const LibraryProgress(
        phase: LibraryPhase.complete,
        showCounts: true,
        artworkTotal: 0,
      ),
    );
    expect(find.text('Songs loaded: 0 / 0'), findsOneWidget);
    expect(find.text('Artwork cached: 0'), findsOneWidget);
  });
}
