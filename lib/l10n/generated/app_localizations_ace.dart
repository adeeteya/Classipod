// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Achinese (`ace`).
class AppLocalizationsAce extends AppLocalizations {
  AppLocalizationsAce([String locale = 'ace']) : super(locale);

  @override
  String get appTitle => 'KlasiPod';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle =>
      'Izin Akses Audio Nyang dipeureulee .';

  @override
  String get audioAccessPermissionContent =>
      'Silakan neubri akses file audio keu neubi kamoe meu\'en file musik droeneuh.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Izin Akses Audio nyang ka Ditulak .';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Silakan neubri akses file audio keu app nyoe lam pengaturan alat untuk memungkenkan kamoe untuk meuen file musik droeneuh.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Musik';

  @override
  String get nowPlayingScreenTitle => 'Jinoe meuen';

  @override
  String get shuffleSongsMenuTitle => 'Lagu Shuffle';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Pengaturan';

  @override
  String get aboutScreenTitle => 'Teuntang';

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
      one: '1Lagu',
      zero: 'Hana lagu',
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
      zero: 'Hana Album',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'seumurak';

  @override
  String get genreSongsScreenTitle => 'Lagu Aceh Jameun';

  @override
  String get deviceColorSettingTitle => 'Warna Alat';

  @override
  String get touchScreenSettingTitle => 'Layar Touch Aktifkan .';

  @override
  String get repeatModeSettingTitle => 'Ulang';

  @override
  String get repeatModeOne => 'Sa';

  @override
  String get repeatModeAll => 'Mandum';

  @override
  String get vibrateSettingTitle => 'Neu tinjau';

  @override
  String get clickWheelSettingTitle => 'Klik Bunyi-bunyi Roda .';

  @override
  String get splitScreenSettingTitle => 'Mode Layar Split';

  @override
  String get touchSoundsDialogTitle => 'Sumber Touch';

  @override
  String get touchSoundsDialogContent =>
      'Silakan Aktifkan Bunyi dari Pengaturan Sistem untuk deungoe su roda klik .';

  @override
  String get immersiveModeSettingTitle => 'Mode Imsersif';

  @override
  String get showAppTutorialSettingTitle => 'Peuleumah Tutorial';

  @override
  String get changeDirectorySettingTitle => 'Direktori Perubahan';

  @override
  String get donateSettingTitle => 'Donasi';

  @override
  String get donateSettingDescription =>
      'Meunyo galak keu app nyoe, neupertimbangkan untuk neubri sumbangan.';

  @override
  String get versionAboutScreenTitle => 'Versi';

  @override
  String get madeWithLoveTitle => 'Dipeugot ngon ❤️ le .';

  @override
  String get noMusicFilesFound => 'Hana musik';

  @override
  String get noArtistsFound => 'Hana Artis';

  @override
  String get noAlbumsFound => 'hana Album';

  @override
  String get unknownSong => 'Lagu Nyang Hana Dituri';

  @override
  String get unknownArtist => 'Seniman nyang hana jituri';

  @override
  String get unknownAlbum => 'Album nyang hana dituri';

  @override
  String get unknownGenre => 'Hana jituri le Genre';

  @override
  String get buttonConfirmText => 'OK';

  @override
  String get tileValueOn => 'Di';

  @override
  String get tileValueOff => 'Piyoh';

  @override
  String get commonOfText => 'dari';

  @override
  String get pageNotFoundText =>
      'Laman nyang ka geubri nyan hana geuteumeung .';

  @override
  String get commonErrorText => 'Eror';

  @override
  String get retryButtonText => 'Barui';

  @override
  String get filePickerDialogTitle => 'Pileh saboh Direktori Scan keu Musik .';

  @override
  String get searchScreenTitle => 'Mita';

  @override
  String get searchEmptyText => 'Hana Hase Pencarian';

  @override
  String get searchResultsText => 'Hase Pencarian:';

