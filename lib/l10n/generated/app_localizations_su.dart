// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Sundanese (`su`).
class AppLocalizationsSu extends AppLocalizations {
  AppLocalizationsSu([String locale = 'su']) : super(locale);

  @override
  String get appTitle => 'Klasipod';

  @override
  String get menuButtonText => 'Menu';

  @override
  String get audioAccessPermissionTitle => 'Ijin aksés audio dibutuhkeun';

  @override
  String get audioAccessPermissionContent =>
      'Punten masihan file audio aksés pikeun ngantep kami pikeun maén file musik anjeun.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Ijin aksés audio ditolak';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Punten masihan aksés file audio kanggo aplikasi ieu dina set alat pikeun ngamungkinkeun urang maénkeun file musik anjeun.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Musik';

  @override
  String get nowPlayingScreenTitle => 'Ayeuna maén';

  @override
  String get shuffleSongsMenuTitle => 'Lagu shuffle';

  @override
  String get shuffleSettingTitle => 'Macut';

  @override
  String get settingsScreenTitle => 'Setelan';

  @override
  String get aboutScreenTitle => 'Kira-kira';

  @override
  String get coverFlowScreenTitle => 'Eun cai';

  @override
  String get artistsScreenTitle => 'Artis';

  @override
  String get albumsScreenTitle => 'Albeum';

  @override
  String get songsScreenTitle => 'Lace';

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
      zero: 'Taya Lagu',
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
      other: '$countString albeum',
      one: '1 albeum',
      zero: 'Taya Albeum',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Genres';

  @override
  String get genreSongsScreenTitle => 'Lagu genre';

  @override
  String get deviceColorSettingTitle => 'Warna alat';

  @override
  String get touchScreenSettingTitle => 'Potret layar';

  @override
  String get repeatModeSettingTitle => 'Malikan deui';

  @override
  String get repeatModeOne => 'Hiji';

  @override
  String get repeatModeAll => 'Sadaya';

  @override
  String get vibrateSettingTitle => 'Ngageter';

  @override
  String get clickWheelSettingTitle => 'Pencét Roda Sora';

  @override
  String get splitScreenSettingTitle => 'Modeu layar Blit';

  @override
  String get touchSoundsDialogTitle => 'Toél sora';

  @override
  String get touchSoundsDialogContent =>
      'Punten aktipkeun sora sentuhan tina setélan sistem ngadangu sora klik klik';

  @override
  String get immersiveModeSettingTitle => 'Modeu Impersiveive';

  @override
  String get showAppTutorialSettingTitle => 'Nunjukkeun tutorial';

  @override
  String get changeDirectorySettingTitle => 'Ngarobih diréktori';

  @override
  String get donateSettingTitle => 'Nulungan';

  @override
  String get donateSettingDescription =>
      'Upami anjeun resep aplikasi ieu, punten mertimbangkeun donasi.';

  @override
  String get versionAboutScreenTitle => 'Versi';

  @override
  String get madeWithLoveTitle => 'Dilakukeun ku ❤';

  @override
  String get noMusicFilesFound => 'Teu aya musik';

  @override
  String get noArtistsFound => 'Teu aya seniman';

  @override
  String get noAlbumsFound => 'Euweuh albeum';

  @override
  String get unknownSong => 'Lagu teu dikenal';

  @override
  String get unknownArtist => 'Artis anu teu dipikanyaho';

  @override
  String get unknownAlbum => 'Album anu teu dikenal';

  @override
  String get unknownGenre => 'Karesep teu dikenal';

  @override
  String get buttonConfirmText => 'OKÉ';

  @override
  String get tileValueOn => 'Dina';

  @override
  String get tileValueOff => 'Pareum';

  @override
  String get commonOfText => 'tina';

  @override
  String get pageNotFoundText => 'Halaman anu dipasihkeun henteu kapendak';

  @override
  String get commonErrorText => 'Kasalahan';

  @override
  String get retryButtonText => 'Percobaan langkung lami';

  @override
  String get filePickerDialogTitle => 'Pilih diréktori pikeun nyeken musik';

