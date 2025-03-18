// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Javanese (`jv`).
class AppLocalizationsJv extends AppLocalizations {
  AppLocalizationsJv([String locale = 'jv']) : super(locale);

  @override
  String get appTitle => 'Klasipod';

  @override
  String get menuButtonText => 'Menu';

  @override
  String get audioAccessPermissionTitle => 'Ijin akses audio dibutuhake';

  @override
  String get audioAccessPermissionContent =>
      'Mangga diwenehi akses audio file supaya bisa muter file musik.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Ijin akses audio ditolak';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Mangga menehi akses audio file kanggo aplikasi iki ing setelan piranti supaya bisa main file musik.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Musik';

  @override
  String get nowPlayingScreenTitle => 'Saiki muter';

  @override
  String get shuffleSongsMenuTitle => 'Lagu Shuffle';

  @override
  String get shuffleSettingTitle => 'Ngacak';

  @override
  String get settingsScreenTitle => 'Setelan';

  @override
  String get aboutScreenTitle => 'Babagan';

  @override
  String get coverFlowScreenTitle => 'Aliran tutup';

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
      zero: 'Ora Lagu',
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
      zero: 'Ora ana Album',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Genre';

  @override
  String get genreSongsScreenTitle => 'Lagu Genre';

  @override
  String get deviceColorSettingTitle => 'Werna Piranti';

  @override
  String get touchScreenSettingTitle => 'Layar tutul diaktifake';

  @override
  String get repeatModeSettingTitle => 'Baleni';

  @override
  String get repeatModeOne => 'Siji';

  @override
  String get repeatModeAll => 'Kabeh';

  @override
  String get vibrateSettingTitle => 'Kedher';

  @override
  String get clickWheelSettingTitle => 'Klik klik roda';

  @override
  String get splitScreenSettingTitle => 'Mode layar pamisah';

  @override
  String get touchSoundsDialogTitle => 'Sugeng swara';

  @override
  String get touchSoundsDialogContent =>
      'Mangga ngaktifake swara sentuhan saka setelan sistem kanggo ngrungokake swara roda klik';

  @override
  String get immersiveModeSettingTitle => 'Mode immersive';

  @override
  String get showAppTutorialSettingTitle => 'Tampilake Tutorial';

  @override
  String get changeDirectorySettingTitle => 'Ganti direktori';

  @override
  String get donateSettingTitle => 'Sumbang';

  @override
  String get donateSettingDescription =>
      'Yen sampeyan seneng app iki, mangga elinga menehi sumbangan.';

  @override
  String get versionAboutScreenTitle => 'Versi';

  @override
  String get madeWithLoveTitle => 'Digawe karo ❤️ dening';

  @override
  String get noMusicFilesFound => 'Ora musik';

  @override
  String get noArtistsFound => 'Ora seniman';

  @override
  String get noAlbumsFound => 'Ora ana album';

  @override
  String get unknownSong => 'Lagu Ora dingerteni';

  @override
  String get unknownArtist => 'Artis sing Ora dingerteni';

  @override
  String get unknownAlbum => 'Album sing ora dingerteni';

  @override
  String get unknownGenre => 'Genre Ora dingerteni';

  @override
  String get buttonConfirmText => 'Ok';

  @override
  String get tileValueOn => 'Ing';

  @override
  String get tileValueOff => 'Mati';

  @override
  String get commonOfText => 'saka';

  @override
  String get pageNotFoundText => 'Kaca sing diwenehake ora ditemokake';

  @override
  String get commonErrorText => 'Kesalahan';

  @override
  String get retryButtonText => 'Coba maneh';

  @override
  String get filePickerDialogTitle => 'Pilih direktori kanggo mindhai musik';

  @override
  String get searchScreenTitle => 'Telusuran';

  @override
  String get searchEmptyText => 'Ora ana asil telusuran';

  @override
  String get searchResultsText => 'Asil Panelusuran:';

  @override
  String get resultsForText => 'Asil kanggo:';

  @override
  String get disableBatteryOptimizationTitle => 'Pateni Optimization Baterai';

  @override
  String get disableBatteryOptimizationContent =>
      'Mangga mateni optimalisasi baterei kanggo aplikasi iki ing setelan piranti supaya bisa muter maneh musik.';

  @override
  String get languageScreenTitle => 'Basa';

  @override
  String get silverDeviceColor => 'Perak';

  @override
  String get blackDeviceColor => 'Ireng';

  @override
  String get resetSettingsTitle => 'Reset setelan';

  @override
  String get browseArtist => 'Telusuri Artis';

  @override
  String get browseAlbum => 'Telusuri Album';

  @override
  String get cancelText => 'Batal';

  @override
  String get playlistsScreenTitle => 'Dhaptar lagu';

  @override
  String get addToOnTheGoPlaylist => 'Tambah ing-the-go';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Tambah Album kanggo On-The-Go';

  @override
  String get removeSongFromThePlaylist => 'Mbusak saka dhaptar lagu';

  @override
  String get allAlbums => 'Kabeh album';

  @override
  String get scanningMusicFiles => 'File Musik Scanning';

  @override
  String get newPlaylist => 'Dhaptar Dhaptar Anyar';

  @override
  String get savePlaylist => 'Simpen dhaptar lagu';

  @override
  String get clearPlaylist => 'Mbusak dhaptar lagu';

  @override
  String get rescanMusicFilesSettingTitle => 'Files Musik Rescan';

  @override
  String get deviceControlMenuTutorialText =>
      'Pindhah jempol kanthi entheng ing rodha klik kanggo navigasi menu';

  @override
  String get centerButtonMenuTutorialText =>
      'Pencet tombol Center kanggo milih item menu sing disorot';

  @override
  String get playPauseMenuTutorialText =>
      'Pencet tombol iki kanggo muter utawa ngaso lagu';

  @override
  String get nextButtonMenuTutorialText =>
      'Pencet tombol iki kanggo ngliwati lagu sabanjure';

  @override
  String get previousButtonMenuTutorialText =>
      'Pencet tombol iki kanggo mundur cepet utawa bali menyang lagu sadurunge';

  @override
  String get menuButtonTutorialText =>
      'Pencet tombol iki kanggo bali menyang menu sadurunge. Sampeyan bisa menet terus saka layar liyane supaya bisa langsung menyang menu utama.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Iki layar tampilan. Tutul layar lan mode layar pamisah diaktifake kanthi gawan lan bisa dikonfigurasi luwih dhisik ing setelan kasebut.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Pindhah jempol ngubengi rodha klik kanggo nyetel volume';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Pencet tombol tengah kanggo ngupaya Bar, Bar Scruubber lan Slider Shuffle. Pencet terus tombol tengah kanggo ngakses opsi tambahan.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Penet terus tombol iki kanggo cepet lagu kasebut';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Pencet terus tombol iki kanggo mundur lagu';

  @override
  String get deviceControlSearchTutorialText =>
      'Pindhah jempol kanthi entheng ing rodha klik kanggo nyorot alfabet';

  @override
  String get centerButtonSearchTutorialText =>
      'Pencet tombol tengah kanggo milih aksara sing disorot';

  @override
  String get nextButtonSearchTutorialText =>
      'Pencet tombol iki kanggo nambah papan';

  @override
  String get previousButtonSearchTutorialText =>
      'Pencet tombol iki kanggo mbusak karakter pungkasan';

  @override
  String get menuButtonSearchTutorialText =>
      'Pencet tombol iki kanggo nutup keyboard lan sesambungan karo asil telusuran';

  @override
  String get allSongs => 'Kabeh lagu';
}
