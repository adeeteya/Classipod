import 'package:classipod/core/models/library_context.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/services/playback/playback_session.dart';
import 'package:classipod/core/utils/library_filter.dart';
import 'package:flutter_test/flutter_test.dart';

MusicMetadata localSong(String filePath) =>
    MusicMetadata(songId: filePath, filePath: filePath);

MusicMetadata remoteSong() => MusicMetadata(
  serverId: 'one',
  remoteSongId: '7',
  songId: 'subsonic-7',
  filePath: '/storage/emulated/0/Podcasts/remote.mp3',
);

void main() {
  group('shouldDeleteAfterPlaying', () {
    test('deletes a local podcast when the setting is on', () {
      expect(
        shouldDeleteAfterPlaying(
          song: localSong('/storage/emulated/0/Podcasts/show/ep.mp3'),
          enabled: true,
        ),
        isTrue,
      );
    });

    test('never deletes when the setting is off', () {
      for (final path in [
        '/storage/emulated/0/Podcasts/show/ep.mp3',
        '/storage/emulated/0/podcast/ep.mp3',
        '/storage/emulated/0/Audiobooks/author/book.mp3',
        '/storage/emulated/0/Music/band/song.mp3',
      ]) {
        expect(
          shouldDeleteAfterPlaying(song: localSong(path), enabled: false),
          isFalse,
          reason: '$path must survive when the setting is off',
        );
      }
    });

    test('music, audiobooks and rootless paths are never deleted', () {
      expect(
        shouldDeleteAfterPlaying(
          song: localSong('/storage/emulated/0/Music/band/song.mp3'),
          enabled: true,
        ),
        isFalse,
      );
      expect(
        shouldDeleteAfterPlaying(
          song: localSong('/storage/emulated/0/Audiobooks/author/book.mp3'),
          enabled: true,
        ),
        isFalse,
      );
      expect(
        shouldDeleteAfterPlaying(
          song: localSong('/root/song.mp3'),
          enabled: true,
        ),
        isFalse,
      );
    });

    test('podcast folder markers are recognised', () {
      for (final path in [
        '/storage/emulated/0/Podcasts/ep.mp3',
        '/storage/emulated/0/My pod/ep.mp3',
        '/media/usb/CASTS/ep.mp3',
        '/storage/1234/MyPodcasts/2026/ep.mp3',
      ]) {
        expect(
          shouldDeleteAfterPlaying(song: localSong(path), enabled: true),
          isTrue,
          reason: '$path should count as a podcast',
        );
      }
    });

    test('a remote track is left alone inside a podcast folder', () {
      expect(
        shouldDeleteAfterPlaying(song: remoteSong(), enabled: true),
        isFalse,
      );
    });

    test('a song without a path is not deleted', () {
      expect(
        shouldDeleteAfterPlaying(
          song: MusicMetadata(songId: 'no-path'),
          enabled: true,
        ),
        isFalse,
      );
    });
  });

  group('resumesPlaybackPosition', () {
    test('covers podcasts and audiobooks only', () {
      expect(
        resumesPlaybackPosition(
          localSong('/storage/emulated/0/Podcasts/show/ep.mp3'),
        ),
        isTrue,
      );
      expect(
        resumesPlaybackPosition(
          localSong('/storage/emulated/0/Audiobooks/author/book.mp3'),
        ),
        isTrue,
      );
      expect(
        resumesPlaybackPosition(localSong('/storage/emulated/0/Music/a.mp3')),
        isFalse,
      );
      expect(resumesPlaybackPosition(MusicMetadata(songId: 'x')), isFalse);
    });
  });

  group('library context', () {
    test('audiobook folders win over podcast markers', () {
      expect(
        libraryContextOfPath('/storage/emulated/0/Audiobooks/book.mp3'),
        LibraryContext.audiobooks,
      );
      expect(
        libraryContextOfPath('/storage/emulated/0/Podcasts/ep.mp3'),
        LibraryContext.podcasts,
      );
      expect(
        libraryContextOfPath('/storage/emulated/0/Music/song.mp3'),
        LibraryContext.music,
      );
    });
  });
}
