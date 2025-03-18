// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Makasar (`mak`).
class AppLocalizationsMak extends AppLocalizations {
  AppLocalizationsMak([String locale = 'mak']) : super(locale);

  @override
  String get appTitle => 'Klasifikasi';

  @override
  String get menuButtonText => 'Melkila';

  @override
  String get audioAccessPermissionTitle => 'Audio Akses Permintaan Permisi .';

  @override
  String get audioAccessPermissionContent =>
      'Punna rie\' tau a\'ra\' a\'lampa, a\'kulleji a\'lampa a\'pilajarang file audio sollanna a\'kulle nisare file musiknu.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Audio Akses Permintaan Nipantamaki .';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Punna rie\' tau a\'ra\' a\'lampa, a\'lampami mange ri se\'reang pa\'rasangang maraeng.';

  @override
  String get menuScreenTitle => 'Bile';

  @override
  String get musicMenuScreenTitle => 'Musi';

  @override
  String get nowPlayingScreenTitle => 'Kamma-kamma anne a’lampama';

  @override
  String get shuffleSongsMenuTitle => 'Suffle Songs';

  @override
  String get shuffleSettingTitle => 'Shubs';

  @override
  String get settingsScreenTitle => 'a\'lampai';

  @override
  String get aboutScreenTitle => 'Injo hubbu';

  @override
  String get coverFlowScreenTitle => 'Tutui';

  @override
  String get artistsScreenTitle => 'Seni';

  @override
  String get albumsScreenTitle => 'Agget';

  @override
  String get songsScreenTitle => 'tali';

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
      zero: 'Tena lagu',
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
      zero: 'Tena Albums',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Jender';

  @override
  String get genreSongsScreenTitle =>
      'Nampa nasuromi ke’nanga a’lampa mange ri Genre.';

  @override
  String get deviceColorSettingTitle => 'Perangkat';

  @override
  String get touchScreenSettingTitle => 'Layar Niukiriki Layar';

  @override
  String get repeatModeSettingTitle => 'Angngulang';

  @override
  String get repeatModeOne => 'Se\'re';

  @override
  String get repeatModeAll => 'Iya ngaseng';

  @override
  String get vibrateSettingTitle => 'Kejam';

  @override
  String get clickWheelSettingTitle => 'Klikmi Suara Roda .';

  @override
  String get splitScreenSettingTitle => 'Mode Layar Split';

  @override
  String get touchSoundsDialogTitle => 'Ana’-ana’na Auch';

  @override
  String get touchSoundsDialogContent =>
      'Punna rie\' tau a\'ra\' a\'lampa, a\'kulleji a\'lampa battu ri Sistem Settings untu\' allangngere\'i sa\'ra roda klik .';

  @override
  String get immersiveModeSettingTitle => 'Mode Immersif';

  @override
  String get showAppTutorialSettingTitle => 'Pappicinikang Tutori';

  @override
  String get changeDirectorySettingTitle => 'Pa’baeng-baeng';

  @override
  String get donateSettingTitle => 'Annyumbang';

  @override
  String get donateSettingDescription =>
      'Punna ero’jako anne appa, pikkiriki baji’-baji’.';

  @override
  String get versionAboutScreenTitle => 'Versi';

  @override
  String get madeWithLoveTitle => 'Nipareki siagang ❤️ ri .';

  @override
  String get noMusicFilesFound => 'No Musu';

  @override
  String get noArtistsFound => 'Tena na';

  @override
  String get noAlbumsFound => 'Tena Almbus';

  @override
  String get unknownSong => 'tanipake';

  @override
  String get unknownArtist => 'Tena na\'kulle';

  @override
  String get unknownAlbum => 'Ban';

  @override
  String get unknownGenre => 'Tena niisse\'i Gren .';

  @override
  String get buttonConfirmText => 'OKE';

  @override
  String get tileValueOn => 'Rinra';

  @override
  String get tileValueOff => 'Mate';

  @override
  String get commonOfText => 'battu';

  @override
  String get pageNotFoundText => 'Anjo halamang nisareanga teai .';

  @override
  String get commonErrorText => 'Kesalahan';

  @override
  String get retryButtonText => 'silahkan';

  @override
  String get filePickerDialogTitle => 'Pilei Direktori ri Skan untu’ Musik .';

  @override
  String get searchScreenTitle => 'Abboya';

  @override
  String get searchEmptyText => 'Tena Hasil Search .';

