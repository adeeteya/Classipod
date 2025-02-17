// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Iban (`iba`).
class AppLocalizationsIba extends AppLocalizations {
  AppLocalizationsIba([String locale = 'iba']) : super(locale);

  @override
  String get appTitle => 'ClassiPod';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle => 'Pemendar Akses Audio Diguna';

  @override
  String get audioAccessPermissionContent =>
      'Minta nuan meri akses fail audio ngambika kami ulih bemain fail muzik nuan.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Pemendar Akses Audio Ditangguh';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Minta nuan meri akses fail audio ungkup app tu dalam setting perengka ngambika kami ulih bemain fail muzik nuan.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Bunyi';

  @override
  String get nowPlayingScreenTitle => 'Diatu Bemain';

  @override
  String get shuffleSongsMenuTitle => 'Lagu Shuffle';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Settings';

  @override
  String get aboutScreenTitle => 'Pasal';

  @override
  String get coverFlowScreenTitle => 'Aliran Tutup';

  @override
  String get artistsScreenTitle => 'Artis';

  @override
  String get albumsScreenTitle => 'Album';

  @override
  String get songsScreenTitle => 'Lagu';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Lagu',
      one: '1 Lagu',
      zero: 'Nadai Lagu',
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
      other: '$countString Albums',
      one: '1 Album',
      zero: 'Nadai Album',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Genre';

  @override
  String get genreSongsScreenTitle => 'Lagu Genre';

  @override
  String get deviceColorSettingTitle => 'Warna Peranti';

  @override
  String get touchScreenSettingTitle => 'Skrin Sentuhan Dikemendarka';

  @override
  String get repeatModeSettingTitle => 'Ngulang';

  @override
  String get repeatModeOne => 'Satu';

  @override
  String get repeatModeAll => 'Semua';

  @override
  String get vibrateSettingTitle => 'Vibrate';

  @override
  String get clickWheelSettingTitle => 'Klik Roda Bunyi';

  @override
  String get splitScreenSettingTitle => 'Mod Skrin Belah';

  @override
  String get touchSoundsDialogTitle => 'Sentuh Munyi';

  @override
  String get touchSoundsDialogContent =>
      'Minta ampun Ngasuh Sentuh Munyi ari Settings Sistem kena ninga bunyi roda klik .';

  @override
  String get immersiveModeSettingTitle => 'Mod Immersive';

  @override
  String get showAppTutorialSettingTitle => 'Tunjukka Tutorial';

  @override
  String get changeDirectorySettingTitle => 'Ubah Pengarah';

  @override
  String get donateSettingTitle => 'Menderma';

  @override
  String get donateSettingDescription =>
      'Enti kita rindu ke app tu, sila berunding meri pemeri.';

  @override
  String get versionAboutScreenTitle => 'Versi';

  @override
  String get madeWithLoveTitle => 'Digaga enggau ❤️ ulih .';

  @override
  String get noMusicFilesFound => 'Nadai Muzik';

  @override
  String get noArtistsFound => 'Nadai Artis';

  @override
  String get noAlbumsFound => 'Nadai Album';

  @override
  String get unknownSong => 'Lagu ti enda dikelala';

  @override
  String get unknownArtist => 'Artis ti enda dikelala';

  @override
  String get unknownAlbum => 'Album ti enda dikelala';

  @override
  String get unknownGenre => 'Genre ti enda dikelala';

  @override
  String get buttonConfirmText => 'OK';

  @override
  String get tileValueOn => 'Atas';

  @override
  String get tileValueOff => 'Madamka';

  @override
  String get commonOfText => 'ke';

  @override
  String get pageNotFoundText => 'Page ti diberi nya nadai ditemu .';

  @override
  String get commonErrorText => 'Silap';

  @override
  String get retryButtonText => 'Angkat baru';

  @override
  String get filePickerDialogTitle =>
      'Pilih Direktori ngagai Scan ungkup Muzik .';

  @override
  String get searchScreenTitle => 'Ngiga';