  @override
  String get resultsForText => 'Hase keu:';

  @override
  String get disableBatteryOptimizationTitle => 'Optimasi Baterai Cacat';

  @override
  String get disableBatteryOptimizationContent =>
      'Silakan neu nonaktifkan optimasi baterai keu aplikasi nyoe lam pengaturan alat untuk memungkenkan pemenang musik musik.';

  @override
  String get languageScreenTitle => 'Basa';

  @override
  String get silverDeviceColor => 'Pirak';

  @override
  String get blackDeviceColor => 'Itam';

  @override
  String get resetSettingsTitle => 'Pengaturan Reset';

  @override
  String get browseArtist => 'Artis Browse';

  @override
  String get browseAlbum => 'Browse Album';

  @override
  String get cancelText => 'batai';

  @override
  String get playlistsScreenTitle => 'Punggul';

  @override
  String get addToOnTheGoPlaylist => 'Tambah keu On-Go .';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Tambah Album keu On-Go .';

  @override
  String get removeSongFromThePlaylist => 'Peuhah bak Praylist .';

  @override
  String get allAlbums => 'Semuina';

  @override
  String get scanningMusicFiles => 'Pembakaran File Musik .';

  @override
  String get newPlaylist => 'Playlist Baroe';

  @override
  String get savePlaylist => 'Simat Playlist';

  @override
  String get clearPlaylist => 'Peumaen Peugleh .';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan Baju Musik .';

  @override
  String get deviceControlMenuTutorialText =>
      'Pindah jeumot droeneuh ringan-ringan di sekitar Click Wheel untuk neu navigasi menu .';

  @override
  String get centerButtonMenuTutorialText =>
      'Teukan tombol pusat keu pilih item menu nyang ka geusorot .';

  @override
  String get playPauseMenuTutorialText =>
      'Teukan tombol nyoe keu meu\'en atawa neu jeuda lagu .';

  @override
  String get nextButtonMenuTutorialText =>
      'Teukan tombol nyoe keu neu skip bak lagu selanjut jih .';

  @override
  String get previousButtonMenuTutorialText =>
      'Teukan tombol nyoe keu neuwoe atawa neuwoe lom bak lagu awai .';

  @override
  String get menuButtonTutorialText =>
      'Teukan tombol nyoe keu tajak woe u menu awai. Droeneuh jeuet neutekan dan neumat dari layar laen keu langsong neujak u menu utama.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Nyoe keuh layar tampilan. Mode Screen Touch dan Penyalahgunaan Penyalahgunaan diaktifkan secara default dan jeut dikonfigurasi leubeh lanjot lam pengaturan.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Pindah jaroe droeneuh di sekitar Click Wheel untuk neusesuaikan volume .';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Teukan tombol Pusat keu meu-sepeda rot mita bar, bar scrubber ngon slider sliffle. Teukan dan peugot tombol Pusat keu neuakses opsi tambahan.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Teukan dan mat tombol nyoe untuk bagah maju lagu .';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Teukan dan peugot tombol nyoe untuk neu rewire lagu .';

  @override
  String get deviceControlSearchTutorialText =>
      'Pindah jeumot droeneuh deungon ringan-ringan di sekitar Wheel Click untuk neusorot saboh abjad .';

  @override
  String get centerButtonSearchTutorialText =>
      'Teukan tombol pusat keu pilih abjad nyang ka geusorot .';

  @override
  String get nextButtonSearchTutorialText =>
      'Teukan tombol nyoe keu neu tamah saboh ruang .';

  @override
  String get previousButtonSearchTutorialText =>
      'Teukan tombol nyoe keu neusampôh karakter nyang akhé .';

  @override
  String get menuButtonSearchTutorialText =>
      'Teukan tombol nyoe untuk tapeutop keyboard dan ta interaksi ngon hasee pencarian .';

  @override
  String get allSongs => 'Mandum lagu';
}
