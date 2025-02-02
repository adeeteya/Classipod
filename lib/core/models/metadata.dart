import 'package:audio_metadata_reader/audio_metadata_reader.dart';
import 'package:classipod/core/constants/constants.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

class Metadata {
  /// Name of the track.
  final String? trackName;

  /// Names of the artists performing in the track.
  final List<String>? trackArtistNames;

  /// Name of the album.
  final String? albumName;

  /// Name of the album artist.
  final String? albumArtistName;

  /// Position of track in the album.
  final int? trackNumber;

  /// Number of tracks in the album.
  final int? albumLength;

  /// Year of the track.
  final int? year;

  /// Genres of the track.
  final List<String> genres;

  /// Number of the disc.
  final int? discNumber;

  /// Mime type.
  final String? mimeType;

  /// Duration of the track in milliseconds.
  final int? trackDuration;

  /// Bitrate of the track.
  final int? bitrate;

  /// File path of the media file. `null` on web.
  final String? filePath;

  /// File path of the thumbnail album art file.
  final String? thumbnailPath;

  /// Original Song Index
  final int originalSongIndex;

  const Metadata({
    this.trackName,
    this.trackArtistNames,
    this.albumName,
    this.albumArtistName,
    this.trackNumber,
    this.albumLength,
    this.year,
    this.genres = const [],
    this.discNumber,
    this.mimeType,
    this.trackDuration,
    this.bitrate,
    this.filePath,
    this.thumbnailPath,
    this.originalSongIndex = 0,
  });

  factory Metadata.fromAudioMetadata(
    AudioMetadata audioMetadata,
    String? thumbnailPath,
    int originalSongIndex,
  ) {
    final artist = audioMetadata.artist ?? "Unknown Artist";
    late final List<String> trackArtistNames;
    if (artist.contains(',')) {
      trackArtistNames = artist.split(',').toList();
    } else if (artist.contains('/')) {
      trackArtistNames = artist.split('/').toList();
    } else if (artist.contains(';')) {
      trackArtistNames = artist.split(';').toList();
    } else {
      trackArtistNames = [artist];
    }

    return Metadata(
      trackName: audioMetadata.title ?? "Unknown Song",
      trackArtistNames: trackArtistNames,
      albumName: audioMetadata.album ?? "Unknown Album",
      albumArtistName: trackArtistNames[0],
      trackNumber: audioMetadata.trackNumber,
      albumLength: audioMetadata.trackTotal,
      year: audioMetadata.year?.year,
      genres: audioMetadata.genres,
      discNumber: audioMetadata.discNumber,
      mimeType: audioMetadata.pictures.isEmpty
          ? null
          : audioMetadata.pictures[0].mimetype,
      trackDuration: audioMetadata.duration?.inMilliseconds,
      bitrate: audioMetadata.bitrate,
      filePath: audioMetadata.file.path,
      thumbnailPath: thumbnailPath,
      originalSongIndex: originalSongIndex,
    );
  }

  factory Metadata.fromJson(dynamic map) => Metadata(
        trackName: map['metadata']['trackName'],
        trackArtistNames: map['metadata']['trackArtistNames']?.split('/'),
        albumName: map['metadata']['albumName'],
        albumArtistName: map['metadata']['albumArtistName'],
        trackNumber: parseInteger(map['metadata']['trackNumber']),
        albumLength: parseInteger(map['metadata']['albumLength']),
        year: parseInteger(map['metadata']['year']),
        genres: map['genres'],
        discNumber: parseInteger(map['metadata']['discNumber']),
        mimeType: map['metadata']['mimeType'],
        trackDuration: parseInteger(map['metadata']['trackDuration']),
        bitrate: parseInteger(map['metadata']['bitrate']),
        filePath: map['filePath'],
      );

  Map<String, dynamic> toJson() => {
        'trackName': trackName,
        'trackArtistNames': trackArtistNames,
        'albumName': albumName,
        'albumArtistName': albumArtistName,
        'trackNumber': trackNumber,
        'albumLength': albumLength,
        'year': year,
        'genres': genres,
        'discNumber': discNumber,
        'mimeType': mimeType,
        'trackDuration': trackDuration,
        'bitrate': bitrate,
        'filePath': filePath,
      };

  AudioSource toAudioSource() {
    return AudioSource.file(
      filePath ?? '',
      tag: MediaItem(
        id: filePath ?? '',
        title: trackName ?? "Unknown Song",
        album: albumName ?? "Unknown Album",
        artist: getTrackArtistNames,
        genre: genres.isEmpty ? null : genres[0],
        duration: trackDuration != null
            ? Duration(milliseconds: trackDuration!)
            : null,
        artUri: thumbnailPath == null
            ? Uri.parse(
                Constants.defaultNotificationAlbumArtImageUrl,
              )
            : Uri.file(thumbnailPath!),
      ),
    );
  }

  @override
  String toString() => toJson().toString();

  String get getTrackName {
    return trackName ?? 'Unknown Song';
  }

  String get getAlbumName {
    return albumName ?? "Unknown Album";
  }

  String get getAlbumArtistName {
    return albumArtistName ?? "Unknown Album Artist";
  }

  int get getTrackDuration {
    return trackDuration ?? 0;
  }

  String get getMainArtistName {
    return trackArtistNames?[0] ?? "Unknown Artist";
  }

  String get getTrackArtistNames {
    return trackArtistNames?.toString().substring(
              1,
              trackArtistNames.toString().length - 1,
            ) ??
        "Unknown Artist";
  }

  String get getMainGenre {
    return genres.isNotEmpty ? genres[0] : "Unknown Genre";
  }
}

int? parseInteger(dynamic value) {
  if (value == null) {
    return null;
  }
  if (value is int) {
    return value;
  } else if (value is String) {
    try {
      try {
        return int.parse(value);
      } catch (_) {
        return int.parse(value.split('/').first);
      }
    } catch (_) {}
  }
  return null;
}
