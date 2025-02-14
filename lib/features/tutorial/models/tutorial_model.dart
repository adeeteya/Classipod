class TutorialModel {
  final bool isMenuFirstTime;
  final bool isNowPlayingFirstTime;
  final bool isSearchFirstTime;

  TutorialModel({
    required this.isMenuFirstTime,
    required this.isNowPlayingFirstTime,
    required this.isSearchFirstTime,
  });

  TutorialModel copyWith({
    bool? isMenuFirstTime,
    bool? isNowPlayingFirstTime,
    bool? isSearchFirstTime,
  }) {
    return TutorialModel(
      isMenuFirstTime: isMenuFirstTime ?? this.isMenuFirstTime,
      isNowPlayingFirstTime:
          isNowPlayingFirstTime ?? this.isNowPlayingFirstTime,
      isSearchFirstTime: isSearchFirstTime ?? this.isSearchFirstTime,
    );
  }
}
