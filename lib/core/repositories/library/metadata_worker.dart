import 'dart:async';
import 'dart:io';
import 'dart:isolate';

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
        final path = uri.startsWith('file:')
            ? Uri.parse(uri).toFilePath()
            : uri;
        file = await TagLibFile.openAsync(path);
        if (file == null) throw StateError('Cannot read tags');
        final result = <String, dynamic>{
          'properties': file.properties,
          'duration': file.duration.inMilliseconds,
          'bitrate': file.bitrate,
          'hasCover': file.hasCover,
        };
        if (directory != null && result['hasCover'] == true) {
          try {
            final bytes = file.coverData;
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
            result['artworkPath'] = target.path;
          } catch (error) {
            result['artworkError'] = error.toString();
          }
        }
        reply.send(result);
      } catch (error) {
        reply.send({'error': error.toString()});
      } finally {
        file?.close();
      }
    }
  }
}
