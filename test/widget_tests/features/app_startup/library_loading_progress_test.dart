import 'package:classipod/core/repositories/android_library/library_progress.dart';
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

  testWidgets('unknown totals have discovery labels', (tester) async {
    await show(tester, const LibraryProgress());
    expect(find.text('Finding songs…'), findsOneWidget);
    expect(find.text('Checking artwork…'), findsOneWidget);
  });

  testWidgets('song and artwork counts are above the loader', (tester) async {
    await show(
      tester,
      const LibraryProgress(
        phase: LibraryPhase.artwork,
        songsLoaded: 120,
        songsTotal: 120,
        artworkCached: 80,
        artworkTotal: 100,
        failures: 2,
      ),
    );
    final songs = find.text('Songs loaded: 120 / 120');
    final artwork = find.text('Artwork cached: 80 / 100');
    expect(songs, findsOneWidget);
    expect(artwork, findsOneWidget);
    expect(find.text('Could not read 2 items'), findsOneWidget);
    expect(
      tester.getBottomLeft(artwork).dy,
      lessThan(tester.getTopLeft(find.byType(CupertinoActivityIndicator)).dy),
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('empty library shows zero totals', (tester) async {
    await show(
      tester,
      const LibraryProgress(phase: LibraryPhase.complete, artworkTotal: 0),
    );
    expect(find.text('Songs loaded: 0 / 0'), findsOneWidget);
    expect(find.text('Artwork cached: 0 / 0'), findsOneWidget);
  });
}
