import 'dart:io';

import 'package:audio_metadata_reader/audio_metadata_reader.dart';

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
  });

  factory Metadata.fromAudioMetadata(
          AudioMetadata audioMetadata, String thumbnailPath) =>
      Metadata(
        trackName: audioMetadata.title ?? "Unknown Song",
        trackArtistNames:
            audioMetadata.artist?.split(", ").toList() ?? ["Unknown Artist"],
        albumName: audioMetadata.album ?? "Unknown Album",
        albumArtistName:
            audioMetadata.artist?.split(", ")[0] ?? "Unknown Artist",
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
      );

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

  @override
  String toString() => toJson().toString();

  String get getMainArtistName {
    return trackArtistNames?[0].split(", ").first ?? "Unknown Artist";
  }

  String get getTrackArtistNames {
    return trackArtistNames?.toString().substring(
              1,
              trackArtistNames.toString().length - 1,
            ) ??
        "Unknown Artist";
  }

  String getTemporaryThumbnailPath(Directory tempDir) {
    return '${tempDir.path}/$trackName-$getMainArtistName.jpg';
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
