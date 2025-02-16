// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Minangkabau (`min`).
class AppLocalizationsMin extends AppLocalizations {
  AppLocalizationsMin([String locale = 'min']) : super(locale);

  @override
  String get appTitle => 'KlassipsiPod';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle => 'Izin Akses Audio Diparalukan';

  @override
  String get audioAccessPermissionContent => 'Silakan agiah file audio akses untuak mamungkinkan kami untuak mamainkan file musik Sanak.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Izin Akses Audio Disarahkan';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Silakan agiah file audio akses untuak aplikasi ko di pangaturan perangkat untuak mamungkinkan kami untuak mamainkan file musik Sanak.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Musik';

  @override
  String get nowPlayingScreenTitle => 'Kini Main';

  @override
  String get shuffleSongsMenuTitle => 'Lagu Rantiang';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Pangaturan';

  @override
  String get aboutScreenTitle => 'Tantang';

  @override
  String get coverFlowScreenTitle => 'Tutuik Aliran';

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
      zero: 'Indak ado lagu',
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
      zero: 'Indak ado Album',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Jeruk';

  @override
  String get genreSongsScreenTitle => 'Lagu-lagu Genre';

  @override
  String get deviceColorSettingTitle => 'Warno Perangkat';

  @override
  String get touchScreenSettingTitle => 'Layar Sentuh Diaktifkan';

  @override
  String get repeatModeSettingTitle => 'Ulangi';

  @override
  String get repeatModeOne => 'Ciek';

  @override
  String get repeatModeAll => 'Kasadoan';

  @override
  String get vibrateSettingTitle => 'Getaran';

  @override
  String get clickWheelSettingTitle => 'Klik Suaro Roda';

  @override
  String get splitScreenSettingTitle => 'Mode Layar Pacahan';

  @override
  String get touchSoundsDialogTitle => 'Tadanga sentuhan';

  @override
  String get touchSoundsDialogContent => 'Silakan Aktifkan Suaro dari Pangaturan Sistem untuak mandanga bunyi roda klik .';

  @override
  String get immersiveModeSettingTitle => 'Mode Pahala';

  @override
  String get showAppTutorialSettingTitle => 'Tunjuakkan Tutorial';

  @override
  String get changeDirectorySettingTitle => 'Direktori Parubahan';

  @override
  String get donateSettingTitle => 'Sumbang';

  @override
  String get donateSettingDescription => 'Kalau sanak suko jo app ko, silakan pertimbangkan untuak manyumbang.';

  @override
  String get versionAboutScreenTitle => 'Persi';

  @override
  String get madeWithLoveTitle => 'Dibuek jo ❤️ dek';

  @override
  String get noMusicFilesFound => 'Indak Musik';

  @override
  String get noArtistsFound => 'Indak ado Artis';

  @override
  String get noAlbumsFound => 'Indak ado Album';

  @override
  String get unknownSong => 'Lagu nan indak dikenal';

  @override
  String get unknownArtist => 'Artis nan indak dikenal';

  @override
  String get unknownAlbum => 'Indak dikatahui Album';

  @override
  String get unknownGenre => 'Indak dikenal Genre';

  @override
  String get buttonConfirmText => 'JADIH';

  @override
  String get tileValueOn => 'Pado';

  @override
  String get tileValueOff => 'Pudua';

  @override
  String get commonOfText => 'dari';

  @override
  String get pageNotFoundText => 'Laman nan diagiah indak basuo .';

  @override
  String get commonErrorText => 'Kasilapan';

  @override
  String get retryButtonText => 'Uriman';

  @override
  String get filePickerDialogTitle => 'Piliah Direktori untuak Scan untuak Musik';

  @override
  String get searchScreenTitle => 'Manari';

  @override
  String get searchEmptyText => 'Indak ado Hasil Pancarian';

  @override
  String get searchResultsText => 'Hasil Pancarian:';

