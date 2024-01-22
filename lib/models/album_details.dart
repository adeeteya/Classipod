import 'dart:typed_data';

class AlbumDetails {
  final String albumName;
  final Uint8List? albumArt;
  final String albumArtistName;

  AlbumDetails(
      {required this.albumName,
      required this.albumArt,
      required this.albumArtistName});
}
