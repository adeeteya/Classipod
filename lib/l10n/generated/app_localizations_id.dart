// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'Classipod';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle => 'Izin akses audio diperlukan';

  @override
  String get audioAccessPermissionContent =>
      'Harap berikan akses file audio untuk memungkinkan kami memutar file musik Anda.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Izin akses audio ditolak';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Harap berikan file audio akses untuk aplikasi ini di pengaturan perangkat untuk memungkinkan kami memutar file musik Anda.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Musik';

  @override
  String get nowPlayingScreenTitle => 'Sekarang bermain';

  @override
  String get shuffleSongsMenuTitle => 'Lagu -lagu pengocok';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Pengaturan';

  @override
  String get aboutScreenTitle => 'Tentang';

  @override
  String get coverFlowScreenTitle => 'Aliran penutup';

  @override
  String get artistsScreenTitle => 'Seniman';

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
      one: '1 lagu',
      zero: 'Tidak ada lagu',
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
      one: '1 album',
      zero: 'Tidak ada album',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Genre';

  @override
  String get genreSongsScreenTitle => 'Lagu Genre';

  @override
  String get deviceColorSettingTitle => 'Warna perangkat';

  @override
  String get touchScreenSettingTitle => 'Layar sentuh diaktifkan';

  @override
  String get repeatModeSettingTitle => 'Mengulang';

  @override
  String get repeatModeOne => 'Satu';

  @override
  String get repeatModeAll => 'Semua';

  @override
  String get vibrateSettingTitle => 'Bergetar';

  @override
  String get clickWheelSettingTitle => 'Klik suara roda';

  @override
  String get splitScreenSettingTitle => 'Mode Layar Terpisah';

  @override
  String get touchSoundsDialogTitle => 'Suara sentuh';

  @override
  String get touchSoundsDialogContent =>
      'Harap aktifkan suara sentuh dari pengaturan sistem untuk mendengar suara roda klik';

  @override
  String get immersiveModeSettingTitle => 'Mode mendalam';

  @override
  String get showAppTutorialSettingTitle => 'Tampilkan tutorial';

  @override
  String get changeDirectorySettingTitle => 'Ubah direktori';

  @override
  String get donateSettingTitle => 'Menyumbangkan';

  @override
  String get donateSettingDescription =>
      'Jika Anda menyukai aplikasi ini, pertimbangkan untuk menyumbang.';

  @override
  String get versionAboutScreenTitle => 'Versi';

  @override
  String get madeWithLoveTitle => 'Dibuat dengan ❤️ oleh';

  @override
  String get noMusicFilesFound => 'Tidak ada musik';

  @override
  String get noArtistsFound => 'Tidak ada artis';

  @override
  String get noAlbumsFound => 'Tidak ada album';

  @override
  String get unknownSong => 'Lagu yang tidak dikenal';

  @override
  String get unknownArtist => 'Artis Tidak Dikenal';

  @override
  String get unknownAlbum => 'Album yang tidak diketahui';

  @override
  String get unknownGenre => 'Genre yang tidak diketahui';

  @override
  String get buttonConfirmText => 'OKE';

  @override
  String get tileValueOn => 'Pada';

  @override
  String get tileValueOff => 'Mati';

  @override
  String get commonOfText => 'dari';

  @override
  String get pageNotFoundText => 'Halaman yang diberikan tidak ditemukan';

  @override
  String get commonErrorText => 'Kesalahan';

  @override
  String get retryButtonText => 'Mencoba kembali';

  @override
  String get filePickerDialogTitle => 'Pilih direktori untuk memindai musik';

  @override
  String get searchScreenTitle => 'Mencari';

  @override
  String get searchEmptyText => 'Tidak ada hasil pencarian';

  @override
  String get searchResultsText => 'Hasil pencarian:';

  @override
  String get resultsForText => 'Hasil untuk:';

  @override
  String get disableBatteryOptimizationTitle => 'Nonaktifkan optimasi baterai';

  @override
  String get disableBatteryOptimizationContent =>
      'Harap nonaktifkan optimasi baterai untuk aplikasi ini di pengaturan perangkat untuk memungkinkan pemutaran latar belakang musik.';

  @override
  String get languageScreenTitle => 'Bahasa';

  @override
  String get silverDeviceColor => 'Perak';

  @override
  String get blackDeviceColor => 'Hitam';

  @override
  String get resetSettingsTitle => 'Setting pengaturan';

  @override
  String get browseArtist => 'Jelajahi artis';

  @override
  String get browseAlbum => 'Album Jelajahi';

  @override
  String get cancelText => 'Membatalkan';

  @override
  String get playlistsScreenTitle => 'Daftar putar';

  @override
  String get addToOnTheGoPlaylist => 'Tambahkan ke saat bepergian';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Tambahkan album ke saat bepergian';

  @override
  String get removeSongFromThePlaylist => 'Hapus dari daftar putar';

  @override
  String get allAlbums => 'Semua album';

  @override
  String get scanningMusicFiles => 'Memindai file musik';

  @override
  String get newPlaylist => 'Daftar putar baru';

  @override
  String get savePlaylist => 'Simpan daftar putar';

  @override
  String get clearPlaylist => 'Daftar putar yang jelas';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan Music Files';

  @override
  String get deviceControlMenuTutorialText =>
      'Pindahkan ibu jari Anda dengan ringan di sekitar roda klik untuk menavigasi menu';

  @override
  String get centerButtonMenuTutorialText =>
      'Tekan tombol tengah untuk memilih item menu yang disorot';

  @override
  String get playPauseMenuTutorialText =>
      'Tekan tombol ini untuk memutar atau menjeda lagu';

  @override
  String get nextButtonMenuTutorialText =>
      'Tekan tombol ini untuk melompat ke lagu berikutnya';

  @override
  String get previousButtonMenuTutorialText =>
      'Tekan tombol ini untuk mundur atau kembali ke lagu sebelumnya';

  @override
  String get menuButtonTutorialText =>
      'Tekan tombol ini untuk kembali ke menu sebelumnya. Anda dapat menekan dan menahannya dari layar lain untuk langsung pergi ke menu utama.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Ini adalah layar tampilan. Layar sentuh dan mode layar terpisah diaktifkan secara default dan dapat dikonfigurasi lebih lanjut dalam pengaturan.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Pindahkan ibu jari Anda di sekitar roda klik untuk menyesuaikan volume';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Tekan tombol tengah untuk bersepeda melalui pencarian bar, scrubber bar, dan slider shuffle. Tekan dan tahan tombol tengah untuk mengakses opsi tambahan.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Tekan dan tahan tombol ini untuk menyalakan lagunya';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Tekan dan tahan tombol ini untuk memundurkan kembali lagu';

  @override
  String get deviceControlSearchTutorialText =>
      'Pindahkan ibu jari Anda dengan ringan di sekitar roda klik untuk menyorot alfabet';

  @override
  String get centerButtonSearchTutorialText =>
      'Tekan tombol tengah untuk memilih alfabet yang disorot';

  @override
  String get nextButtonSearchTutorialText =>
      'Tekan tombol ini untuk menambahkan ruang';

  @override
  String get previousButtonSearchTutorialText =>
      'Tekan tombol ini untuk menghapus karakter terakhir';

  @override
  String get menuButtonSearchTutorialText =>
      'Tekan tombol ini untuk menutup keyboard dan berinteraksi dengan hasil pencarian';
}
