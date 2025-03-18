// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hakha Chin Haka Chin (`cnh`).
class AppLocalizationsCnh extends AppLocalizations {
  AppLocalizationsCnh([String locale = 'cnh']) : super(locale);

  @override
  String get appTitle => 'ClassiPod';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle => 'Audio luh khawhnak nawl pek a hau';

  @override
  String get audioAccessPermissionContent =>
      'Na music file pawl kan tum khawhnak ding caah audio file pawl kha kan nawlpiak hna.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Audio luh khawhnak nawl a pekmi hna cu';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Na music file pawl kan tum khawhnak ding caah device settings ah hi app caah audio files luh khawhnak nawl pe.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Ringawn';

  @override
  String get nowPlayingScreenTitle => 'Atu cu';

  @override
  String get shuffleSongsMenuTitle => 'Hla Shoffle Songs';

  @override
  String get shuffleSettingTitle => 'Shiffle';

  @override
  String get settingsScreenTitle => 'setting';

  @override
  String get aboutScreenTitle => 'Deng';

  @override
  String get coverFlowScreenTitle => 'Khuh';

  @override
  String get artistsScreenTitle => 'Zuk suaitu';

  @override
  String get albumsScreenTitle => 'Albums';

  @override
  String get songsScreenTitle => 'Song';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Hla',
      one: '1 Hla',
      zero: 'Hla um lo',
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
      other: '$countString Album',
      one: '1 Album',
      zero: 'Album a um lo',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Genres';

  @override
  String get genreSongsScreenTitle => 'Genre hla';

  @override
  String get deviceColorSettingTitle => 'Device rong';

  @override
  String get touchScreenSettingTitle => 'Touch Screen';

  @override
  String get repeatModeSettingTitle => 'Khirhthan';

  @override
  String get repeatModeOne => 'Pakhat';

  @override
  String get repeatModeAll => 'Zapi';

  @override
  String get vibrateSettingTitle => 'Tlawn';

  @override
  String get clickWheelSettingTitle => 'Wheel aw kha hmet .';

  @override
  String get splitScreenSettingTitle => 'Split Screen Mode';

  @override
  String get touchSoundsDialogTitle => 'Touch Aw';

  @override
  String get touchSoundsDialogContent =>
      'Zaangfahnak tein System Settings in a chuakmi aw hna kha click wheel aw theih khawhnak ding caah 10';

  @override
  String get immersiveModeSettingTitle => 'Immersive Mode';

  @override
  String get showAppTutorialSettingTitle => 'Cawnnak kha hmuhsak';

  @override
  String get changeDirectorySettingTitle => 'Thlennak Directory';

  @override
  String get donateSettingTitle => 'Hlut';

  @override
  String get donateSettingDescription =>
      'Hi app na duh ahcun, bawmhnak pek ding in ruat.';

  @override
  String get versionAboutScreenTitle => 'Version';

  @override
  String get madeWithLoveTitle => '❤️ he sermi a si.';

  @override
  String get noMusicFilesFound => 'Music';

  @override
  String get noArtistsFound => 'Artist pakhat hmanh';

  @override
  String get noAlbumsFound => 'Albums a um lo';

  @override
  String get unknownSong => 'Hlasakthiam lomi hla';

  @override
  String get unknownArtist => 'Hngalh lomi Zukcawl';

  @override
  String get unknownAlbum => 'Hngalh lomi Album';

  @override
  String get unknownGenre => 'Hngalh lomi Genre';

  @override
  String get buttonConfirmText => 'OK';

  @override
  String get tileValueOn => 'Cung ah';

  @override
  String get tileValueOff => 'I dinh';

  @override
  String get commonOfText => 'i';

  @override
  String get pageNotFoundText => 'Pekmi cahmai cu an hmu lo .';

  @override
  String get commonErrorText => 'Palhnak';

  @override
  String get retryButtonText => 'I zuam than';

  @override
  String get filePickerDialogTitle =>
      'Music caah Scan tuahnak ding caah Directory pakhat thim';