  @override
  String get searchScreenTitle => 'Milarian';

  @override
  String get searchEmptyText => 'Teu aya hasil pencarian';

  @override
  String get searchResultsText => 'Hasil milarian:';

  @override
  String get resultsForText => 'Hasil pikeun:';

  @override
  String get disableBatteryOptimizationTitle => 'Pareuman Otomatis';

  @override
  String get disableBatteryOptimizationContent =>
      'Punten panampah optimasi batré pikeun aplikasi ieu dina setélan alat pikeun ngijinkeun pamuter musik.';

  @override
  String get languageScreenTitle => 'Basana';

  @override
  String get silverDeviceColor => 'Perak';

  @override
  String get blackDeviceColor => 'Hideung';

  @override
  String get resetSettingsTitle => 'Reset setélan';

  @override
  String get browseArtist => 'Senjata kuda';

  @override
  String get browseAlbum => 'Brootse Albe';

  @override
  String get cancelText => 'Ngabatalkeun';

  @override
  String get playlistsScreenTitle => 'Puter';

  @override
  String get addToOnTheGoPlaylist => 'Tambahkeun kana';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Tambihkeun Albeum ka-On';

  @override
  String get removeSongFromThePlaylist => 'Cabut tina daptar puter';

  @override
  String get allAlbums => 'Sadaya albeum';

  @override
  String get scanningMusicFiles => 'File musik scanning';

  @override
  String get newPlaylist => 'Daptar puter Anyar';

  @override
  String get savePlaylist => 'Simpen Daptarlist';

  @override
  String get clearPlaylist => 'Daptar daptar';

  @override
  String get rescanMusicFilesSettingTitle => 'File musik nyalametkeun';

  @override
  String get deviceControlMenuTutorialText =>
      'Mindahkeun jempol anjeun enteng sakitar roda klik pikeun napigasi ménu';

  @override
  String get centerButtonMenuTutorialText =>
      'Pencét tombol PUSAT pikeun milih item menu anu disorot';

  @override
  String get playPauseMenuTutorialText =>
      'Pencét tombol ieu pikeun maén atanapi ngareureuhkeun lagu';

  @override
  String get nextButtonMenuTutorialText =>
      'Pencét tombol ieu pikeun skip ka lagu salajengna';

  @override
  String get previousButtonMenuTutorialText =>
      'Pencét tombol ieu pikeun ngarobih atanapi balik deui ka lagu sateuacana';

  @override
  String get menuButtonTutorialText =>
      'Pencét tombol ieu pikeun balik deui ka ménu anu saencana. Anjeun tiasa pencét sareng tahan tina layar anu sanés pikeun langsung angkat ka menu utama.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Ieu layar tampilan. Toél layar sareng mode layar diaktipkeun sacara standar sareng tiasa dikonpigurasi salajengna dina setélan.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Mindahkeun jempol anjeun sakitar roda klik pikeun ngaluyukeun polumeu';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Pencét tombol PUSAT pikeun siklus ngalangkungan bar, scrubber sareng lepeng geser. Pencét sareng tahan tombol Pusat pikeun ngakses pilihan tambahan.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Pencét sareng tahan tombol ieu pikeun gancang maju lagu';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Pencét sareng tahan tombol ieu pikeun ngintunkeun lagu';

  @override
  String get deviceControlSearchTutorialText =>
      'Mindahkeun jempol anjeun enteng sakitar roda klik pikeun nyorot alfabét';

  @override
  String get centerButtonSearchTutorialText =>
      'Pencét tombol pusat pikeun milih alfabét anu disorot';

  @override
  String get nextButtonSearchTutorialText =>
      'Pencét tombol ieu pikeun nambihan rohangan';

  @override
  String get previousButtonSearchTutorialText =>
      'Pencét tombol ieu pikeun mupus karakter anu terakhir';

  @override
  String get menuButtonSearchTutorialText =>
      'Pencét tombol ieu pikeun nutup keyboard sareng berinteraksi sareng hasil pencarian';

  @override
  String get allSongs => 'Sadaya lagu';
}
