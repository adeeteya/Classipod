/// Actions offered when adding songs to a playlist from any library screen.
enum AddToPlaylistAction {
  /// Create a new playlist holding the selected songs.
  newPlaylist,

  /// Save the selection to the on-the-go playlist.
  onTheGo,

  /// Abort the flow without touching any playlist.
  cancel,
}
