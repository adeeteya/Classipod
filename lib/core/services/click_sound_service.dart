import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

final clickSoundServiceProvider = Provider<ClickSoundService>((ref) {
  final service = ClickSoundService(
    AudioPlayer(
      handleAudioSessionActivation: false,
      handleInterruptions: false,
      androidApplyAudioAttributes: false,
    ),
  );
  ref.onDispose(() => unawaited(service.dispose()));
  return service;
});

class ClickSoundService {
  ClickSoundService(this._player);

  static const asset = 'assets/sounds/ipod_click.wav';
  final AudioPlayer _player;
  Future<void>? _loading;
  bool _ready = false;
  bool _seeking = false;
  bool _disposed = false;

  Future<void> preload() {
    if (_disposed || _ready) return Future.value();
    return _loading ??= _load();
  }

  Future<void> _load() async {
    try {
      await _player.setAsset(asset);
      if (!_disposed) _ready = true;
    } catch (error) {
      _report(error);
    } finally {
      _loading = null;
    }
  }

  void click() {
    if (_disposed || _seeking) return;
    if (!_ready) {
      unawaited(preload());
      return;
    }
    _seeking = true;
    unawaited(_restart());
  }

  Future<void> _restart() async {
    try {
      await _player.seek(Duration.zero);
      if (_disposed) return;
      unawaited(_player.play().catchError(_report));
    } catch (error) {
      _report(error);
    } finally {
      _seeking = false;
    }
  }

  void _report(Object error) {
    if (!_disposed) debugPrint('Click sound unavailable: $error');
  }

  Future<void> dispose() async {
    if (_disposed) return;
    _disposed = true;
    await _player.dispose();
  }
}
