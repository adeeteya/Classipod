// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Balinese (`ban`).
class AppLocalizationsBan extends AppLocalizations {
  AppLocalizationsBan([String locale = 'ban']) : super(locale);

  @override
  String get appTitle => 'ClassiPod';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle => 'Izin Akses Audio Sane Kaperluang';

  @override
  String get audioAccessPermissionContent =>
      'Ngiring ngicenin file audio mangda prasida titiang muter file musik semetone.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Izin Akses Audio Kaceritayang';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Ngiring ngicenin file audio akses antuk aplikasi puniki ring setélan piranti mangda prasida tiang muter file musik Sametoné.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Musik';

  @override
  String get nowPlayingScreenTitle => 'Mangkin maplalian';

  @override
  String get shuffleSongsMenuTitle => 'Gending-gending';

  @override
  String get shuffleSettingTitle => 'Barat';

  @override
  String get settingsScreenTitle => 'Setelan';

  @override
  String get aboutScreenTitle => 'Indik';

  @override
  String get coverFlowScreenTitle => 'Selamat penutup';

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
      other: '$countString gending',
      one: '1 gendingan',
      zero: 'tan wénten tembang',
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
      zero: 'tan wénten album',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Jemeton';

  @override
  String get genreSongsScreenTitle => 'Genre Gending-gending';

  @override
  String get deviceColorSettingTitle => 'Warna Piranti';

  @override
  String get touchScreenSettingTitle => 'Titik Layar Kaaktifang';

  @override
  String get repeatModeSettingTitle => 'Ngulangin';

  @override
  String get repeatModeOne => 'Siki';

  @override
  String get repeatModeAll => 'Samian';

  @override
  String get vibrateSettingTitle => 'Memenggalanin';

  @override
  String get clickWheelSettingTitle => 'Klik Suara Roda';

  @override
  String get splitScreenSettingTitle => 'Mode Layar sané sampun nglimbak';

  @override
  String get touchSoundsDialogTitle => 'Suara';

  @override
  String get touchSoundsDialogContent =>
      'Ngiring Ngawinang Suara Touch saking Setelan Sistem mangda mirengang suara roda klik';

  @override
  String get immersiveModeSettingTitle => 'Mode sané becik';

  @override
  String get showAppTutorialSettingTitle => 'Tampilang Tutorial';

  @override
  String get changeDirectorySettingTitle => 'Direktori perubahan';

  @override
  String get donateSettingTitle => 'Nyumbang';

  @override
  String get donateSettingDescription =>
      'Yening semeton seneng sareng aplikasi puniki, durusang timbangin nyumbang.';

  @override
  String get versionAboutScreenTitle => 'Pérsi';

  @override
  String get madeWithLoveTitle => 'Kakaryanin antuk ❤️ olih .';

  @override
  String get noMusicFilesFound => 'Nenten wenten Musik';

  @override
  String get noArtistsFound => 'Nenten wenten Seniman';

  @override
  String get noAlbumsFound => 'Tan wenten Album';

  @override
  String get unknownSong => 'Kidung Tan kauningin';

  @override
  String get unknownArtist => 'Seniman sane nenten kauningin';

  @override
  String get unknownAlbum => 'Album Tan kauningin';

  @override
  String get unknownGenre => 'General sane nenten kauningin';

  @override
  String get buttonConfirmText => 'INGGIH';

  @override
  String get tileValueOn => 'Ring';

  @override
  String get tileValueOff => 'Mati';

  @override
  String get commonOfText => ';';

  @override
  String get pageNotFoundText => 'Laman sané kaicenin nénten kapanggihin';

  @override
  String get commonErrorText => 'Éror';

  @override
  String get retryButtonText => 'Selamé';

  @override
  String get filePickerDialogTitle => 'Pilih Direktori ring Scan antuk Musik';

  @override
  String get searchScreenTitle => 'Ngalih';

  @override
  String get searchEmptyText => 'Tan wenten pikolih Panyliksikan';