  @override
  String get searchEmptyText => 'Nadai Asil Ngiga';

  @override
  String get searchResultsText => 'Asil Ngiga:';

  @override
  String get resultsForText => 'Asil ungkup:';

  @override
  String get disableBatteryOptimizationTitle => 'Padamka Optimasyen Bateri';

  @override
  String get disableBatteryOptimizationContent =>
      'Minta ampun optimasyen bateri ungkup app tu dalam atur perengka ngambika ulih ngasuh latar belakang muzik nyadi latar belakang.';

  @override
  String get languageScreenTitle => 'Bansa jaku';

  @override
  String get silverDeviceColor => 'Pirak';

  @override
  String get blackDeviceColor => 'Chelum';

  @override
  String get resetSettingsTitle => 'Reset Settings';

  @override
  String get browseArtist => 'Senipakka Artis';

  @override
  String get browseAlbum => 'Album Belayar';

  @override
  String get cancelText => 'enda jadi';

  @override
  String get playlistsScreenTitle => 'Rintai main';

  @override
  String get addToOnTheGoPlaylist => 'Tambahka ngagai On-The-Go';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Tambahka Album ngagai On-The-Go';

  @override
  String get removeSongFromThePlaylist => 'Keluarka ari Rintai Main .';

  @override
  String get allAlbums => 'Semua Album';

  @override
  String get scanningMusicFiles => 'Scanning Music Fail';

  @override
  String get newPlaylist => 'Bill Baru';

  @override
  String get savePlaylist => 'Simpan Licha';

  @override
  String get clearPlaylist => 'Rintaika Licha ti terang';

  @override
  String get rescanMusicFilesSettingTitle => 'Fail Muzik Rescan';

  @override
  String get deviceControlMenuTutorialText =>
      'Mindahka jemari nuan enggau ringan ngelingi Roda Klik ngambika ulih ngelayang menu .';

  @override
  String get centerButtonMenuTutorialText =>
      'Tekan butang tengah kena milih item menu ti dikemeratka .';

  @override
  String get playPauseMenuTutorialText =>
      'Tekan butang tu kena bemain tauka ngetu lagu .';

  @override
  String get nextButtonMenuTutorialText =>
      'Tekan butang tu kena skip ngagai lagu ti nangkanka nya .';

  @override
  String get previousButtonMenuTutorialText =>
      'Tekan butang tu kena rewind tauka pulai ngagai lagu ke udah .';

  @override
  String get menuButtonTutorialText =>
      'Tekan butang tu ngambika pulai ngagai menu ke dulu ari tu. Nuan ulih nekan lalu megai iya ari sebarang skrin bukai ngambika terus mansang ngagai menu utama.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Tu meh skrin pemandang. Skrin Sentuh enggau Mod Skrin Skrin dikena enggau chara default lalu ulih dikonfigurasyenka agi dalam atur.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Mindahka jemari nuan ngelingi Roda Klik ngambika ulih ngatur volume .';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Tekan butang Pusat kena ngena basikal nengah bar ngiga, bar scrubber enggau slider shuffle. Tekan lalu pegai butang Pusat ngambika ulih ngulihka pilih tambah.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Tekan lalu pegai butang tu ngambika jampat ke mua lagu .';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Tekan lalu pegai butang tu kena rewind lagu .';

  @override
  String get deviceControlSearchTutorialText =>
      'Mindahka jemari nuan enggau ringan ngelingi Wheel Klik ngambika ulih ngayanka urup .';

  @override
  String get centerButtonSearchTutorialText =>
      'Tekan butang tengah kena milih urup ti dikemeratka .';

  @override
  String get nextButtonSearchTutorialText =>
      'Tekan butang tu kena nambahka ruang .';

  @override
  String get previousButtonSearchTutorialText =>
      'Tekan butang tu kena madamka watak kepenudi .';

  @override
  String get menuButtonSearchTutorialText =>
      'Tekan butang tu kena nutup keyboard lalu beinteraksyen enggau asil ngiga .';
}
