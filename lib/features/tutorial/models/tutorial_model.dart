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

  @override
  bool operator ==(Object other) {
    return other is TutorialModel &&
        other.isMenuFirstTime == isMenuFirstTime &&
        other.isNowPlayingFirstTime == isNowPlayingFirstTime &&
        other.isSearchFirstTime == isSearchFirstTime;
  }

  @override
  int get hashCode =>
      Object.hash(isMenuFirstTime, isNowPlayingFirstTime, isSearchFirstTime);

  @override
  String toString() {
    return 'TutorialModel(isMenuFirstTime: $isMenuFirstTime, isNowPlayingFirstTime: $isNowPlayingFirstTime, isSearchFirstTime: $isSearchFirstTime)';
  }
}