  @override
  String get resultsForText => 'Hasil untuak:';

  @override
  String get disableBatteryOptimizationTitle => 'Nonaktifkan Optimasi Baterai';

  @override
  String get disableBatteryOptimizationContent => 'Silakan nonaktifkan optimasi baterai untuak aplikasi ko dalam pangaturan perangkat untuak mamungkinkan pamutaran latar balakang musik.';

  @override
  String get languageScreenTitle => 'Bahaso';

  @override
  String get silverDeviceColor => 'Perak';

  @override
  String get blackDeviceColor => 'Itam';

  @override
  String get resetSettingsTitle => 'Pangaturan Reset';

  @override
  String get browseArtist => 'Artis Jatuah';

  @override
  String get browseAlbum => 'Jelajahi Album';

  @override
  String get cancelText => 'Bata';

  @override
  String get playlistsScreenTitle => 'Daflis';

  @override
  String get addToOnTheGoPlaylist => 'Tambahkan ka On-Go';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Tambahkan Album ka-The-Go';

  @override
  String get removeSongFromThePlaylist => 'Kaluakan dari daftar Play .';

  @override
  String get allAlbums => 'Sadonyo Album';

  @override
  String get scanningMusicFiles => 'Berkas Musik Pandali';

  @override
  String get newPlaylist => 'Baru Playlist';

  @override
  String get savePlaylist => 'Simpan Main Daftar';

  @override
  String get clearPlaylist => 'Daftar Main Jaleh';

  @override
  String get rescanMusicFilesSettingTitle => 'File Musik Reskan';

  @override
  String get deviceControlMenuTutorialText => 'Pindahkan jari tunjuak ringan di sakitar Klik Roda untuak manavigasi menu .';

  @override
  String get centerButtonMenuTutorialText => 'Takan tombol tangah untuak mamiliah item menu nan disorot .';

  @override
  String get playPauseMenuTutorialText => 'Takan tombol ko untuak mamuta atau pause lagu .';

  @override
  String get nextButtonMenuTutorialText => 'Takan tombol ko untuak skip ka lagu barikuiknyo';

  @override
  String get previousButtonMenuTutorialText => 'Takan tombol ko untuak mundur atau babaliak ka lagu sabalunnyo .';

  @override
  String get menuButtonTutorialText => 'Takan tombol ko untuak babaliak ka menu sabalunnyo. Sanak bisa manekan dan mamaciknyo dari layar lain untuak langsuang pai ka menu utamo.';

  @override
  String get deviceScreenMenuTutorialText => 'Iko adolah layar tampilan. Mode Layar jo Layar Pacahan diaktifkan dek default dan dapek dikonfigurasi labiah lanjuik dalam pangaturan.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Pindahkan jari tunjuak di sakitar Klik Roda untuak manyasuaian volume .';

  @override
  String get centerButtonNowPlayingTutorialText => 'Takan tombol Pusat untuak basepeda malalui mancari batang, batang scrubber jo slider asok. Takan jo tahan tombol Pusat untuak maakses pilihan tambahan.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Takan jo tahan tombol ko untuak kancang maju lagu .';

  @override
  String get previousButtonNowPlayingTutorialText => 'Takan jo tahan tombol ko untuak malapehan lagu .';

  @override
  String get deviceControlSearchTutorialText => 'Pindahkan jari tunjuak ringan di sakitar Klik Roda untuak manyoroti abjad .';

  @override
  String get centerButtonSearchTutorialText => 'Takan tombol tangah untuak mamiliah abjad nan disorot .';

  @override
  String get nextButtonSearchTutorialText => 'Takan tombol ko untuak manambah ruang';

  @override
  String get previousButtonSearchTutorialText => 'Takan tombol ko untuak maapuih karakter tarakhia .';

  @override
  String get menuButtonSearchTutorialText => 'Takan tombol ko untuak manutup keyboard jo bainteraksi jo hasil pancarian .';
}
