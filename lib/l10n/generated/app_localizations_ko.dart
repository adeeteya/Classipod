// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => '클래스 포드';

  @override
  String get menuButtonText => '메뉴';

  @override
  String get audioAccessPermissionTitle => '오디오 액세스 권한이 필요합니다';

  @override
  String get audioAccessPermissionContent =>
      '음악 파일을 재생할 수 있도록 오디오 파일 액세스 권한을 부여하십시오.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      '오디오 액세스 권한이 거부되었습니다';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      '장치 설정 에서이 앱에 대한 오디오 파일 액세스 권한을 부여하여 음악 파일을 재생할 수 있습니다.';

  @override
  String get menuScreenTitle => '메뉴';

  @override
  String get musicMenuScreenTitle => '음악';

  @override
  String get nowPlayingScreenTitle => '이제 연주합니다';

  @override
  String get shuffleSongsMenuTitle => '셔플 노래';

  @override
  String get shuffleSettingTitle => '혼합';

  @override
  String get settingsScreenTitle => '설정';

  @override
  String get aboutScreenTitle => '에 대한';

  @override
  String get coverFlowScreenTitle => '덮개 흐름';

  @override
  String get artistsScreenTitle => '아티스트';

  @override
  String get albumsScreenTitle => '앨범';

  @override
  String get songsScreenTitle => '노래';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString 노래',
      one: '1 노래',
      zero: '노래 없음',
    );
    return '$_temp0';
  }

  @override
  String nAlbums(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString 앨범',
      one: '1 앨범',
      zero: '앨범 없음',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => '장르';

  @override
  String get genreSongsScreenTitle => '장르 노래';

  @override
  String get deviceColorSettingTitle => '장치 색상';

  @override
  String get touchScreenSettingTitle => '터치 스크린 활성화';

  @override
  String get repeatModeSettingTitle => '반복하다';

  @override
  String get repeatModeOne => '하나';

  @override
  String get repeatModeAll => '모두';

  @override
  String get vibrateSettingTitle => '떨리다';

  @override
  String get clickWheelSettingTitle => '휠 사운드를 클릭하십시오';

  @override
  String get splitScreenSettingTitle => '화면 모드 분할';

  @override
  String get touchSoundsDialogTitle => '터치 소리';

  @override
  String get touchSoundsDialogContent =>
      '클릭 휠 사운드를 들으려면 시스템 설정에서 터치 사운드를 활성화하십시오.';

  @override
  String get immersiveModeSettingTitle => '몰입 형 모드';

  @override
  String get showAppTutorialSettingTitle => '튜토리얼 표시';

  @override
  String get changeDirectorySettingTitle => '디렉토리를 변경하십시오';

  @override
  String get donateSettingTitle => '기부';

  @override
  String get donateSettingDescription => '이 앱이 마음에 들면 기부를 고려하십시오.';

  @override
  String get versionAboutScreenTitle => '버전';

  @override
  String get madeWithLoveTitle => '❤️으로 만들어졌습니다';

  @override
  String get noMusicFilesFound => '음악이 없습니다';

  @override
  String get noArtistsFound => '예술가가 없습니다';

  @override
  String get noAlbumsFound => '앨범 없음';

  @override
  String get unknownSong => '알 수없는 노래';

  @override
  String get unknownArtist => '알 수없는 아티스트';

  @override
  String get unknownAlbum => '알 수없는 앨범';

  @override
  String get unknownGenre => '알 수없는 장르';

  @override
  String get buttonConfirmText => '좋아요';

  @override
  String get tileValueOn => '~에';

  @override
  String get tileValueOff => '끄다';

  @override
  String get commonOfText => '~의';

  @override
  String get pageNotFoundText => '주어진 페이지는 찾을 수 없었습니다';

  @override
  String get commonErrorText => '오류';

  @override
  String get retryButtonText => '다시 해 보다';

  @override
  String get filePickerDialogTitle => '음악을 스캔 할 디렉토리를 선택하십시오';

  @override
  String get searchScreenTitle => '찾다';

  @override
  String get searchEmptyText => '검색 결과가 없습니다';

  @override
  String get searchResultsText => '검색 결과 :';

  @override
  String get resultsForText => '결과 :';

  @override
  String get disableBatteryOptimizationTitle => '배터리 최적화를 비활성화합니다';

  @override
  String get disableBatteryOptimizationContent =>
      '기기 설정 에서이 앱의 배터리 최적화를 비활성화하여 음악의 배경 재생을 허용하십시오.';

  @override
  String get languageScreenTitle => '언어';

  @override
  String get silverDeviceColor => '은';

  @override
  String get blackDeviceColor => '검은색';

  @override
  String get resetSettingsTitle => '설정을 재설정합니다';

  @override
  String get browseArtist => '아티스트를 찾아보세요';

  @override
  String get browseAlbum => '앨범을 찾아보세요';

  @override
  String get cancelText => '취소';

  @override
  String get playlistsScreenTitle => '재생 목록';

  @override
  String get addToOnTheGoPlaylist => '이동 중에 추가하십시오';

  @override
  String get addAlbumToOnTheGoPlaylist => '이동 중에 앨범을 추가하십시오';

  @override
  String get removeSongFromThePlaylist => '재생 목록에서 제거하십시오';

  @override
  String get allAlbums => '모든 앨범';

  @override
  String get scanningMusicFiles => '음악 파일을 스캔합니다';

  @override
  String get newPlaylist => '새로운 재생 목록';

  @override
  String get savePlaylist => '재생 목록을 저장하십시오';

  @override
  String get clearPlaylist => '클리어 재생 목록';

  @override
  String get rescanMusicFilesSettingTitle => '구조 음악 파일';

  @override
  String get deviceControlMenuTutorialText =>
      '클릭 휠 주위로 엄지 손가락을 가볍게 움직여 메뉴를 탐색하십시오.';

  @override
  String get centerButtonMenuTutorialText => '중앙 버튼을 눌러 강조 표시된 메뉴 항목을 선택하십시오.';

  @override
  String get playPauseMenuTutorialText => '이 버튼을 눌러 노래를 재생하거나 일시 중지하십시오';

  @override
  String get nextButtonMenuTutorialText => '이 버튼을 눌러 다음 노래로 건너 뜁니다';

  @override
  String get previousButtonMenuTutorialText => '이 버튼을 누르면 되감거나 이전 노래로 돌아갑니다.';

  @override
  String get menuButtonTutorialText =>
      '이 버튼을 눌러 이전 메뉴로 돌아갑니다. 다른 화면에서 눌러 누르면 메인 메뉴로 직접 이동할 수 있습니다.';

  @override
  String get deviceScreenMenuTutorialText =>
      '이것은 디스플레이 화면입니다. 터치 스크린 및 분할 스크린 모드는 기본적으로 활성화되며 설정에서 추가로 구성 할 수 있습니다.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      '클릭 휠 주위에 엄지 손가락을 움직여 볼륨을 조정하십시오.';

  @override
  String get centerButtonNowPlayingTutorialText =>
      '중앙 버튼을 눌러 Seek Bar, Scrubber Bar 및 Shuffle 슬라이더를 순환하십시오. 센터 버튼을 누르고 누르고 누르면 추가 옵션에 액세스하십시오.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      '이 버튼을 누르고 고정하여 노래를 빨리 전달하십시오.';

  @override
  String get previousButtonNowPlayingTutorialText => '이 버튼을 눌러 곡을 되 돌리십시오';

  @override
  String get deviceControlSearchTutorialText =>
      '클릭 휠 주위에 엄지 손가락을 가볍게 움직여 알파벳을 강조 표시하십시오.';

  @override
  String get centerButtonSearchTutorialText => '중앙 버튼을 눌러 강조 표시된 알파벳을 선택하십시오';

  @override
  String get nextButtonSearchTutorialText => '이 버튼을 눌러 공간을 추가하십시오';

  @override
  String get previousButtonSearchTutorialText => '이 버튼을 눌러 마지막 문자를 삭제하십시오';

  @override
  String get menuButtonSearchTutorialText =>
      '이 버튼을 누르면 키보드를 닫고 검색 결과와 상호 작용합니다.';
}
