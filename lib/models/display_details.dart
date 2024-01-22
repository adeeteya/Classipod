class DisplayDetails {
  final double scrollOffset;
  final int selectedDisplayListItem;
  final DisplayScreenType displayScreenType;

  const DisplayDetails(
      {required this.scrollOffset,
      required this.selectedDisplayListItem,
      required this.displayScreenType});

  DisplayDetails copyWith(
      {double? scrollOffset,
      int? selectedDisplayListItem,
      DisplayScreenType? displayScreenType}) {
    return DisplayDetails(
      scrollOffset: scrollOffset ?? this.scrollOffset,
      selectedDisplayListItem:
          selectedDisplayListItem ?? this.selectedDisplayListItem,
      displayScreenType: displayScreenType ?? this.displayScreenType,
    );
  }
}

enum DisplayScreenType {
  menu,
  musicMenu,
  coverFlow,
  artistsSelection,
  artistSongs,
  albums,
  songs,
  settings,
  nowPlaying;

  @override
  String toString() {
    switch (this) {
      case DisplayScreenType.menu:
        return "Menu";
      case DisplayScreenType.musicMenu:
        return "Music";
      case DisplayScreenType.coverFlow:
        return "Cover Flow";
      case DisplayScreenType.artistsSelection:
        return "Artists";
      case DisplayScreenType.artistSongs:
        return "Artist Songs";
      case DisplayScreenType.albums:
        return "Albums";
      case DisplayScreenType.songs:
        return "Songs";
      case DisplayScreenType.settings:
        return "Settings";
      case DisplayScreenType.nowPlaying:
        return "Now Playing";
    }
  }
}
