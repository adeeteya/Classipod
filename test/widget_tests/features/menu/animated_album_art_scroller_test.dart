import 'package:classipod/features/menu/widgets/animated_album_art_scroller.dart';
import 'package:classipod/features/music/album/models/album_model.dart';
import 'package:classipod/features/music/album/providers/album_details_provider.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('changes artwork every seven seconds across repeated cycles', (
    tester,
  ) async {
    final albums = ['FadedbyAlanWalker', 'FireflybyJimYosef'].map((name) {
      return AlbumModel(
        albumName: name,
        albumArtistName: name,
        albumArtPath: 'test/test_files/ClassiPod/thumbnails/$name.jpg',
        albumSongs: [],
      );
    }).toList();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [albumDetailsProvider.overrideWithValue(albums)],
        child: const CupertinoApp(
          home: SizedBox(
            width: 200,
            height: 400,
            child: AnimatedAlbumArtScroller(),
          ),
        ),
      ),
    );

    Key? currentArtwork() => tester
        .widget<AnimatedSwitcher>(find.byType(AnimatedSwitcher))
        .child!
        .key;

    Alignment? previousDirection;
    for (var cycle = 0; cycle < 30; cycle++) {
      final previous = currentArtwork();
      final animatedArt = tester.widget<AnimatedAlbumArt>(
        find.byType(AnimatedAlbumArt),
      );
      final animation = animatedArt.listenable as Animation<Alignment>;
      final start = animation.value;
      await tester.pump(const Duration(seconds: 6));
      expect(currentArtwork(), previous);
      // Six seconds covers 30% of a full pan: 0.6 alignment units.
      final displacement = animation.value - start;
      final direction = Alignment(displacement.x.sign, displacement.y.sign);
      expect(direction, isNot(previousDirection));
      previousDirection = direction;
      expect(
        displacement.x.abs() > displacement.y.abs()
            ? displacement.x.abs()
            : displacement.y.abs(),
        closeTo(0.6, 0.001),
      );
      await tester.pump(const Duration(seconds: 1));
      // Completion is delivered on the first frame after the deadline.
      await tester.pump(const Duration(milliseconds: 16));
      expect(currentArtwork(), isNot(previous));
      // Establish the next ticker's first frame without advancing time.
      await tester.pump();
    }
    await tester.pumpWidget(const SizedBox.shrink());
    expect(tester.takeException(), isNull);
  });
}
