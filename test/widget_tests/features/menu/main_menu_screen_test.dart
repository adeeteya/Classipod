import 'package:classipod/core/models/library_context.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/providers/library_context_provider.dart';
import 'package:classipod/core/utils/library_filter.dart';
import 'package:classipod/core/widgets/display_list_tile.dart';
import 'package:classipod/features/menu/screens/main_menu_screen.dart';
import 'package:classipod/features/music/album/providers/album_details_provider.dart';
import 'package:classipod/features/tutorial/controller/tutorial_controller.dart';
import 'package:classipod/features/tutorial/models/tutorial_model.dart';
import 'package:classipod/l10n/generated/app_localizations.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

/// Caminhos de teste que exercitam a classificação real da biblioteca:
/// `Music` é música, `Podcasts` é podcast e `Audiobooks` é audiolivro.
MusicMetadata _metadata(String filePath, String albumName) {
  return MusicMetadata(
    trackName: albumName,
    albumName: albumName,
    trackArtistNames: const ['Artist'],
    albumArtistName: 'Artist',
    filePath: filePath,
  );
}

final _testLibrary = <MusicMetadata>[
  _metadata('/storage/emulated/0/Music/song.mp3', 'Song Album'),
  _metadata('/storage/emulated/0/Podcasts/show/episode.mp3', 'Podcast Album'),
  _metadata('/storage/emulated/0/Audiobooks/Dune/chapter.mp3', 'Dune'),
];

List<String> _albumNamesFor(LibraryContext context) {
  return buildAlbumDetails(
    _testLibrary.where(
      (song) => libraryContextOfPath(song.filePath) == context,
    ),
  ).map((album) => album.albumName).toList();
}

Future<ProviderContainer> _pumpMainMenu(
  WidgetTester tester, {
  LibraryContext context = LibraryContext.music,
}) async {
  await tester.binding.setSurfaceSize(const Size(320, 480));
  addTearDown(() => tester.binding.setSurfaceSize(null));

  // O menu lê a rota atual para decidir o tipo do split screen, então precisa
  // de um GoRouter de verdade no contexto; a rota de destino é um stub.
  final router = GoRouter(
    initialLocation: '/menu',
    routes: [
      GoRoute(
        path: '/menu',
        builder: (context, state) => const MainMenuScreen(),
        routes: [
          GoRoute(
            path: 'music',
            name: 'musicMenu',
            builder: (context, state) => const SizedBox.shrink(),
            routes: [
              GoRoute(
                path: 'coverflow',
                name: 'coverFlow',
                builder: (context, state) => const SizedBox.shrink(),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        libraryContextProvider.overrideWith((ref) => context),
        // Os tutoriais de primeira execução abrem um overlay animado (e um
        // Timer do marquee) que impedem o teste de assentar. Aqui interessa
        // só a lista de entradas do menu, então eles ficam desligados.
        tutorialControllerProvider.overrideWith(_MenuOnlyTutorial.new),
      ],
      child: CupertinoApp.router(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('en'),
        routerConfig: router,
      ),
    ),
  );
  // O tutorial do menu é animado e nunca assenta, então avança quadros fixos em
  // vez de pumpAndSettle.
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 100));

  final element = tester.element(find.byType(MainMenuScreen));
  return ProviderScope.containerOf(element, listen: false);
}

/// Mantém o menu montado (o container devolvido por `ProviderScope` não pode
/// ser descartado pelo teste), drena o delay inicial do marquee do item
/// selecionado e só então desmonta a árvore.
Future<void> _disposeMainMenu(WidgetTester tester) async {
  await tester.pumpWidget(const SizedBox.shrink());
  await tester.pump(const Duration(milliseconds: 100));
}

/// Controller de tutorial inerte: nunca mostra overlay nem agenda timers, e
/// mantém o `initState` do menu barato para o teste.
class _MenuOnlyTutorial extends TutorialControllerNotifier {
  @override
  void playMenuTutorial() {}

  @override
  TutorialModel build() {
    return TutorialModel(
      isMenuFirstTime: false,
      isNowPlayingFirstTime: false,
      isInputTextBarFirstTime: false,
    );
  }
}

/// Toca num item do menu sem depender do tutorial nem do GoRouter: chama o
/// mesmo callback que o `GestureDetector` da lista usa.
Future<void> _selectMenuItem(WidgetTester tester, String title) async {
  final tile = tester
      .widgetList<DisplayListTile>(find.byType(DisplayListTile))
      .firstWhere((tile) => tile.text == title);
  tile.onTap!();
  await tester.pump();
  await tester.pump(const Duration(seconds: 1));
}

void main() {
  group('library context classification', () {
    test('audiobooks match the book marker only', () {
      expect(
        libraryContextOfPath('/storage/emulated/0/Audiobooks/Dune/01.mp3'),
        LibraryContext.audiobooks,
      );
      expect(
        libraryContextOfPath('/storage/emulated/0/MyBooks/Dune/01.mp3'),
        LibraryContext.audiobooks,
      );
      expect(
        libraryContextOfPath('/storage/emulated/0/Music/song.mp3'),
        LibraryContext.music,
      );
    });

    test('album lists are split per library context', () {
      expect(_albumNamesFor(LibraryContext.music), ['Song Album']);
      expect(_albumNamesFor(LibraryContext.podcasts), ['Podcast Album']);
      expect(_albumNamesFor(LibraryContext.audiobooks), ['Dune']);
    });

    test('every file lands in exactly one context', () {
      final total = LibraryContext.values
          .map((context) => _albumNamesFor(context).length)
          .reduce((a, b) => a + b);
      final allFiles = buildAlbumDetails(_testLibrary).length;
      expect(total, allFiles);
    });
  });

  group('main menu entries', () {
    testWidgets('lists music, podcasts and audiobooks in order', (
      WidgetTester tester,
    ) async {
      addTearDown(() => _disposeMainMenu(tester));
      await _pumpMainMenu(tester);
      // O item selecionado anima o marquee depois de 1s de delay.
      await tester.pump(const Duration(seconds: 1));
      await tester.pump(const Duration(milliseconds: 16));

      final texts = tester
          .widgetList<DisplayListTile>(find.byType(DisplayListTile))
          .map((tile) => tile.text)
          .toList();

      expect(texts, [
        'Music',
        'Podcasts',
        'Audiobooks',
        'Settings',
        'Shuffle Songs',
        'Now Playing',
      ]);
      expect(tester.takeException(), isNull);
    });

    testWidgets('selecting audiobooks switches the library context', (
      WidgetTester tester,
    ) async {
      addTearDown(() => _disposeMainMenu(tester));
      final container = await _pumpMainMenu(tester);
      expect(container.read(libraryContextProvider), LibraryContext.music);

      await _selectMenuItem(tester, 'Audiobooks');

      expect(container.read(libraryContextProvider), LibraryContext.audiobooks);
    });

    testWidgets('selecting podcasts switches the library context', (
      WidgetTester tester,
    ) async {
      addTearDown(() => _disposeMainMenu(tester));
      final container = await _pumpMainMenu(tester);

      await _selectMenuItem(tester, 'Podcasts');

      expect(container.read(libraryContextProvider), LibraryContext.podcasts);
    });

    testWidgets('the music entry restores the music context', (
      WidgetTester tester,
    ) async {
      addTearDown(() => _disposeMainMenu(tester));
      final container = await _pumpMainMenu(
        tester,
        context: LibraryContext.audiobooks,
      );

      await _selectMenuItem(tester, 'Music');

      expect(container.read(libraryContextProvider), LibraryContext.music);
    });
  });
}
