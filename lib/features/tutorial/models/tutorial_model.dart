class TutorialModel {
  final bool isMenuFirstTime;
  final bool isNowPlayingFirstTime;
  final bool isInputTextBarFirstTime;

  TutorialModel({
    required this.isMenuFirstTime,
    required this.isNowPlayingFirstTime,
    required this.isInputTextBarFirstTime,
  });

  TutorialModel copyWith({
    bool? isMenuFirstTime,
    bool? isNowPlayingFirstTime,
    bool? isInputTextBarFirstTime,
  }) {
    return TutorialModel(
      isMenuFirstTime: isMenuFirstTime ?? this.isMenuFirstTime,
      isNowPlayingFirstTime:
          isNowPlayingFirstTime ?? this.isNowPlayingFirstTime,
      isInputTextBarFirstTime:
          isInputTextBarFirstTime ?? this.isInputTextBarFirstTime,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TutorialModel &&
        other.isMenuFirstTime == isMenuFirstTime &&
        other.isNowPlayingFirstTime == isNowPlayingFirstTime &&
        other.isInputTextBarFirstTime == isInputTextBarFirstTime;
  }

  @override
  int get hashCode => Object.hash(
    isMenuFirstTime,
    isNowPlayingFirstTime,
    isInputTextBarFirstTime,
  );

  @override
  String toString() {
    return 'TutorialModel(isMenuFirstTime: $isMenuFirstTime, isNowPlayingFirstTime: $isNowPlayingFirstTime, isInputTextBarFirstTime: $isInputTextBarFirstTime)';
  }
}
