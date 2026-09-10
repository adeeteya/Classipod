import 'dart:convert';
import 'dart:io' as io;

import 'package:classipod/core/constants/constants.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/core/repositories/metadata_reader_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

final artworkScraperServiceProvider = Provider<ArtworkScraperService>((ref) {
  return ArtworkScraperService(
    ref.read(metadataReaderRepositoryProvider).thumbnailsDirectoryPath,
  );
});

/// An album that has no artwork yet, identified the way the library groups
/// tracks together.
@immutable
class _AlbumKey {
  final String album;
  final String artist;

  const _AlbumKey({required this.album, required this.artist});

  @override
  bool operator ==(Object other) =>
      other is _AlbumKey && other.album == album && other.artist == artist;

  @override
  int get hashCode => Object.hash(album, artist);
}

/// Outcome of one run, so the UI can say what was actually retrieved.
@immutable
class ArtworkScrapeResult {
  final int albumsWithoutArtwork;
  final int albumsFound;

  const ArtworkScrapeResult({
    required this.albumsWithoutArtwork,
    required this.albumsFound,
  });
}

/// Looks up cover art for albums whose files carry none.
///
/// Album and artist names are sent to Apple's public iTunes Search API, which
/// needs no key, so this only ever runs when the user explicitly asks for it.
class ArtworkScraperService {
  static const String _searchHost = 'itunes.apple.com';
  static const String _searchPath = '/search';
  static const Duration _requestTimeout = Duration(seconds: 15);

  /// Kept well below any rate limit, since a library can hold many albums.
  static const Duration _delayBetweenRequests = Duration(milliseconds: 300);

  final String thumbnailsDirectoryPath;

  ArtworkScraperService(this.thumbnailsDirectoryPath);

  /// Only the platforms with a dart:io HTTP client can reach the service.
  static bool get isSupported => !kIsWeb;

  Future<ArtworkScrapeResult> fetchMissingArtwork({
    void Function(int completed, int total)? onProgress,
  }) async {
    final Box<MusicMetadata> metadataBox = Hive.box<MusicMetadata>(
      Constants.metadataBoxName,
    );

    // Tracks of the same album share one cover, so each album is fetched once.
    final Map<_AlbumKey, List<dynamic>> albumsWithoutArtwork = {};
    for (final MapEntry<dynamic, MusicMetadata> entry
        in metadataBox.toMap().entries) {
      final MusicMetadata metadata = entry.value;
      if (metadata.thumbnailPath != null) {
        continue;
      }
      final String? album = metadata.albumName;
      final String? artist =
          metadata.albumArtistName ?? metadata.trackArtistNames?.firstOrNull;
      if (album == null || album.isEmpty) {
        continue;
      }
      albumsWithoutArtwork
          .putIfAbsent(
            _AlbumKey(album: album, artist: artist ?? ''),
            () => <dynamic>[],
          )
          .add(entry.key);
    }

    if (albumsWithoutArtwork.isEmpty) {
      return const ArtworkScrapeResult(albumsWithoutArtwork: 0, albumsFound: 0);
    }

    final io.HttpClient httpClient = io.HttpClient()
      ..connectionTimeout = _requestTimeout
      ..userAgent = 'ClassiPod artwork lookup';

    int completed = 0;
    int found = 0;
    try {
      for (final MapEntry<_AlbumKey, List<dynamic>> album
          in albumsWithoutArtwork.entries) {
        final String? artworkPath = await _fetchArtwork(
          httpClient: httpClient,
          albumKey: album.key,
        );
        if (artworkPath != null) {
          found++;
          for (final dynamic boxKey in album.value) {
            final MusicMetadata? metadata = metadataBox.get(boxKey);
            if (metadata != null) {
              await metadataBox.put(
                boxKey,
                metadata.copyWith(thumbnailPath: artworkPath),
              );
            }
          }
        }
        completed++;
        onProgress?.call(completed, albumsWithoutArtwork.length);
        await Future<void>.delayed(_delayBetweenRequests);
      }
    } finally {
      httpClient.close(force: true);
    }

    return ArtworkScrapeResult(
      albumsWithoutArtwork: albumsWithoutArtwork.length,
      albumsFound: found,
    );
  }

  /// Returns the path the downloaded cover was written to, or null when the
  /// album could not be matched.
  Future<String?> _fetchArtwork({
    required io.HttpClient httpClient,
    required _AlbumKey albumKey,
  }) async {
    try {
      final Uri searchUri = Uri.https(_searchHost, _searchPath, {
        'term': '${albumKey.artist} ${albumKey.album}'.trim(),
        'entity': 'album',
        'limit': '1',
      });
      final String? body = await _readBody(httpClient, searchUri);
      if (body == null) {
        return null;
      }

      final Map<String, dynamic> decoded =
          jsonDecode(body) as Map<String, dynamic>;
      final List<dynamic> results = decoded['results'] as List<dynamic>? ?? [];
      if (results.isEmpty) {
        return null;
      }
      final String? artworkUrl =
          (results.first as Map<String, dynamic>)['artworkUrl100'] as String?;
      if (artworkUrl == null) {
        return null;
      }

      // The search only returns a thumbnail; the same path serves any size.
      final Uri imageUri = Uri.parse(
        artworkUrl.replaceFirst('100x100bb', '600x600bb'),
      );
      final Uint8List? imageBytes = await _readBytes(httpClient, imageUri);
      if (imageBytes == null || imageBytes.isEmpty) {
        return null;
      }

      final String fileName = 'scraped_${albumKey.hashCode.toUnsigned(32)}.jpg';
      final io.File file = io.File('$thumbnailsDirectoryPath/$fileName');
      await file.writeAsBytes(imageBytes);
      return file.path;
    } on Object catch (error) {
      // One unreachable album must not abort the whole run.
      debugPrint('Artwork lookup failed for ${albumKey.album}: $error');
      return null;
    }
  }

  Future<String?> _readBody(io.HttpClient client, Uri uri) async {
    final io.HttpClientResponse response = await _send(client, uri);
    if (response.statusCode != 200) {
      return null;
    }
    return response.transform(utf8.decoder).join();
  }

  Future<Uint8List?> _readBytes(io.HttpClient client, Uri uri) async {
    final io.HttpClientResponse response = await _send(client, uri);
    if (response.statusCode != 200) {
      return null;
    }
    final List<int> bytes = await response.fold<List<int>>(
      <int>[],
      (previous, element) => previous..addAll(element),
    );
    return Uint8List.fromList(bytes);
  }

  Future<io.HttpClientResponse> _send(io.HttpClient client, Uri uri) async {
    final io.HttpClientRequest request = await client
        .getUrl(uri)
        .timeout(_requestTimeout);
    return request.close().timeout(_requestTimeout);
  }
}
