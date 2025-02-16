// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class AppLocalizationsMs extends AppLocalizations {
  AppLocalizationsMs([String locale = 'ms']) : super(locale);

  @override
  String get appTitle => 'Classipod';

  @override
  String get menuButtonText => 'Menu';

  @override
  String get audioAccessPermissionTitle => 'Kebenaran akses audio diperlukan';

  @override
  String get audioAccessPermissionContent => 'Sila berikan akses fail audio untuk membolehkan kami memainkan fail muzik anda.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Kebenaran akses audio ditolak';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Sila berikan akses fail audio untuk aplikasi ini dalam tetapan peranti untuk membolehkan kami memainkan fail muzik anda.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Muzik';

  @override
  String get nowPlayingScreenTitle => 'Sekarang bermain';

  @override
  String get shuffleSongsMenuTitle => 'Lagu Shuffle';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Tetapan';

  @override
  String get aboutScreenTitle => 'Mengenai';

  @override
  String get coverFlowScreenTitle => 'Aliran penutup';

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
      other: '$countString lagu',
      one: '1 Song',
      zero: 'no Songs',
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
      other: '$countString album',
      one: '1 album',
      zero: 'no album',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Genre';

  @override
  String get genreSongsScreenTitle => 'Lagu Genre';

  @override
  String get deviceColorSettingTitle => 'Warna peranti';

  @override
  String get touchScreenSettingTitle => 'Skrin sentuh diaktifkan';

  @override
  String get repeatModeSettingTitle => 'Ulangi';

  @override
  String get repeatModeOne => 'Satu';

  @override
  String get repeatModeAll => 'Semua';

  @override
  String get vibrateSettingTitle => 'Bergetar';

  @override
  String get clickWheelSettingTitle => 'Klik bunyi roda';

  @override
  String get splitScreenSettingTitle => 'Mod skrin berpecah';

  @override
  String get touchSoundsDialogTitle => 'Sentuh bunyi';

  @override
  String get touchSoundsDialogContent => 'Sila aktifkan bunyi sentuhan dari tetapan sistem untuk mendengar bunyi roda klik';

  @override
  String get immersiveModeSettingTitle => 'Mod immersive';

  @override
  String get showAppTutorialSettingTitle => 'Tunjukkan tutorial';

  @override
  String get changeDirectorySettingTitle => 'Tukar direktori';

  @override
  String get donateSettingTitle => 'Menderma';

  @override
  String get donateSettingDescription => 'Jika anda suka aplikasi ini, sila pertimbangkan untuk menderma.';

  @override
  String get versionAboutScreenTitle => 'Versi';

  @override
  String get madeWithLoveTitle => 'Dibuat dengan ❤️ oleh';

  @override
  String get noMusicFilesFound => 'Tiada muzik';

  @override
  String get noArtistsFound => 'Tiada artis';

  @override
  String get noAlbumsFound => 'Tiada album';

  @override
  String get unknownSong => 'Lagu yang tidak diketahui';

  @override
  String get unknownArtist => 'Artis yang tidak diketahui';

  @override
  String get unknownAlbum => 'Album yang tidak diketahui';

  @override
  String get unknownGenre => 'Genre yang tidak diketahui';

  @override
  String get buttonConfirmText => 'Ok';

  @override
  String get tileValueOn => 'Pada';

  @override
  String get tileValueOff => 'Mati';

  @override
  String get commonOfText => 'dari';

  @override
  String get pageNotFoundText => 'Halaman yang diberikan tidak dijumpai';

  @override
  String get commonErrorText => 'Ralat';

  @override
  String get retryButtonText => 'Cuba semula';

  @override
  String get filePickerDialogTitle => 'Pilih direktori untuk mengimbas muzik';

  @override
  String get searchScreenTitle => 'Cari';

  @override
  String get searchEmptyText => 'Tiada hasil carian';

  @override
  String get searchResultsText => 'Hasil carian:';

  @override
  String get resultsForText => 'Keputusan untuk:';

  @override
  String get disableBatteryOptimizationTitle => 'Lumpuhkan pengoptimuman bateri';

  @override
  String get disableBatteryOptimizationContent => 'Sila lumpuhkan pengoptimuman bateri untuk aplikasi ini dalam tetapan peranti untuk membolehkan main balik latar belakang muzik.';

  @override
  String get languageScreenTitle => 'Bahasa';

  @override
  String get silverDeviceColor => 'Perak';

  @override
  String get blackDeviceColor => 'Hitam';

  @override
  String get resetSettingsTitle => 'Tetapkan semula tetapan';

  @override
  String get browseArtist => 'Semak artis';

  @override
  String get browseAlbum => 'Semak album';

  @override
  String get cancelText => 'Batalkan';

  @override
  String get playlistsScreenTitle => 'Senarai main';

  @override
  String get addToOnTheGoPlaylist => 'Tambah ke on-the-go';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Tambahkan album ke dalam perjalanan';

  @override
  String get removeSongFromThePlaylist => 'Keluarkan dari senarai main';

  @override
  String get allAlbums => 'Semua album';

  @override
  String get scanningMusicFiles => 'Mengimbas fail muzik';

  @override
  String get newPlaylist => 'Senarai main baru';

  @override
  String get savePlaylist => 'Simpan senarai main';

  @override
  String get clearPlaylist => 'Senarai main yang jelas';

  @override
  String get rescanMusicFilesSettingTitle => 'Fail muzik rescan';

  @override
  String get deviceControlMenuTutorialText => 'Gerakkan ibu jari anda dengan ringan di sekitar roda klik untuk menavigasi menu';

  @override
  String get centerButtonMenuTutorialText => 'Tekan butang Pusat untuk memilih item menu yang diserlahkan';

  @override
  String get playPauseMenuTutorialText => 'Tekan butang ini untuk bermain atau menjeda lagu';

  @override
  String get nextButtonMenuTutorialText => 'Tekan butang ini untuk melangkau ke lagu seterusnya';

  @override
  String get previousButtonMenuTutorialText => 'Tekan butang ini untuk mundur atau kembali ke lagu sebelumnya';

  @override
  String get menuButtonTutorialText => 'Tekan butang ini untuk kembali ke menu sebelumnya. Anda boleh menekan dan menahannya dari mana -mana skrin lain untuk terus pergi ke menu utama.';

  @override
  String get deviceScreenMenuTutorialText => 'Ini adalah skrin paparan. Skrin sentuh dan mod skrin berpecah diaktifkan secara lalai dan boleh dikonfigurasikan selanjutnya dalam tetapan.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Gerakkan ibu jari anda di sekitar roda klik untuk menyesuaikan kelantangan';

  @override
  String get centerButtonNowPlayingTutorialText => 'Tekan butang tengah untuk menembusi Bar, Bar Scrubber dan Slider Shuffle. Tekan dan tahan butang Pusat untuk mengakses pilihan tambahan.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Tekan dan tahan butang ini untuk meneruskan lagu';

  @override
  String get previousButtonNowPlayingTutorialText => 'Tekan dan tahan butang ini untuk memutar balik lagu';

  @override
  String get deviceControlSearchTutorialText => 'Gerakkan ibu jari anda dengan ringan di sekitar roda klik untuk menyerlahkan abjad';

  @override
  String get centerButtonSearchTutorialText => 'Tekan butang Pusat untuk memilih abjad yang diserlahkan';

  @override
  String get nextButtonSearchTutorialText => 'Tekan butang ini untuk menambah ruang';

  @override
  String get previousButtonSearchTutorialText => 'Tekan butang ini untuk memadam watak terakhir';

  @override
  String get menuButtonSearchTutorialText => 'Tekan butang ini untuk menutup papan kekunci dan berinteraksi dengan hasil carian';
}
