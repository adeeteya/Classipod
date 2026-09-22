import 'dart:io';

import 'package:classipod/core/constants/constants.dart';
import 'package:classipod/core/repositories/library/library_repository.dart';
import 'package:classipod/core/repositories/library/metadata_worker.dart';
import 'package:classipod/core/repositories/library/sources/file_library_source.dart';
import 'package:classipod/features/music/playlist/models/playlist_model.dart';
import 'package:classipod/hive/hive_registrar.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late Directory temporary;
  late Directory music;
  setUp(() async {
    temporary = await Directory.systemTemp.createTemp('shared-library-');
    music = await Directory('${temporary.path}/music').create();
    Hive.init('${temporary.path}/db');
    Hive.registerAdapters();
    await Hive.openBox<PlaylistModel>(Constants.playlistBoxName);
  });
  tearDown(() async {
    await Hive.close();
    Hive.resetAdapters();
    await temporary.delete(recursive: true);
  });

  test(
    'directory discovery returns file identities and authoritative folders',
    () async {
      final song = await File('${music.path}/Song.MP3').writeAsBytes([1, 2]);
      await File('${music.path}/ignore.txt').writeAsString('ignore');
      final first = await discoverFileLocations({'directory': music.path});
      expect(first.songs.single.uri, song.absolute.uri.toString());
      expect(first.songs.single.size, 2);
      expect(first.volumes, [music.absolute.uri.toString()]);
      await song.delete();
      final empty = await discoverFileLocations({'directory': music.path});
      expect(empty.songs, isEmpty);
      expect(empty.volumes, first.volumes);
      await music.delete(recursive: true);
      final disconnected = await discoverFileLocations({
        'directory': music.path,
      });
      expect(disconnected.volumes, isEmpty);
    },
  );

  test(
    'file selections survive relaunch and cancellation of manual reselection',
    () async {
      final song = await File('${music.path}/song.mp3').writeAsBytes([1]);
      var picks = 0;
      final source = FileLibrarySource(
        pickLocations: () async {
          picks++;
          return {
            'files': [song.path],
          };
        },
      );
      expect((await source.discover()).songs, hasLength(1));
      expect((await source.discover()).songs, hasLength(1));
      expect(picks, 1);
      await Hive.close();
      final reopened = FileLibrarySource(
        pickLocations: () async {
          picks++;
          return null;
        },
      );
      expect((await reopened.discover()).songs, hasLength(1));
      expect(picks, 1);
      reopened.selectAgain();
      expect((await reopened.discover()).songs, hasLength(1));
      expect(picks, 2);
      await song.delete();
      final deleted = await reopened.discover();
      expect(deleted.songs, isEmpty);
      expect(deleted.volumes, isNotEmpty);
    },
  );

  test(
    'desktop metadata uses shared indexing, cache repair and ratings',
    () async {
      final fixture = File('test/test_files/mp3/Faded.mp3');
      final song = await fixture.copy('${music.path}/Faded.mp3');
      var reads = 0;
      final worker = await MetadataWorker.start();
      addTearDown(worker.close);
      final repository = LibraryRepository(
        artworkDirectory: '${temporary.path}/artwork',
        discover: () => discoverFileLocations({'directory': music.path}),
        readTags: (uri, {artworkDirectory}) async {
          reads++;
          return worker.read(uri, artworkDirectory: artworkDirectory);
        },
      );
      final first = await repository.load((_) {});
      expect(first.single.trackName, 'Faded');
      expect(first.single.songId, song.absolute.uri.toString());
      expect(first.single.albumArtistNames, isNotEmpty);
      expect(first.single.thumbnailPath, isNotNull);
      expect(await File(first.single.thumbnailPath!).exists(), isTrue);
      await LibraryRepository.updateRating(first.single.copyWith(rating: 4));
      reads = 0;
      final warm = await repository.load((_) {});
      expect(reads, 0);
      expect(warm.single.rating, 4);
      await File(warm.single.thumbnailPath!).delete();
      final repaired = await repository.load((_) {});
      expect(reads, 1);
      expect(await File(repaired.single.thumbnailPath!).exists(), isTrue);
      expect(Hive.isBoxOpen(Constants.libraryBoxName), isTrue);
      expect(Hive.isBoxOpen(Constants.metadataBoxName), isFalse);
    },
  );
}
