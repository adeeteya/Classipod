// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Betawi (`bew`).
class AppLocalizationsBew extends AppLocalizations {
  AppLocalizationsBew([String locale = 'bew']) : super(locale);

  @override
  String get appTitle => 'Kepalaan Kelas';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle => 'Izin Akses Akses Akses yang Dibutuhin .';

  @override
  String get audioAccessPermissionContent => 'Silahkan kasih berkas audio akses untuk memungkinkan kami untuk memainkan file musik lo.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Izin Akses Akses Akses yang ditolak .';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Silahkan kasih berkas audio akses untuk aplikasi ini di pengaturan perangkat untuk memungkinkan kami untuk memainkan file musik lo.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Musik';

  @override
  String get nowPlayingScreenTitle => 'Sekarang maen';

  @override
  String get shuffleSongsMenuTitle => 'Acak-acak Lagu';

  @override
  String get shuffleSettingTitle => 'Asah';

  @override
  String get settingsScreenTitle => 'Setelan';

  @override
  String get aboutScreenTitle => 'Soal';

  @override
  String get coverFlowScreenTitle => 'Air Penutup';

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
      one: '1 lagu',
      zero: 'kagak ada lagu',
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
      zero: 'kagak ada album',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Generes';

  @override
  String get genreSongsScreenTitle => 'Lagu Genre';

  @override
  String get deviceColorSettingTitle => 'Warna Perangkat';

  @override
  String get touchScreenSettingTitle => 'Sentuh Layar yang diaktifin .';

  @override
  String get repeatModeSettingTitle => 'Ngulang';

  @override
  String get repeatModeOne => 'Satu';

  @override
  String get repeatModeAll => 'Semue';

  @override
  String get vibrateSettingTitle => 'Geter-getar';

  @override
  String get clickWheelSettingTitle => 'Klik Suara Roda .';

  @override
  String get splitScreenSettingTitle => 'Mode Layar Belah';

  @override
  String get touchSoundsDialogTitle => 'Sentuh Suara';

  @override
  String get touchSoundsDialogContent => 'Silahkan Aktifkan Sentuh Suara dari Pengaturan Sistem buat denger roda klik bunyi';

  @override
  String get immersiveModeSettingTitle => 'Mode yang Menjelang';

  @override
  String get showAppTutorialSettingTitle => 'Tunjukin Tutorial';

  @override
  String get changeDirectorySettingTitle => 'Ganti Direktori';

  @override
  String get donateSettingTitle => 'Nyumbang';

  @override
  String get donateSettingDescription => 'Kalo suka app ini, silahkan pertimbangin buat nyumbang.';

  @override
  String get versionAboutScreenTitle => 'Versi';

  @override
  String get madeWithLoveTitle => 'Dibuat dengan ❤️ ama .';

  @override
  String get noMusicFilesFound => 'Kagak Musik';

  @override
  String get noArtistsFound => 'Kagak ada Artis';

  @override
  String get noAlbumsFound => 'Kagak ada Albums';

  @override
  String get unknownSong => 'Lagu yang kagak dikenal';

  @override
  String get unknownArtist => 'Seniman kagak dikenal';

  @override
  String get unknownAlbum => 'Gak taunye Album .';

  @override
  String get unknownGenre => 'Genre kagak dikenal';

  @override
  String get buttonConfirmText => 'OKE';

  @override
  String get tileValueOn => 'Di';

  @override
  String get tileValueOff => 'Modar';

  @override
  String get commonOfText => 'dari';

  @override
  String get pageNotFoundText => 'Halaman yang dikasih itu kagak ditemuin .';

  @override
  String get commonErrorText => 'Kesalahan';

  @override
  String get retryButtonText => 'Coba lagi';

  @override
  String get filePickerDialogTitle => 'Pilih Direktori buat Scan buat Musik .';

  @override
  String get searchScreenTitle => 'Nyari';

  @override
  String get searchEmptyText => 'Kagak ada Hasil Pencarian .';

