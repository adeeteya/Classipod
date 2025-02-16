// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Batak Simalungun (`bts`).
class AppLocalizationsBts extends AppLocalizations {
  AppLocalizationsBts([String locale = 'bts']) : super(locale);

  @override
  String get appTitle => 'Kelas.Pod';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle => 'Audio Akses Ijin na ihaporluhon .';

  @override
  String get audioAccessPermissionContent => 'Patugah ma file audio ase boi masuk hu file musikmu.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Audio Akses Ijin na Ihaporsayai .';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Patugah ma bani file audio akses bani aplikasi on bani pengaturan perangkat ase boi hanami marmeam file musik nasiam.';

  @override
  String get menuScreenTitle => 'Menian';

  @override
  String get musicMenuScreenTitle => 'Uning uningan';

  @override
  String get nowPlayingScreenTitle => 'Sonari Marmain';

  @override
  String get shuffleSongsMenuTitle => 'Dodingni';

  @override
  String get shuffleSettingTitle => 'Marhusip';

  @override
  String get settingsScreenTitle => 'Mangatur';

  @override
  String get aboutScreenTitle => 'Soal';

  @override
  String get coverFlowScreenTitle => 'Tutup Mabakar';

  @override
  String get artistsScreenTitle => 'Arti';

  @override
  String get albumsScreenTitle => 'Album';

  @override
  String get songsScreenTitle => 'mandoding';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Doding',
      one: '1 Doding',
      zero: 'Lang dong doding',
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
      zero: 'Lang dong Album',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Girah';

  @override
  String get genreSongsScreenTitle => 'Dodingni';

  @override
  String get deviceColorSettingTitle => 'Warna Perangkat';

  @override
  String get touchScreenSettingTitle => 'Surat Sentuhan Marsaor';

  @override
  String get repeatModeSettingTitle => 'Mangulaki';

  @override
  String get repeatModeOne => 'Sada';

  @override
  String get repeatModeAll => 'Haganupan';

  @override
  String get vibrateSettingTitle => 'Mardingat';

  @override
  String get clickWheelSettingTitle => 'Klik ma Soara Roda .';

  @override
  String get splitScreenSettingTitle => 'Mode Surat Spien';

  @override
  String get touchSoundsDialogTitle => 'Sentuhan';

  @override
  String get touchSoundsDialogContent => 'Boi do Aktifkon ma Touch Soara humbani Pengaturan Sistem laho manangar sora ni roda klik .';

  @override
  String get immersiveModeSettingTitle => 'Mode na Ipermula';

  @override
  String get showAppTutorialSettingTitle => 'Patuduhkon Tutorial';

  @override
  String get changeDirectorySettingTitle => 'Parubahan Direktori';

  @override
  String get donateSettingTitle => 'Sumbangan';

  @override
  String get donateSettingDescription => 'Anggo marosuh nasiam bani aplikasi on, pingkirhon ma laho mambere sumbangan.';

  @override
  String get versionAboutScreenTitle => 'Versi';

  @override
  String get madeWithLoveTitle => 'Ibahen marhitei ❤️ marhitei .';

  @override
  String get noMusicFilesFound => 'Lang dong Musik';

  @override
  String get noArtistsFound => 'Lang dong Artis';

  @override
  String get noAlbumsFound => 'Lang dong Bombun';

  @override
  String get unknownSong => 'Lang ibotoh Doding';

  @override
  String get unknownArtist => 'Artis';

  @override
  String get unknownAlbum => 'Lang ibotoh Album';

  @override
  String get unknownGenre => 'Lang ibotoh Genre';

  @override
  String get buttonConfirmText => 'BOI';

  @override
  String get tileValueOn => 'Bani';

  @override
  String get tileValueOff => 'Libur';

  @override
  String get commonOfText => 'humbani';

  @override
  String get pageNotFoundText => 'Lang dong jumpah halaman na ibere ai .';

  @override
  String get commonErrorText => 'Maseda';

  @override
  String get retryButtonText => 'suratkon';

  @override
  String get filePickerDialogTitle => 'Pilih ma Direktori laho Scan bani Musik .';

  @override
  String get searchScreenTitle => 'Manorihi';

