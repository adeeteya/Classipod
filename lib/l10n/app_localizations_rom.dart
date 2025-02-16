// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romany (`rom`).
class AppLocalizationsRom extends AppLocalizations {
  AppLocalizationsRom([String locale = 'rom']) : super(locale);

  @override
  String get appTitle => 'KlasìiPod';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle => 'Audio Akseso Permisia Mangen';

  @override
  String get audioAccessPermissionContent => 'Te mangena te den audio-files akceso te shaj te khelen tumare muzikake fileura.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Audio Acceso Permisia Deni.';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Te mangena te den audio-files akceso vash akava app ano aparatya vash o aparatya vash te shay te khelen tumare muzikake fileya.';

  @override
  String get menuScreenTitle => 'menùni';

  @override
  String get musicMenuScreenTitle => 'Mùzika';

  @override
  String get nowPlayingScreenTitle => 'Akana Khel';

  @override
  String get shuffleSongsMenuTitle => 'Shuv';

  @override
  String get shuffleSettingTitle => 'Shuv';

  @override
  String get settingsScreenTitle => 'Sebèdia';

  @override
  String get aboutScreenTitle => 'Palal';

  @override
  String get coverFlowScreenTitle => 'Kaver';

  @override
  String get artistsScreenTitle => 'E artistura';

  @override
  String get albumsScreenTitle => 'Le Aliguri';

  @override
  String get songsScreenTitle => 'Gila';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Gilja',
      one: '1 Gili',
      zero: 'Naj gilja',
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
      other: '$countString Albumura',
      one: '1 Albumo',
      zero: 'Naj albumura',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Genrura';

  @override
  String get genreSongsScreenTitle => 'Genre gilja';

  @override
  String get deviceColorSettingTitle => 'Kolor';

  @override
  String get touchScreenSettingTitle => 'O Cex Creen Aktivat';

  @override
  String get repeatModeSettingTitle => 'Palemphenel';

  @override
  String get repeatModeOne => 'Jekh';

  @override
  String get repeatModeAll => 'Savorre';

  @override
  String get vibrateSettingTitle => 'Vibril';

  @override
  String get clickWheelSettingTitle => 'Klikni Śunde aśunde';

  @override
  String get splitScreenSettingTitle => 'Modo e Splitako Screen';

  @override
  String get touchSoundsDialogTitle => 'Teśunen';

  @override
  String get touchSoundsDialogContent => 'Te rughiv tut Aktiv Touch Òunes katar o Sistemoske Parametri te aśunes o kliko e klikosqo aśunel pes';

  @override
  String get immersiveModeSettingTitle => 'O Modo immerìvo';

  @override
  String get showAppTutorialSettingTitle => 'Sikavel Tutoriàlo';

  @override
  String get changeDirectorySettingTitle => 'Direktori e paruvipnaski e paruvipnaski';

  @override
  String get donateSettingTitle => 'Del';

  @override
  String get donateSettingDescription => 'Te kames kadi app, mangav tut te gindis te des.';

  @override
  String get versionAboutScreenTitle => 'Vèrsia';

  @override
  String get madeWithLoveTitle => 'Keren pe ❤️ pe .';

  @override
  String get noMusicFilesFound => 'Ni jekh Muzika';

  @override
  String get noArtistsFound => 'Ni jekh Artisto';

  @override
  String get noAlbumsFound => 'Ni jekh Albumo';

  @override
  String get unknownSong => 'E bipinʒardi gilă';

  @override
  String get unknownArtist => 'O bipinʒardo Artisto';

  @override
  String get unknownAlbum => 'O Albumo bipindžardo';

  @override
  String get unknownGenre => 'Na-i prinзardo Gener';

  @override
  String get buttonConfirmText => 'ŚUKAR';

  @override
  String get tileValueOn => 'Pa';

  @override
  String get tileValueOff => 'Mesto';

  @override
  String get commonOfText => 'NA';

  @override
  String get pageNotFoundText => 'I dini rig na sas arakhli .';

  @override
  String get commonErrorText => 'Doś';

  @override
  String get retryButtonText => 'Rezènto';