  @override
  String get searchResultsText => 'Hasil Pencarian:';

  @override
  String get resultsForText => 'Hasilnye untuk:';

  @override
  String get disableBatteryOptimizationTitle => 'Nonaktifin Optimasi Batere .';

  @override
  String get disableBatteryOptimizationContent => 'Tolong dinonaktifkan optimasi baterai untuk aplikasi ini di pengaturan perangkat untuk memungkinkan pemutaran latar belakang musik.';

  @override
  String get languageScreenTitle => 'Bahasa';

  @override
  String get silverDeviceColor => 'Perak';

  @override
  String get blackDeviceColor => 'Item';

  @override
  String get resetSettingsTitle => 'Reset pengaturan';

  @override
  String get browseArtist => 'Jelajahi Artis';

  @override
  String get browseAlbum => 'Jelajahin Album';

  @override
  String get cancelText => 'Ngusekin';

  @override
  String get playlistsScreenTitle => 'Daftar-tambah';

  @override
  String get addToOnTheGoPlaylist => 'Tambah lagi ke Di-Pegawai';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Tambahin Album ke Di-Si-Go .';

  @override
  String get removeSongFromThePlaylist => 'Hapus dari Daftar Maen .';

  @override
  String get allAlbums => 'Semua Album';

  @override
  String get scanningMusicFiles => 'Berkas Musik yang ngepindai .';

  @override
  String get newPlaylist => 'Daftar Maen Baru';

  @override
  String get savePlaylist => 'Simpan Daftar Maen .';

  @override
  String get clearPlaylist => 'Daftar Maen Bening';

  @override
  String get rescanMusicFilesSettingTitle => 'File Musik rescan';

  @override
  String get deviceControlMenuTutorialText => 'Gerakin jempol enteng di sekitar Roda Klik buat navigasiin menu .';

  @override
  String get centerButtonMenuTutorialText => 'Tekan tombol tengah buat pilih item menu yang disorot .';

  @override
  String get playPauseMenuTutorialText => 'Tekan tombol ini buat diputer atau jeda lagu .';

  @override
  String get nextButtonMenuTutorialText => 'Tekan tombol ini buat bolos ke lagu selanjutnya .';

  @override
  String get previousButtonMenuTutorialText => 'Tekan tombol ini buat mundur atau balik lagi ke lagu sebelumnya .';

  @override
  String get menuButtonTutorialText => 'Tekan tombol ini buat balik ke menu sebelumnya. Bisa aja lo pencet dan pegang dari layar lain buat langsung ke menu utama.';

  @override
  String get deviceScreenMenuTutorialText => 'Ini nih yang jadi layar tampilan. Sentuhan Layar dan Mode Layar Belah diaktifkan secara bawaan dan bisa dikonvigu lebih jauh lagi di pengaturan.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Pindahin jempol di sekitar Roda Klik buat nyesuain volume .';

  @override
  String get centerButtonNowPlayingTutorialText => 'Tekan tombol Pusat buat sepedaan lewat cari bar, srubber bar dan slider acak. Tekan terus tombol Pusat buat akses opsi tambahan.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Tekan dan tahan tombol ini buat ngebut majuin lagu .';

  @override
  String get previousButtonNowPlayingTutorialText => 'Tekan terus tombol ini buat mundurin lagu .';

  @override
  String get deviceControlSearchTutorialText => 'Gerakin jempol enteng di sekitar Roda Klik buat nyorot alfabet .';

  @override
  String get centerButtonSearchTutorialText => 'Tekan tombol tengah buat pilih alfabet yang disorot .';

  @override
  String get nextButtonSearchTutorialText => 'Tekan tombol ini buat nambah ruang .';

  @override
  String get previousButtonSearchTutorialText => 'Tekan tombol ini buat ngapus karakter terakhir .';

  @override
  String get menuButtonSearchTutorialText => 'Tekan tombol ini buat nutup keyboard dan interaksiin sama hasil pencarian .';
}