  @override
  String get searchEmptyText => 'Lang dong na Mangkawah Hasil .';

  @override
  String get searchResultsText => 'Pindahi ma Hasilni:';

  @override
  String get resultsForText => 'Hasilni bani:';

  @override
  String get disableBatteryOptimizationTitle => 'Anggo lang dong na boi mambahen hita lang be marpangunsandeian.';

  @override
  String get disableBatteryOptimizationContent => 'Tolong ma cacat optimasi baterai bani aplikasi on bani pengaturan perangkat ase boi marlatarbelakang musik.';

  @override
  String get languageScreenTitle => 'Bahasa';

  @override
  String get silverDeviceColor => 'Pirak';

  @override
  String get blackDeviceColor => 'Birong';

  @override
  String get resetSettingsTitle => 'Reset Pengaturan';

  @override
  String get browseArtist => 'Patugah ma Artis';

  @override
  String get browseAlbum => 'Manjelajahi Album';

  @override
  String get cancelText => 'Lang saud';

  @override
  String get playlistsScreenTitle => 'Daftar Playlist';

  @override
  String get addToOnTheGoPlaylist => 'Tambahkon ma on-Go .';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Tambahkon ma Abam bani Abad-Go .';

  @override
  String get removeSongFromThePlaylist => 'Hapuskon ma humbani Playlist .';

  @override
  String get allAlbums => 'Haganupan';

  @override
  String get scanningMusicFiles => 'Biri-biri Musik na Scanging .';

  @override
  String get newPlaylist => 'New Listlist';

  @override
  String get savePlaylist => 'Hemat Playlist';

  @override
  String get clearPlaylist => 'Pelayanan na borsih';

  @override
  String get rescanMusicFilesSettingTitle => 'Barang Musik Rescan';

  @override
  String get deviceControlMenuTutorialText => 'Pindahkon ma jari-jari ni tanganmu ringan-ringan i sekitar Klik Klik laho manavigasi menu .';

  @override
  String get centerButtonMenuTutorialText => 'Tekan ma tombol pusat laho mamilih menu na isorotkon .';

  @override
  String get playPauseMenuTutorialText => 'Tekan ma tombol on laho marmeam atap pe pause ma sada doding .';

  @override
  String get nextButtonMenuTutorialText => 'Tekan ma tombol on laho manlewati doding na mangihut .';

  @override
  String get previousButtonMenuTutorialText => 'Tekan ma tombol on ase boi ibalikkon atap mulak hu doding na salpu .';

  @override
  String get menuButtonTutorialText => 'Tekan ma tombol on laho mulak hubani menu na salpu. Boi do itekan janah ijolom ham ai humbani layar na legan ase langsung hu menu utama.';

  @override
  String get deviceScreenMenuTutorialText => 'On ma layar tampilan. Screen Screen pakon Mode Layar Split iaktifkon secara default janah boi ikonfigurasihon lobih bagas bani pengaturan.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Pindahkon ma jari-jari ni tanganmu i sekitarni roda Klik laho menyesuaihon volume .';

  @override
  String get centerButtonNowPlayingTutorialText => 'Tekan ma tombol Pusat laho marsepeda marhitei bar mangindahi bar, scrubber bar pakon sliffer sliffer. Tekan janah jolom ma tombol Pusat laho mangakses pilihan tambahan.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Tekan janah tahan ma tombol on ase podas hu lobei doding ai .';

  @override
  String get previousButtonNowPlayingTutorialText => 'Tekan janah jolom ma tombol on laho mambahen ulang doding ai .';

  @override
  String get deviceControlSearchTutorialText => 'Pindahkon ma jari-jari ni tanganmu ringan-ringan i sekitar Wheel Klik laho pataridahkon albeet .';

  @override
  String get centerButtonSearchTutorialText => 'Tekan ma tombol pusat laho mamilih alfabet na isorot .';

  @override
  String get nextButtonSearchTutorialText => 'Tekan ma tombol on laho manambah ruang .';

  @override
  String get previousButtonSearchTutorialText => 'Tekan ma tombol on laho manghapus karakter na parpudi .';

  @override
  String get menuButtonSearchTutorialText => 'Tekan ma tombol on laho manutup keyboard janah marinteraksi pakon hasil pencarian .';
}
