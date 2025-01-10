import 'dart:async';
import 'dart:io';

import 'package:audio_metadata_reader/audio_metadata_reader.dart';
import 'package:classipod/core/extensions.dart';
import 'package:classipod/core/helper_functions.dart';
import 'package:classipod/models/album_details.dart';
import 'package:classipod/models/cover_flow_album_details.dart';
import 'package:classipod/models/metadata.dart';
import 'package:classipod/models/music_details.dart';
import 'package:classipod/features/settings/settings_preferences_provider.dart';
import 'package:classipod/providers/temp_directory_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:permission_handler/permission_handler.dart';

class MusicNotifier extends Notifier<MusicDetails> {
  MusicNotifier() : super();
  final _player = AudioPlayer();
  final List<Metadata> completeMusicFileMetaDataList = [];
  final Set<String> artistNames = {};
  final Set<String> albumNames = {};
  final List<AlbumDetails> albumDetails = [];
  final List<int> artistSongsIndexes = [];
  final List<CoverFlowAlbumDetails> coverFlowAlbumDetails = [];
  String albumName = "";
  String artistName = "";

  @override
  MusicDetails build() {
    unawaited(getAllAudioFiles());

    _player.currentIndexStream.listen((event) {
      if (event != null) {
        state = state.copyWith(currentSongIndex: event);
      }
    });

    _player.playerStateStream.listen((event) {
      state = state.copyWith(isPlaying: event.playing);
    });

    return MusicDetails(
      currentSongIndex: 0,
      musicFilesMetaDataList: [],
      isPlaying: false,
    );
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  Future<void> requestStoragePermissions() async {
    // var status = await Permission.storage.status;
    // if (!status.isGranted) {
    //   await Permission.storage.request();
    // }
    // status = await Permission.audio.status;
    // if (!status.isGranted) {
    //   await Permission.audio.request();
    // }
    try {
      await [Permission.storage, Permission.audio].request();
    } catch (e) {
      throw Exception('Permission request failed');
    }
  }

  Future<void> getFilesMetadata(List<String> filePaths) async {
    final String tempPath = ref.read(tempDirectoryProvider).requireValue.path;
    AudioMetadata audioMetadata;
    try {
      for (final String path in filePaths) {
        if (isSupportedAudioFormat(path)) {
          final String thumbnailFileName = path
              .replaceAll('/', '-')
              .replaceAll(' ', '')
              .replaceAll(".mp3", '.jpg');
          final bool thumbnailExists =
              File('$tempPath/$thumbnailFileName').existsSync();
          //Fetch album art if it doesn't exist
          if (!thumbnailExists) {
            audioMetadata = await readMetadata(File(path), getImage: true);
            if (audioMetadata.pictures.isNotEmpty) {
              final File thumbnailFile =
                  await File('$tempPath/$thumbnailFileName')
                      .create(recursive: true);
              if (path.endsWith('.mp3')) {
                // Store only the image data without the 0,0 elements at the start
                thumbnailFile.writeAsBytesSync(audioMetadata.pictures[0].bytes);
              } else {
                // Store the image data as it is
                thumbnailFile.writeAsBytesSync(audioMetadata.pictures[0].bytes);
              }
            }
          }

          //No need to fetch album art as it already exists
          else {
            audioMetadata = await readMetadata(File(path));
          }

          artistNames.add(audioMetadata.getMainArtistName);
          if (albumNames.add(audioMetadata.album ?? "Unknown Album")) {
            albumDetails.add(
              AlbumDetails(
                albumName: audioMetadata.album ?? "Unknown Album",
                thumbnailPath: "$tempPath/$thumbnailFileName",
                albumArtistName: audioMetadata.getMainArtistName,
              ),
            );
          }
          completeMusicFileMetaDataList.add(
            Metadata.fromAudioMetadata(
              audioMetadata,
              "$tempPath/$thumbnailFileName",
            ),
          );
        }
      }
    } catch (e) {
      throw Exception('Error reading metadata: $e');
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
        Directory(ref.read(settingsPreferencesProvider).musicFolderPath);
    final List<FileSystemEntity> files =
        storageDir.listSync(recursive: true, followLinks: false);
    final List<String> filePaths = files.map((e) => e.path).toList();

    await getFilesMetadata(filePaths);

    final artistNamesList = artistNames.toList()..sort();
    artistNames.clear();
    artistNames.addAll(artistNamesList);
    albumDetails.sort((a, b) => a.albumName.compareTo(b.albumName));
    albumNames.clear();
    albumNames.addAll(albumDetails.map((e) => e.albumName));
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
    if (!_player.playing) {
      await _player.play();
    }
  }

  List<int> fetchArtistSongs(String artistName) {
    artistSongsIndexes.clear();
    for (int i = 0; i < completeMusicFileMetaDataList.length; i++) {
      if (completeMusicFileMetaDataList[i].getMainArtistName == artistName) {
        artistSongsIndexes.add(i);
      }
    }
    return artistSongsIndexes;
  }

  Future<void> playAlbum(String albumName) async {
    final List<Metadata> albumPlaylistMetaData = [];
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
    await _player.play();
  }

  void getCoverFlowAlbumDetails(String albumName) {
    coverFlowAlbumDetails.clear();
    for (int i = 0; i < completeMusicFileMetaDataList.length; i++) {
      if ((completeMusicFileMetaDataList[i].albumName ?? "Unknown Album") ==
          albumName) {
        coverFlowAlbumDetails.add(
          CoverFlowAlbumDetails(
            songIndex: i,
            trackDuration: completeMusicFileMetaDataList[i].trackDuration ?? 0,
            songName:
                completeMusicFileMetaDataList[i].trackName ?? "Unknown Track",
          ),
        );
      }
    }
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
            genre: state.musicFilesMetaDataList[i].genres.isEmpty
                ? null
                : state.musicFilesMetaDataList[i].genres[0],
            artUri: state.musicFilesMetaDataList[i].thumbnailPath == null
                ? Uri.parse(
                    'https://files.radio.co/humorous-skink/staging/default-artwork.png',
                  )
                : Uri.file(state.musicFilesMetaDataList[i].thumbnailPath!),
          ),
        ),
      );
    }
    await _player.setAudioSource(
      ConcatenatingAudioSource(
        shuffleOrder: DefaultShuffleOrder(),
        children: songSourcePlaylist,
      ),
      initialIndex: 0,
      initialPosition: Duration.zero,
    );
    await setLoopMode();
  }

  Future<void> setLoopMode() async {
    if (ref.read(settingsPreferencesProvider).repeat) {
      await _player.setLoopMode(LoopMode.all);
    } else {
      await _player.setLoopMode(LoopMode.off);
    }
  }

  Future<void> nextSong() async {
    await _player.seekToNext();
  }

  Future<void> previousSong() async {
    await _player.seekToPrevious();
  }

  Future<void> playAtIndex(int index) async {
    await _player.pause();
    if (state.musicFilesMetaDataList.length !=
        completeMusicFileMetaDataList.length) {
      state =
          state.copyWith(musicFilesMetaDataList: completeMusicFileMetaDataList);
      await setPlaylist();
    }
    await _player.seek(Duration.zero, index: index);
    await _player.play();
  }

  Future<void> togglePlayback() async {
    if (state.isPlaying) {
      await _player.pause();
    } else {
      await _player.play();
    }
  }

  Stream<Duration> getPositionStream() {
    return _player.positionStream;
  }

  Future<void> seekForward() async {
    if (_player.position.inSeconds <=
        ((state.musicFilesMetaDataList[state.currentSongIndex].trackDuration ??
                    0) /
                1000) -
            3) {
      await _player.seek(Duration(seconds: _player.position.inSeconds + 1));
    }
  }

  Future<void> seekBackward() async {
    if (_player.position.inSeconds > 3) {
      await _player.seek(Duration(seconds: _player.position.inSeconds - 1));
    }
  }

  Stream<double> getVolumeStream() {
    return _player.volumeStream;
  }

  Future<void> decreaseVolume() async {
    if (_player.volume > 0) {
      if (_player.volume <= 0.05) {
        await _player.setVolume(0);
      } else {
        await _player.setVolume(_player.volume - 0.05);
      }
    }
  }

  Future<void> increaseVolume() async {
    if (_player.volume < 1) {
      await _player.setVolume(_player.volume + 0.05);
    }
  }
}

final musicProvider =
    NotifierProvider<MusicNotifier, MusicDetails>(MusicNotifier.new);
