import 'package:classipod/core/models/library_context.dart';
import 'package:classipod/core/utils/library_filter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('isPodcastPath', () {
    test('returns false for null and empty paths', () {
      expect(isPodcastPath(null), isFalse);
      expect(isPodcastPath(''), isFalse);
    });

    test('treats files without a podcast directory as music', () {
      expect(isPodcastPath('/storage/emulated/0/Music/song.mp3'), isFalse);
      expect(
        isPodcastPath('/storage/emulated/0/Download/album/track.flac'),
        isFalse,
      );
    });

    test('detects the casts substring anywhere in a directory name', () {
      expect(isPodcastPath('/storage/emulated/0/Podcasts/episode.mp3'), isTrue);
      expect(
        isPodcastPath('/storage/emulated/0/MyCasts/show/episode.mp3'),
        isTrue,
      );
      expect(
        isPodcastPath('/storage/emulated/0/Broadcasts/2019/episode.mp3'),
        isTrue,
      );
    });

    test('detects the pod substring in a directory name', () {
      expect(isPodcastPath('/storage/emulated/0/Pods/episode.mp3'), isTrue);
      expect(
        isPodcastPath('/storage/emulated/0/MyPod/shows/episode.mp3'),
        isTrue,
      );
    });

    test('detects the cast substring in a directory name', () {
      expect(isPodcastPath('/storage/emulated/0/Casts/episode.mp3'), isTrue);
      expect(
        isPodcastPath('/storage/emulated/0/Broadcast/episode.mp3'),
        isTrue,
      );
    });

    test('is case insensitive', () {
      expect(isPodcastPath('/storage/emulated/0/PODCASTS/episode.mp3'), isTrue);
      expect(isPodcastPath('/storage/emulated/0/pOdCaStS/episode.mp3'), isTrue);
      expect(isPodcastPath('/storage/emulated/0/CASTS/episode.mp3'), isTrue);
      expect(isPodcastPath('/storage/emulated/0/POD/episode.mp3'), isTrue);
    });

    test('handles Windows separators', () {
      expect(isPodcastPath(r'C:\Users\me\Podcasts\episode.mp3'), isTrue);
      expect(isPodcastPath(r'C:\Users\me\Pods\episode.mp3'), isTrue);
      expect(isPodcastPath(r'C:\Users\me\Music\song.mp3'), isFalse);
    });

    test('ignores the file name when classifying', () {
      expect(
        isPodcastPath('/storage/emulated/0/Music/broadcasts.mp3'),
        isFalse,
      );
      expect(isPodcastPath('/storage/emulated/0/Music/pod.mp3'), isFalse);
    });

    test('detects a podcast directory in a nested parent path', () {
      expect(
        isPodcastPath('/storage/emulated/0/shows/casts/deep/episode.mp3'),
        isTrue,
      );
      expect(
        isPodcastPath('/storage/emulated/0/shows/pods/deep/episode.mp3'),
        isTrue,
      );
    });
  });

  group('isAudiobookPath', () {
    test('returns false for null and empty paths', () {
      expect(isAudiobookPath(null), isFalse);
      expect(isAudiobookPath(''), isFalse);
    });

    test('treats files without a book directory as music', () {
      expect(isAudiobookPath('/storage/emulated/0/Music/song.mp3'), isFalse);
      expect(
        isAudiobookPath('/storage/emulated/0/Download/album/track.flac'),
        isFalse,
      );
    });

    test('detects the book substring anywhere in a directory name', () {
      expect(
        isAudiobookPath('/storage/emulated/0/Audiobooks/dune.mp3'),
        isTrue,
      );
      expect(
        isAudiobookPath('/storage/emulated/0/MyBooks/dune/01.mp3'),
        isTrue,
      );
      expect(
        isAudiobookPath('/storage/emulated/0/Book/Author/dune.mp3'),
        isTrue,
      );
    });

    test('is case insensitive', () {
      expect(
        isAudiobookPath('/storage/emulated/0/AUDIOBOOKS/dune.mp3'),
        isTrue,
      );
      expect(isAudiobookPath('/storage/emulated/0/bOoKs/dune.mp3'), isTrue);
    });

    test('handles Windows separators', () {
      expect(isAudiobookPath(r'C:\Users\me\Audiobooks\dune.mp3'), isTrue);
      expect(isAudiobookPath(r'C:\Users\me\Music\song.mp3'), isFalse);
    });

    test('ignores the file name when classifying', () {
      expect(
        isAudiobookPath('/storage/emulated/0/Music/audiobook.mp3'),
        isFalse,
      );
    });

    test('detects a book directory in a nested parent path', () {
      expect(
        isAudiobookPath('/storage/emulated/0/library/audiobooks/deep/dune.mp3'),
        isTrue,
      );
    });

    test('a path matching podcasts and audiobooks is only an audiobook', () {
      expect(
        isAudiobookPath('/storage/emulated/0/Podcasts/Audiobooks/ep.mp3'),
        isTrue,
      );
      expect(
        isPodcastPath('/storage/emulated/0/Podcasts/Audiobooks/ep.mp3'),
        isFalse,
      );
      expect(
        libraryContextOfPath('/storage/emulated/0/Podcasts/Audiobooks/ep.mp3'),
        LibraryContext.audiobooks,
      );
    });
  });

  group('libraryContextOfPath', () {
    test('classifies unrecognised paths as music', () {
      expect(
        libraryContextOfPath('/storage/emulated/0/Music/song.mp3'),
        LibraryContext.music,
      );
      expect(libraryContextOfPath(null), LibraryContext.music);
      expect(libraryContextOfPath(''), LibraryContext.music);
    });

    test('classifies podcasts, audiobooks and plain files apart', () {
      expect(
        libraryContextOfPath('/storage/emulated/0/Podcasts/ep.mp3'),
        LibraryContext.podcasts,
      );
      expect(
        libraryContextOfPath('/storage/emulated/0/Audiobooks/dune.mp3'),
        LibraryContext.audiobooks,
      );
      expect(
        libraryContextOfPath('/storage/emulated/0/Music/song.mp3'),
        LibraryContext.music,
      );
    });
  });

  group('isAndroidDataPath', () {
    test('returns false for null and empty paths', () {
      expect(isAndroidDataPath(null), isFalse);
      expect(isAndroidDataPath(''), isFalse);
    });

    test('detects the Android tree on internal storage', () {
      expect(
        isAndroidDataPath('/storage/emulated/0/Android/media/episode.mp3'),
        isTrue,
      );
      expect(
        isAndroidDataPath(
          '/storage/emulated/0/Android/media/de.danoeh.antennapod/media/ep.mp3',
        ),
        isTrue,
      );
      expect(
        isAndroidDataPath('/storage/emulated/0/Android/data/pkg/files/ep.mp3'),
        isTrue,
      );
    });

    test('detects the Android tree on a removable card', () {
      expect(
        isAndroidDataPath('/storage/1234-5678/Android/media/episode.mp3'),
        isTrue,
      );
    });

    test('is case insensitive and handles Windows separators', () {
      expect(
        isAndroidDataPath('/storage/emulated/0/ANDROID/media/episode.mp3'),
        isTrue,
      );
      expect(
        isAndroidDataPath(r'C:\Users\me\Android\media\episode.mp3'),
        isTrue,
      );
    });

    test('keeps normal music paths included', () {
      expect(isAndroidDataPath('/storage/emulated/0/Music/song.mp3'), isFalse);
      expect(
        isAndroidDataPath('/storage/1234-5678/Podcasts/episode.mp3'),
        isFalse,
      );
    });

    test('only matches the exact Android segment', () {
      expect(
        isAndroidDataPath('/storage/emulated/0/AndroidStuff/song.mp3'),
        isFalse,
      );
      expect(
        isAndroidDataPath('/storage/emulated/0/MyAndroid/song.mp3'),
        isFalse,
      );
    });
  });

  group('isDefaultIncludedDirectory', () {
    test('returns false for null and empty paths', () {
      expect(isDefaultIncludedDirectory(null), isFalse);
      expect(isDefaultIncludedDirectory(''), isFalse);
    });

    test('includes the default Android folders', () {
      expect(isDefaultIncludedDirectory('/storage/emulated/0/Music'), isTrue);
      expect(
        isDefaultIncludedDirectory('/storage/emulated/0/Podcasts'),
        isTrue,
      );
    });

    test('includes subfolders of the default folders', () {
      expect(
        isDefaultIncludedDirectory('/storage/emulated/0/Music/Rock/Live'),
        isTrue,
      );
      expect(
        isDefaultIncludedDirectory('/storage/emulated/0/Podcasts/show/2024'),
        isTrue,
      );
    });

    test('includes the default folders on a removable card', () {
      expect(isDefaultIncludedDirectory('/storage/1234-5678/Music'), isTrue);
      expect(
        isDefaultIncludedDirectory('/storage/1234-5678/Podcasts/show'),
        isTrue,
      );
    });

    test('is case insensitive and handles Windows separators', () {
      expect(isDefaultIncludedDirectory('/storage/emulated/0/MUSIC'), isTrue);
      expect(isDefaultIncludedDirectory(r'C:\Users\me\Music\Album'), isTrue);
    });

    test('excludes folders that are not default', () {
      expect(
        isDefaultIncludedDirectory('/storage/emulated/0/Download'),
        isFalse,
      );
      expect(
        isDefaultIncludedDirectory('/storage/emulated/0/Documents/Albums'),
        isFalse,
      );
      expect(isDefaultIncludedDirectory('/storage/emulated/0/DCIM'), isFalse);
    });

    test('never includes anything under the Android tree', () {
      expect(
        isDefaultIncludedDirectory('/storage/emulated/0/Android/media/Music'),
        isFalse,
      );
      expect(
        isDefaultIncludedDirectory('/storage/emulated/0/Android/data/Music'),
        isFalse,
      );
    });

    test('does not match a folder that merely contains the word', () {
      expect(
        isDefaultIncludedDirectory('/storage/emulated/0/MyMusic'),
        isFalse,
      );
      expect(
        isDefaultIncludedDirectory('/storage/emulated/0/MusicStuff'),
        isFalse,
      );
    });
  });

  group('isExcludedByDefault', () {
    tearDown(resetAndroidScanOverride);

    test('includes only the default folders on Android', () {
      setAndroidScanOverride(() => true);
      expect(isExcludedByDefault('/storage/emulated/0/Music'), isFalse);
      expect(isExcludedByDefault('/storage/emulated/0/Podcasts'), isFalse);
      expect(isExcludedByDefault('/storage/emulated/0/Download'), isTrue);
      expect(
        isExcludedByDefault('/storage/emulated/0/Android/media/pkg/media'),
        isTrue,
      );
    });

    test('excludes null and empty paths on Android', () {
      setAndroidScanOverride(() => true);
      expect(isExcludedByDefault(null), isTrue);
      expect(isExcludedByDefault(''), isTrue);
    });

    test('never excludes on non-Android platforms', () {
      setAndroidScanOverride(() => false);
      expect(isExcludedByDefault('/home/user/Downloads/Albums'), isFalse);
      expect(isExcludedByDefault('/Users/me/Music'), isFalse);
      expect(isExcludedByDefault('/primary/1.mp3'), isFalse);
    });
  });
}
