import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';
import 'dart:isolate';

import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';
import 'package:flutter_taglib/flutter_taglib.dart';

class MetadataWorker {
  final Isolate _isolate;
  final SendPort _requests;

  MetadataWorker._(this._isolate, this._requests);

  static void _log(String message) {
    developer.log(message, name: 'Classipod.rating');
  }

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

  Future<void> writeRating(String uri, int rating) async {
    final response = ReceivePort();
    try {
      _log('request uri=$uri rating=$rating');
      _requests.send((response.sendPort, uri, rating));
      final result = Map<String, dynamic>.from(
        await response.first.timeout(const Duration(seconds: 60)) as Map,
      );
      final error = result['error'] as String?;
      if (error != null) {
        _log('failed uri=$uri error=$error');
        throw StateError(error);
      }
      if (result['saved'] != true) {
        _log('save returned false uri=$uri');
        throw StateError('Failed to save rating metadata');
      }
      _log('save completed uri=$uri');
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
      final (reply, uri, argument) = message as (SendPort, String, Object?);
      TagLibFile? file;
      try {
        final path = uri.startsWith('file:')
            ? Uri.parse(uri).toFilePath()
            : uri;
        file = await TagLibFile.openAsync(path, writeAccess: argument is int);
        if (file == null) throw StateError('Cannot read tags');
        if (argument is int) {
          MetadataWorker._log(
            'opened path=$path '
            'format=${file.format} existingRATING=${file.properties['RATING']}',
          );
          final existingProperties = file.properties;
          if (existingProperties.isEmpty ||
              (existingProperties.length == 1 &&
                  existingProperties.containsKey('RATING'))) {
            throw StateError(
              'Refusing to save rating because existing metadata was '
              'not read safely',
            );
          }
          final updatedProperties = {
            ...existingProperties,
            'RATING': [argument.toString()],
          };
          final unsupported = file.setProperties(updatedProperties);
          if (unsupported.containsKey('RATING')) {
            MetadataWorker._log(
              'RATING unsupported path=$path '
              'unsupported=$unsupported',
            );
            throw StateError('Audio format does not support RATING metadata');
          }
          MetadataWorker._log(
            'RATING set path=$path '
            'properties=${file.properties['RATING']}',
          );
          final saved = file.save();
          MetadataWorker._log(
            'save result=$saved path=$path '
            'propertiesAfterSave=${file.properties['RATING']}',
          );
          file.close();
          file = null;

          final reopened = await TagLibFile.openAsync(path);
          final persistedRating = reopened?.properties['RATING'];
          final persistedValues = persistedRating is List
              ? List<dynamic>.from(persistedRating!)
              : const <dynamic>[];
          final persisted = persistedValues.any(
            (value) => value.toString() == argument.toString(),
          );
          MetadataWorker._log(
            'reopen verification path=$path '
            'persistedRating=$persistedRating persisted=$persisted',
          );
          reopened?.close();
          reply.send({'saved': saved && persisted});
          continue;
        }
        final directory = argument as String?;
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
