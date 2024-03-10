import 'dart:io';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:retropod/core/extensions.dart';
import 'package:retropod/models/album_details.dart';
import 'package:retropod/models/music_details.dart';
import 'package:retropod/providers/settings_provider.dart';

class MusicNotifier extends Notifier<MusicDetails> {
  MusicNotifier() : super();
  final player = AudioPlayer();
  final List<Metadata> completeMusicFileMetaDataList = [];
  final Set<String> artistNames = {};
  final Set<String> albumNames = {};
  final List<AlbumDetails> albumDetails = [];
  final List<int> artistSongsIndexes = [];

  @override
  MusicDetails build() {
    getAllAudioFiles();

    player.currentIndexStream.listen((event) {
      if (event != null) {
        state = state.copyWith(currentSongIndex: event);
      }
    });

    player.playerStateStream.listen((event) {
      state = state.copyWith(isPlaying: event.playing);
    });

    return MusicDetails(
      currentSongIndex: 0,
      musicFilesMetaDataList: [],
      isPlaying: false,
      isLoading: true,
    );
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  Future<void> requestStoragePermissions() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    status = await Permission.audio.status;
    if (!status.isGranted) {
      await Permission.audio.request();
    }
  }

  Future<void> getAllAudioFiles() async {
    completeMusicFileMetaDataList.clear();
    artistNames.clear();
    albumNames.clear();
    albumDetails.clear();
    artistSongsIndexes.clear();
    await requestStoragePermissions();
    final Directory storageDir =
        Directory(ref.read(settingsProvider).musicFolderPath);
    final List<FileSystemEntity> files;
    files = storageDir.listSync(recursive: true, followLinks: false);
    Metadata songFileMetadata;
    for (FileSystemEntity entity in files) {
      String path = entity.path;
      if (path.endsWith('.mp3') ||
          path.endsWith('.ogg') ||
          path.endsWith('.wav')) {
        songFileMetadata = await MetadataRetriever.fromFile(File(entity.path));
        artistNames.add(songFileMetadata.getTrackArtistNames);
        if (albumNames.add(songFileMetadata.albumName ?? "Unknown Album")) {
          albumDetails.add(AlbumDetails(
              albumName: songFileMetadata.albumName ?? "Unknown Album",
              albumArt: songFileMetadata.albumArt,
              albumArtistName: songFileMetadata.getTrackArtistNames));
        }
        completeMusicFileMetaDataList.add(songFileMetadata);
      }
    }
    state = state.copyWith(
      musicFilesMetaDataList: completeMusicFileMetaDataList,
      isLoading: false,
    );
    await setPlaylist();
  }

  Future<void> shuffleAllSongs({bool isShuffle = true}) async {
    state =
        state.copyWith(musicFilesMetaDataList: completeMusicFileMetaDataList);
    if (isShuffle) {
      await setPlaylist(shuffle: true);
    }
    if (!player.playing) {
      await player.play();
    }
  }

  Future<void> playAlbum(String albumName) async {
    List<Metadata> albumPlaylistMetaData = [];
    for (int i = 0; i < completeMusicFileMetaDataList.length; i++) {
      if ((completeMusicFileMetaDataList[i].albumName ?? "Unknown Album") ==
          albumName) {
        albumPlaylistMetaData.add(completeMusicFileMetaDataList[i]);
      }
    }
    state = state.copyWith(
      musicFilesMetaDataList: albumPlaylistMetaData,
      isLoading: false,
    );
    await setPlaylist();
    await player.play();
  }

  Future<void> setPlaylist({bool shuffle = false}) async {
    final List<AudioSource> songSourcePlaylist = [];
    if (shuffle) {
      state.musicFilesMetaDataList.shuffle();
    }
    for (int i = 0; i < state.musicFilesMetaDataList.length; i++) {
      songSourcePlaylist.add(
        AudioSource.file(
          state.musicFilesMetaDataList[i].filePath ?? "",
          tag: MediaItem(
            id: '$i',
            title: state.musicFilesMetaDataList[i].trackName ?? "Unknown Song",
            album: state.musicFilesMetaDataList[i].albumName ?? "Unknown Album",
            artist: state.musicFilesMetaDataList[i].getTrackArtistNames,
          ),
        ),
      );
    }
    await player.setAudioSource(
      ConcatenatingAudioSource(
        useLazyPreparation: true,
        shuffleOrder: DefaultShuffleOrder(),
        children: songSourcePlaylist,
      ),
      initialIndex: 0,
      initialPosition: Duration.zero,
    );
    await setLoopMode();
  }

  Future<void> setLoopMode() async {
    if (ref.read(settingsProvider).repeat) {
      await player.setLoopMode(LoopMode.all);
    } else {
      await player.setLoopMode(LoopMode.off);
    }
  }

  void fetchArtistSongs(String artistName) {
    artistSongsIndexes.clear();
    for (int i = 0; i < completeMusicFileMetaDataList.length; i++) {
      if (completeMusicFileMetaDataList[i].getTrackArtistNames == artistName) {
        artistSongsIndexes.add(i);
      }
    }
  }

  Future<void> nextSong() async {
    await player.seekToNext();
  }

  Future<void> previousSong() async {
    await player.seekToPrevious();
  }

  Future<void> playAtIndex(int index) async {
    if (state.isPlaying) {
      await player.stop();
      state =
          state.copyWith(musicFilesMetaDataList: completeMusicFileMetaDataList);
      await setPlaylist();
    }
    await player.seek(Duration.zero, index: index);
    await player.play();
  }

  Future<void> togglePlayback() async {
    if (state.isPlaying) {
      await player.pause();
    } else {
      await player.play();
    }
  }

  Stream<Duration> getPositionStream() {
    return player.positionStream;
  }

  Future<void> seekForward() async {
    if (player.position.inSeconds <=
        ((state.musicFilesMetaDataList[state.currentSongIndex].trackDuration ??
                    0) /
                1000) -
            3) {
      await player.seek(Duration(seconds: player.position.inSeconds + 1));
    }
  }

  Future<void> seekBackward() async {
    if (player.position.inSeconds > 3) {
      await player.seek(Duration(seconds: player.position.inSeconds - 1));
    }
  }
}

final musicProvider =
    NotifierProvider<MusicNotifier, MusicDetails>(() => MusicNotifier());
