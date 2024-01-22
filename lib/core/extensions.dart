import 'package:flutter/cupertino.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';

extension DarkMode on BuildContext {
  bool get isDarkMode {
    return CupertinoTheme.of(this).brightness == Brightness.dark;
  }
}

extension MusicMetadataHelper on Metadata {
  String get getTrackArtistNames {
    return trackArtistNames?.toString().substring(
              1,
              trackArtistNames.toString().length - 1,
            ) ??
        "Unknown Artist";
  }
}