  @override
  String get filePickerDialogTitle => 'Selektirinen jekh Direktori .';

  @override
  String get searchScreenTitle => 'Rodel';

  @override
  String get searchEmptyText => 'Ni jekh Rodipe pala Rodipe';

  @override
  String get searchResultsText => 'Rezultatura pala rodipe:';

  @override
  String get resultsForText => 'Rezultatura pala:';

  @override
  String get disableBatteryOptimizationTitle => 'Optimizacia e baterienqi dezactivacia';

  @override
  String get disableBatteryOptimizationContent => 'Te manges te des avri optimizacia pe bateria pe kadi app ande apparatoske settingura te shaj avel tut bakgrundsback pe muzika.';

  @override
  String get languageScreenTitle => 'Ćhib';

  @override
  String get silverDeviceColor => 'Rup';

  @override
  String get blackDeviceColor => 'Kalo';

  @override
  String get resetSettingsTitle => 'Reset Parametri';

  @override
  String get browseArtist => 'Te kerel pes Artisto';

  @override
  String get browseAlbum => 'Te kerel pes o Almïz Album';

  @override
  String get cancelText => 'Anulisarel';

  @override
  String get playlistsScreenTitle => 'E khelutne';

  @override
  String get addToOnTheGoPlaylist => 'Adăugați la-Ti-Go';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Adăugați Album pe-o-Go';

  @override
  String get removeSongFromThePlaylist => 'Te lel pes katar o Playlista';

  @override
  String get allAlbums => 'Sa le Albumi';

  @override
  String get scanningMusicFiles => 'Muzikake lila';

  @override
  String get newPlaylist => 'Nevo Playlista';

  @override
  String get savePlaylist => 'Save Kellista';

  @override
  String get clearPlaylist => 'Klaža';

  @override
  String get rescanMusicFilesSettingTitle => 'Reskakoske Muzikake lila';

  @override
  String get deviceControlMenuTutorialText => 'Te ćhives o vast śukar krujal o Klik Śav';

  @override
  String get centerButtonMenuTutorialText => 'Presinen o butikoni e centrosko vash te alosaren o artiklo e menuesko kova si vasno .';

  @override
  String get playPauseMenuTutorialText => 'Press kado butyi te kheles vaj te pauzas jekh gilyi .';

  @override
  String get nextButtonMenuTutorialText => 'Press kado buti te skipis pe kaver gilji .';

  @override
  String get previousButtonMenuTutorialText => 'Press kado buti te shaj rewind vaj te zhas palpale ande angluni gili .';

  @override
  String get menuButtonTutorialText => 'Press kado buti te zhas palpale ando angluno menu. Tu śaj te ćhives thaj te astares les katar savi aver ekran te džas direktno k-o maj baro menu.';

  @override
  String get deviceScreenMenuTutorialText => 'Kado si o ekran. Touch Screen thaj Split Screen Mode si aktivirime po default thaj shaj te aven konfigurime maj dur ande settingura.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Te ćhives o vast krujal o Klik .';

  @override
  String get centerButtonNowPlayingTutorialText => 'Presinen o butikoni e Centrosko vash te phiren kotar o rode bar, scrubber bar thaj shuflo glider. Presa thaj te inkren o Center buti te shaj resen maj but opciji.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Press thaj inkren kado button te maj sigo angle si e gili .';

  @override
  String get previousButtonNowPlayingTutorialText => 'Press thaj ingrel kado button te shaj rewind-in e gili .';

  @override
  String get deviceControlSearchTutorialText => 'Move o vast light-l-o krujal o Click Wheel te sikavel jekh alfabeto .';

  @override
  String get centerButtonSearchTutorialText => 'Presinen o butikoni centresko vash te alosaren o alfabeti e vastune .';

  @override
  String get nextButtonSearchTutorialText => 'Presinen akava buti vash te qhiven yek than .';

  @override
  String get previousButtonSearchTutorialText => 'Presinen akava buti te čhiven o paluno personažo .';

  @override
  String get menuButtonSearchTutorialText => 'Presinen akava buti te phanen o klaviatura thay te keren interakcia e rodipaskere rezultatencar .';
}
