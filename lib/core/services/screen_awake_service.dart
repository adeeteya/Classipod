import 'dart:async';

import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/features/settings/controller/settings_preferences_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

final screenAwakeServiceProvider = Provider<void>((ref) {
  final player = ref.read(audioPlayerProvider);

  var enabled = ref
      .read(settingsPreferencesControllerProvider)
      .keepScreenAwakeWhilePlaying;

  Future<void> updateScreenAwake(PlayerState playerState) async {
    if (kIsWeb || defaultTargetPlatform != TargetPlatform.android) {
      return;
    }

    final shouldStayAwake =
        enabled &&
        playerState.playing &&
        playerState.processingState != ProcessingState.completed;

    await WakelockPlus.toggle(enable: shouldStayAwake);
  }

  final subscription = player.playerStateStream.listen((playerState) {
    unawaited(updateScreenAwake(playerState));
  });

  ref.listen(settingsPreferencesControllerProvider, (previous, next) {
    enabled = next.keepScreenAwakeWhilePlaying;
    unawaited(
      updateScreenAwake(PlayerState(player.playing, player.processingState)),
    );
  });

  ref.onDispose(() {
    unawaited(subscription.cancel());
    unawaited(WakelockPlus.disable());
  });

  unawaited(
    updateScreenAwake(PlayerState(player.playing, player.processingState)),
  );
});
