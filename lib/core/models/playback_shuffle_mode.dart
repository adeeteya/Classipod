import 'package:audio_service/audio_service.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

enum PlaybackShuffleMode {
  off,
  songs,
  albums;

  PlaybackShuffleMode get next => values[(index + 1) % values.length];

  String title(BuildContext context) => switch (this) {
    off => context.localization.tileValueOff,
    songs => context.localization.songsScreenTitle,
    albums => context.localization.albumsScreenTitle,
  };

  AudioServiceShuffleMode get audioServiceMode => switch (this) {
    off => AudioServiceShuffleMode.none,
    songs => AudioServiceShuffleMode.all,
    albums => AudioServiceShuffleMode.group,
  };

  static PlaybackShuffleMode fromAudioService(AudioServiceShuffleMode mode) =>
      switch (mode) {
        AudioServiceShuffleMode.none => off,
        AudioServiceShuffleMode.all => songs,
        AudioServiceShuffleMode.group => albums,
      };
}