  @override
  String get searchResultsText => 'Hasil Pa’pilajarang:';

  @override
  String get resultsForText => 'Hasilna untu’:';

  @override
  String get disableBatteryOptimizationTitle => 'Optimisasi Batere Cacat';

  @override
  String get disableBatteryOptimizationContent =>
      'Punna rie\' tau a\'ra\' a\'lampa mange ri balla\'na, a\'lampami mange ri balla\'na.';

  @override
  String get languageScreenTitle => 'Bahasa';

  @override
  String get silverDeviceColor => 'Perak';

  @override
  String get blackDeviceColor => 'Lekleng';

  @override
  String get resetSettingsTitle => 'Pa’baeng-baeng Reset';

  @override
  String get browseArtist => 'Seni Gelrow';

  @override
  String get browseAlbum => 'Almbu';

  @override
  String get cancelText => 'Cmbatalkan';

  @override
  String get playlistsScreenTitle => 'Janjikan';

  @override
  String get addToOnTheGoPlaylist => 'Tambammi ri On-Go-G .';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Tambammi Album ri On-Te-Go .';

  @override
  String get removeSongFromThePlaylist => 'Pasuluki battu ri Playlist .';

  @override
  String get allAlbums => 'Sikontu Allum .';

  @override
  String get scanningMusicFiles => 'Film Musik Scanning';

  @override
  String get newPlaylist => 'Pa’maina beru';

  @override
  String get savePlaylist => 'Sah Play';

  @override
  String get clearPlaylist => 'Sikamma Plalis';

  @override
  String get rescanMusicFilesSettingTitle => 'Reskan Film Musik';

  @override
  String get deviceControlMenuTutorialText =>
      'Pa’jari jari-jarinu ringan ri ampi’na Roda Click untu’ a’lampa mange ri menu .';

  @override
  String get centerButtonMenuTutorialText =>
      'Tete’mi tombol pusa’na untu’ ampilei item menu nisoronga .';

  @override
  String get playPauseMenuTutorialText =>
      'Tete’mi anne tombolka untu’ a’joge’ yareka ampaui se’rea lagu .';

  @override
  String get nextButtonMenuTutorialText =>
      'Tete’mi anne tombolka untu’ a’lampa mange ri lagu ribokoangannaya .';

  @override
  String get previousButtonMenuTutorialText =>
      'Tete’mi anne tombolka untu’ a’jari ammotere’ yareka ammotere’ mange ri lagu rioloa .';

  @override
  String get menuButtonTutorialText =>
      'Tete’mi anne tombolka untu’ ammotere’ mange ri menu rioloa. Ikau akkullei nutekanngi siagang nutahang battu ri layar maraenga untu’ langsung mange ri menu utama.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Iaminjo layar pa’baeng-baenga. Mode Layar Auch siagang Spil Spleen niaki ri default siagang akkullei nikonfigurasi la’bi riolo ri settingang.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Pa’jari jari-jarinu ri ampi’na Weel Click untu’ ampa’jari bajiki anjo volume .';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Tete’mi tombol Pusat untu’ a’jappa-jappa lalang ri barra’ a’boyaya, a’gosok-gosok siagang slider shuffle. Tete’ siagang pa’jagai tombol Pusat untu’ a’lampa mange ri tampa’-tampa’ tambahan.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Tete’ siagang pa’jari anne tombol untu’ ampa’jari bajiki anjo lagua .';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Tete’ siagang pa’jari anne tombolka untu’ ampa’jari ammotere’ anjo lagua .';

  @override
  String get deviceControlSearchTutorialText =>
      'Pa’jari jari-jarinu ringan ri ampi’na Roda Click untu’ ampa’nyatai abjad .';

  @override
  String get centerButtonSearchTutorialText =>
      'Tete’mi tombol pusaka untu’ ampilei abjad nisoronga .';

  @override
  String get nextButtonSearchTutorialText =>
      'Tete’mi anne tombolka untu’ a’jari tampa’.';

  @override
  String get previousButtonSearchTutorialText =>
      'Tete’mi anne tombolka untu’ ampa’le’baki karakter kala’busanga .';

  @override
  String get menuButtonSearchTutorialText =>
      'Tete’mi anne tombolka untu’ antongkoki anjo keyboard siagang a’gau’ baji’ siagang wassele’ pa’boyaang .';

  @override
  String get allSongs => 'Sesa';
}
