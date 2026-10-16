import 'package:flutter/foundation.dart';

/// Outcome of the playlist name editor.
///
/// [name] is null when the user backed out without naming the playlist, so a
/// cancelled edit can never be mistaken for an empty name.
@immutable
class PlaylistNameResult {
  final String? name;

  const PlaylistNameResult.submitted(String this.name);
  const PlaylistNameResult.cancelled() : name = null;

  bool get isSubmitted => name != null;

  @override
  bool operator ==(Object other) =>
      other is PlaylistNameResult && other.name == name;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() => 'PlaylistNameResult(name: $name)';
}