  @override
  String get searchResultsText => 'Pikolih Sliksik:';

  @override
  String get resultsForText => 'Pikolih sane kaanggen:';

  @override
  String get disableBatteryOptimizationTitle => 'Optimasi Baterai Nonaktifang';

  @override
  String get disableBatteryOptimizationContent =>
      'Durusang optimasi baterai antuk aplikasi puniki ring setélan piranti mangda prasida ngamargiang pamuteran latar belakang musik.';

  @override
  String get languageScreenTitle => 'Basa';

  @override
  String get silverDeviceColor => 'Selaka';

  @override
  String get blackDeviceColor => 'Selem';

  @override
  String get resetSettingsTitle => 'Atur malih Setelan';

  @override
  String get browseArtist => 'Palajahin Seniman';

  @override
  String get browseAlbum => 'Jlahjah Album';

  @override
  String get cancelText => 'Batalang';

  @override
  String get playlistsScreenTitle => 'Daftar muter';

  @override
  String get addToOnTheGoPlaylist => 'Wewehin ring On-As-Go';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Wewehin Album ring On-Tong';

  @override
  String get removeSongFromThePlaylist => 'Icalang saking daftar Puter';

  @override
  String get allAlbums => 'Makasami Album';

  @override
  String get scanningMusicFiles => 'Berkas Musik Scanning';

  @override
  String get newPlaylist => 'Daftar Maplalian anyar';

  @override
  String get savePlaylist => 'Simpen daftar Putra';

  @override
  String get clearPlaylist => 'Daftar Maplalianan';

  @override
  String get rescanMusicFilesSettingTitle => 'Berkas Musik Rescan';

  @override
  String get deviceControlMenuTutorialText =>
      'Pindahang jempol semetone enteng-enteng ring sekitar Klik Roda mangda prasida navigasi menu';

  @override
  String get centerButtonMenuTutorialText =>
      'Teken tombol tengah anggén milih item menu sané kasorot';

  @override
  String get playPauseMenuTutorialText =>
      'Teken tombol puniki anggén muter utawi jeda tembang';

  @override
  String get nextButtonMenuTutorialText =>
      'Teken tombol puniki mangda skip ring lagu selanturnyané';

  @override
  String get previousButtonMenuTutorialText =>
      'Teken tombol puniki mangda prasida mundur utawi mawali ring tembang sadurungnyane';

  @override
  String get menuButtonTutorialText =>
      'Teken tombol puniki mangda mawali ka menu sané sampun lintang. Sameton prasida neken lan nahan saking layar tiosan mangda langsung nuju menu utama.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Puniki layar tampilan. Touch Layar lan Mode Layar Split kaaktifang manut default lan prasida kakonfigurasi salanturnyane ring setting.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Pindahang jempol ring sawewengkon Roda Klik mangda prasida nyesuaiang volume';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Teken tombol Pusat mangda prasida masepeda ring ngrereh bar, bar scrubber lan slider sliffle. Teken lan tahan tombol Pusat mangda prasida ngakses opsi tambahan.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Teken lan tahan tombol puniki mangda gelis maju lagu';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Teken lan tahan tombol puniki mangda prasida mundur tembang punika';

  @override
  String get deviceControlSearchTutorialText =>
      'Pindahang jempol semetone enteng-enteng ring sawewengkon Roda .';

  @override
  String get centerButtonSearchTutorialText =>
      'Teken tombol tengah anggén milih aksara sané kasorot';

  @override
  String get nextButtonSearchTutorialText =>
      'Teken tombol puniki anggén nambahin genah';

  @override
  String get previousButtonSearchTutorialText =>
      'Teken tombol puniki anggén ngicalang karakter sané kaping untat';

  @override
  String get menuButtonSearchTutorialText =>
      'Teken tombol puniki anggén nutup papan ketik lan berinteraksi sareng hasil panyliksikan';

  @override
  String get allSongs => 'Saluiring Kidung';
}
