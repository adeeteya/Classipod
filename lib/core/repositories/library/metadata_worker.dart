import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:classipod/core/repositories/library/file_metadata_reader.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';
import 'package:flutter_taglib/flutter_taglib.dart';

class MetadataWorker {
  final Isolate _isolate;
  final SendPort _requests;

  MetadataWorker._(this._isolate, this._requests);

  static Future<MetadataWorker> start() async {
    final ready = ReceivePort();
    final isolate = await Isolate.spawn(_run, (
      ready.sendPort,
      RootIsolateToken.instance,
    ));
    try {
      final requests = await ready.first.timeout(const Duration(seconds: 30));
      return MetadataWorker._(isolate, requests as SendPort);
    } catch (_) {
      isolate.kill(priority: Isolate.immediate);
      rethrow;
    } finally {
      ready.close();
    }
  }

  Future<Map<String, dynamic>> read(
    String uri, {
    String? artworkDirectory,
  }) async {
    final response = ReceivePort();
    try {
      _requests.send((response.sendPort, uri, artworkDirectory));
      return Map<String, dynamic>.from(
        await response.first.timeout(const Duration(seconds: 60)) as Map,
      );
    } finally {
      response.close();
    }
  }

  Future<void> close() async {
    final stopped = ReceivePort();
    try {
      _requests.send(stopped.sendPort);
      await stopped.first.timeout(const Duration(seconds: 5));
    } finally {
      stopped.close();
      _isolate.kill(priority: Isolate.immediate);
    }
  }

  static Future<void> _run((SendPort, RootIsolateToken?) init) async {
    if (Platform.isAndroid) {
      BackgroundIsolateBinaryMessenger.ensureInitialized(init.$2!);
    }
    final requests = ReceivePort();
    init.$1.send(requests.sendPort);
    await for (final dynamic message in requests) {
      if (message is SendPort) {
        requests.close();
        message.send(null);
        return;
      }
      final (reply, uri, directory) = message as (SendPort, String, String?);
      TagLibFile? file;
      try {
        List<int>? bytes;
        if (Platform.isAndroid) {
          file = await TagLibFile.openAsync(uri);
          if (file == null) throw StateError('Cannot read tags');
          if (directory == null) {
            reply.send({
              'properties': file.properties,
              'duration': file.duration.inMilliseconds,
              'bitrate': file.bitrate,
              'hasCover': file.hasCover,
            });
          } else {
            bytes = file.coverData;
          }
        } else {
          final metadata = const FileMetadataReader().readAudioMetadata(uri);
          if (directory == null) {
            reply.send({
              'properties': {
                if (metadata.title != null) 'TITLE': [metadata.title],
                if (metadata.artist != null) 'ARTIST': [metadata.artist],
                if (metadata.album != null) 'ALBUM': [metadata.album],
                if (metadata.albumArtist != null)
                  'ALBUMARTIST': [metadata.albumArtist],
                if (metadata.year != null)
                  'DATE': [metadata.year!.year.toString()],
                if (metadata.trackNumber != null)
                  'TRACKNUMBER': [metadata.trackNumber.toString()],
                if (metadata.trackTotal != null)
                  'TRACKTOTAL': [metadata.trackTotal.toString()],
                if (metadata.discNumber != null)
                  'DISCNUMBER': [metadata.discNumber.toString()],
                'GENRE': metadata.genres,
                if (metadata.lyrics != null) 'LYRICS': [metadata.lyrics],
              },
              'duration': metadata.duration?.inMilliseconds,
              'bitrate': metadata.bitrate,
              'hasCover': metadata.pictures.isNotEmpty,
            });
          } else {
            bytes = metadata.pictures.firstOrNull?.bytes;
          }
        }
        if (directory != null) {
          if (bytes == null || bytes.isEmpty) {
            throw StateError('Embedded artwork is unreadable');
          }
          final target = File('$directory/${sha256.convert(bytes)}');
          await target.parent.create(recursive: true);
          if (!await target.exists() || await target.length() == 0) {
            final temporary = File('${target.path}.tmp');
            await temporary.writeAsBytes(bytes, flush: true);
            await temporary.rename(target.path);
          }
          reply.send({'artworkPath': target.path});
        }
      } catch (error) {
        reply.send({'error': error.toString()});
      } finally {
        file?.close();
      }
    }
  }
}