  @override
  String get searchScreenTitle => 'Kawl';

  @override
  String get searchEmptyText => 'Search Result A um lo';

  @override
  String get searchResultsText => 'Kawlnak a phichuak:';

  @override
  String get resultsForText => 'A phichuak cu:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Pum tlamtlinglo Battery Thatnak';

  @override
  String get disableBatteryOptimizationContent =>
      'Zaangfahnak tein, hi app caah hin, music hnulei ah kir than khawhnak ding caah, hi app caah hin, battery ttha tein hman khawhnak ding caah, phihkharnak tuah.';

  @override
  String get languageScreenTitle => 'Holh';

  @override
  String get silverDeviceColor => 'Ngun';

  @override
  String get blackDeviceColor => 'A nak';

  @override
  String get resetSettingsTitle => 'Reset tuahnak';

  @override
  String get browseArtist => 'Browse Artist';

  @override
  String get browseAlbum => 'Album zoh';

  @override
  String get cancelText => 'Letthan';

  @override
  String get playlistsScreenTitle => 'Playlist pawl';

  @override
  String get addToOnTheGoPlaylist => 'On-The-Go ah chap.';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Album cu On-The-Go ah chap.';

  @override
  String get removeSongFromThePlaylist => 'Playlist chungin chuah .';

  @override
  String get allAlbums => 'Album vialte';

  @override
  String get scanningMusicFiles => 'Scanning Music Files';

  @override
  String get newPlaylist => 'Playlist Thar';

  @override
  String get savePlaylist => 'Playlist ah chiah';

  @override
  String get clearPlaylist => 'Playlist thiang';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan hlasaknak file';

  @override
  String get deviceControlMenuTutorialText =>
      'Na kutdong kha click Wheel pawngkam ah tlawmpal in ṭhial law menu kha na kal khawh lai .';

  @override
  String get centerButtonMenuTutorialText =>
      'A biapi tukmi menu item kha thim awkah center button kha hmet.';

  @override
  String get playPauseMenuTutorialText =>
      'Hla pakhat chuah khawhnak ding caah hi button hi hmet .';

  @override
  String get nextButtonMenuTutorialText => 'Hi button hi hmet law a hnu hla .';

  @override
  String get previousButtonMenuTutorialText =>
      'Hi button hi hmet law rewind tuah asiloah a hlan hla ah kir than .';

  @override
  String get menuButtonTutorialText =>
      'A hlan menu ah kir than ding in hi button hi hmet. A dang screen paohpaoh in na hmeh khawh i na tlaih khawh i, main menu ah direct in kal khawh a si.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Mah cu langhternak screen a si. Touch Screen le Split Screen Mode cu default in an tuah khawh i, settings ah cun a dang tein configure khawh a si.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Na kutdong kha Click Wheel pawngkam ah ṭhial law volume kha remh khawh a si .';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Center button kha hmet law, kawl khawhnak bar, scrubber bar le sliffle slider hmangin cycle mawngh khawhnak ding caah hmet. A dang thimnak hmuh khawhnak ding caah Center button kha hmet law tlaih.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Hla kha fast forward tuah khawhnak ding caah hi button hi hmet law tlaih peng .';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Hla kha rewind tuah awkah hi button hi hmet law tlaih .';

  @override
  String get deviceControlSearchTutorialText =>
      'Na kutdong kha Click Wheel pawngkam ah tlawmpal in ṭhial law alphabet pakhat kha langhter .';

  @override
  String get centerButtonSearchTutorialText =>
      'A biapi bikmi alphabet kha thim awkah center button kha hmet.';

  @override
  String get nextButtonSearchTutorialText =>
      'Hi button hi hmet law space pakhat na chap lai .';

  @override
  String get previousButtonSearchTutorialText =>
      'Hi button hi hmet law a donghnak bik cafang kha delete tuah .';

  @override
  String get menuButtonSearchTutorialText =>
      'Hi button hi hmet law keyboard kha khar law kawlnak a phichuak he pehtlaihnak tuah.';

  @override
  String get allSongs => 'Hla vialte';
}
