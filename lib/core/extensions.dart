import 'package:audio_metadata_reader/audio_metadata_reader.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

extension BuildContextExtensions on BuildContext {
  bool get isDarkMode {
    return CupertinoTheme.of(this).brightness == Brightness.dark;
  }

  Size get screenSize {
    return MediaQuery.sizeOf(this);
  }

  GoRouter get router {
    return GoRouter.of(this);
  }
}

extension DateTimeStringHelpers on DateTime {
  String get getTimeOfTheDayString {
    late final bool isPostMeridiem;
    late final String hour;
    late final String minute;
    if (this.hour >= 12 && this.hour <= 24) {
      hour = "${this.hour - 12}";
      isPostMeridiem = true;
    } else {
      hour = "${this.hour}";
      isPostMeridiem = false;
    }
    if (this.minute < 10) {
      minute = '0${this.minute}';
    } else {
      minute = '${this.minute}';
    }
    return "$hour:$minute ${isPostMeridiem ? 'PM' : 'AM'}";
  }
}

extension DurationStringHelpers on Duration {
  String get getMinuteAndSecondString {
    final int seconds = inSeconds - (inMinutes * 60);
    return "$inMinutes:${seconds < 10 ? '0$seconds' : '$seconds'}";
  }
}

extension StringHelpers on Enum {
  String get title {
    final words = name.split(RegExp(r'(?=[A-Z])'));
    return words
        .map(
          (word) =>
              word.substring(0, 1).toUpperCase() +
              word.substring(1).toLowerCase(),
        )
        .join(' ');
  }
}

extension GoRouterExtension on GoRouter {
  String get location {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    final String location = matchList.uri.toString();
    return location;
  }

  String get locationNamed {
    return location.split("/").last.split("?").first;
  }
}

extension MetadataStringHelpers on AudioMetadata {
  String get getMainArtistName {
    String delimiter = ', ';
    if (artist?.contains(', ') ?? false) {
      delimiter = ', ';
    } else if (artist?.contains('/') ?? false) {
      delimiter = '/';
    }
    return artist?.split(delimiter).first ?? "Unknown Artist";
  }
}
