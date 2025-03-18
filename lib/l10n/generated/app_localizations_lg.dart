// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ganda Luganda (`lg`).
class AppLocalizationsLg extends AppLocalizations {
  AppLocalizationsLg([String locale = 'lg']) : super(locale);

  @override
  String get appTitle => 'Classipod .';

  @override
  String get menuButtonText => 'Menu .';

  @override
  String get audioAccessPermissionTitle =>
      'Olukusa lw’okuyingira mu maloboozi lwetaagisa .';

  @override
  String get audioAccessPermissionContent =>
      'Nsaba okuwa Audio Files Access okutusobozesa okukuba fayiro zo ez\'ennyimba.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Olukusa lw\'okuyingira mu ddoboozi olugaaniddwa .';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Nsaba owe fayiro z’amaloboozi okuyingira ku pulogulaamu eno mu nteekateeka z’ekyuma okutusobozesa okukuba fayiro zo ez’ennyimba.';

  @override
  String get menuScreenTitle => 'Menu .';

  @override
  String get musicMenuScreenTitle => 'Ennyimba';

  @override
  String get nowPlayingScreenTitle => 'Kati okuzannya .';

  @override
  String get shuffleSongsMenuTitle => 'Ennyimba za Shuffle .';

  @override
  String get shuffleSettingTitle => 'Shuffle .';

  @override
  String get settingsScreenTitle => 'Enteekateeka .';

  @override
  String get aboutScreenTitle => 'Ku';

  @override
  String get coverFlowScreenTitle => 'Ebibikka okukulukuta .';

  @override
  String get artistsScreenTitle => 'Abayimbi .';

  @override
  String get albumsScreenTitle => 'Ebitabo .';

  @override
  String get songsScreenTitle => 'Ennyimba .';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ennyimba',
      one: '1 oluyimba',
      zero: 'Tewali nnyimba',
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
      one: '1 Olutambi',
      zero: 'Tewali Albums',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'ebika .';

  @override
  String get genreSongsScreenTitle => 'Ennyimba za Genre .';

  @override
  String get deviceColorSettingTitle => 'Langi y\'ekyuma .';

  @override
  String get touchScreenSettingTitle => 'Touch Screen ekoleddwa .';

  @override
  String get repeatModeSettingTitle => 'Okuddamu';

  @override
  String get repeatModeOne => 'Emu';

  @override
  String get repeatModeAll => 'Onna';

  @override
  String get vibrateSettingTitle => 'okukankana .';

  @override
  String get clickWheelSettingTitle => 'Nywa ku maloboozi ga Wheel .';

  @override
  String get splitScreenSettingTitle => 'Split Screen Mode .';

  @override
  String get touchSoundsDialogTitle => 'Amaloboozi g\'okukwatako .';

  @override
  String get touchSoundsDialogContent =>
      'Nkusaba okusobozesa amaloboozi g\'okukwata okuva mu nteekateeka z\'enkola okuwulira amaloboozi ga Click Wheel .';

  @override
  String get immersiveModeSettingTitle => 'Omutindo gw\'okunnyika .';

  @override
  String get showAppTutorialSettingTitle => 'Laga okuyigiriza .';

  @override
  String get changeDirectorySettingTitle => 'Enkyukakyuka mu ndagiriro .';

  @override
  String get donateSettingTitle => 'Okugaba';

  @override
  String get donateSettingDescription =>
      'Bwoba oyagala app eno, nsaba olowooze ku kuwaayo.';

  @override
  String get versionAboutScreenTitle => 'Ekika';

  @override
  String get madeWithLoveTitle => 'Ekoleddwa ne ❤️ nga .';

  @override
  String get noMusicFilesFound => 'Tewali muziki .';

  @override
  String get noArtistsFound => 'Tewali bayimbi .';

  @override
  String get noAlbumsFound => 'Tewali Alubaamu .';

  @override
  String get unknownSong => 'Oluyimba olutamanyiddwa .';

  @override
  String get unknownArtist => 'Omuyimbi atamanyiddwa .';

  @override
  String get unknownAlbum => 'Alubaamu etamanyiddwa .';

  @override
  String get unknownGenre => 'Omuzannyo ogutamanyiddwa .';

  @override
  String get buttonConfirmText => 'KALE';

  @override
  String get tileValueOn => 'Ku';

  @override
  String get tileValueOff => 'Tekuli';

  @override
  String get commonOfText => '-a';

  @override
  String get pageNotFoundText => 'Omuko ogwaweebwa tegwasangibwa .';

  @override
  String get commonErrorText => 'Ensobi';

  @override
  String get retryButtonText => 'Ddamu okugezaako .';

  @override
  String get filePickerDialogTitle =>
      'Londa ekitabo ky\'ogenda okukebera ennyimba .';

  @override
  String get searchScreenTitle => 'Okunoonya';

  @override
  String get searchEmptyText => 'Tewali bivudde mu kunoonyereza';

  @override
  String get searchResultsText => 'Ebivudde mu kunoonyereza:';

  @override
  String get resultsForText => 'Ebivudde mu kunoonyereza kwa:';

  @override
  String get disableBatteryOptimizationTitle => 'Lemesa okulongoosa bbaatule .';

  @override
  String get disableBatteryOptimizationContent =>
      'Nsaba okulemesa okulongoosa bbaatule ku pulogulaamu eno mu nteekateeka z\'ekyuma okusobozesa okukuba omuziki emabega.';

  @override
  String get languageScreenTitle => 'Olulimi';

  @override
  String get silverDeviceColor => 'Effeeza';

  @override
  String get blackDeviceColor => 'Obuddugavu';

  @override
  String get resetSettingsTitle => 'Okuddamu okuteekawo ensengeka .';

  @override
  String get browseArtist => 'Omuyimbi wa Browse .';

  @override
  String get browseAlbum => 'Browse Olutambi .';

  @override
  String get cancelText => 'okusazaamu';

  @override
  String get playlistsScreenTitle => 'Enkalala z\'emizannyo .';

  @override
  String get addToOnTheGoPlaylist => 'Add to on-the-go .';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Yongera album ku on-the-go .';

  @override
  String get removeSongFromThePlaylist => 'Ggyawo okuva mu playlist .';

  @override
  String get allAlbums => 'Album zonna .';

  @override
  String get scanningMusicFiles => 'Fayiro z\'ennyimba ezisika .';

  @override
  String get newPlaylist => 'Olukalala lw\'okuyimba olupya .';

  @override
  String get savePlaylist => 'Teeka playlist .';

  @override
  String get clearPlaylist => 'clear playlist .';

  @override
  String get rescanMusicFilesSettingTitle => 'Fayiro z\'ennyimba za Rescan .';

  @override
  String get deviceControlMenuTutorialText =>
      'Tambuza engalo yo ensajja mu ngeri etali ya maanyi ku nnamuziga y’okunyiga okutambula mu menu .';

  @override
  String get centerButtonMenuTutorialText =>
      'Nywa ku bbaatuuni ya Centre okulonda ekintu kya menu .';

  @override
  String get playPauseMenuTutorialText =>
      'Nywa ku bbaatuuni eno okukuba oba okuyimiriza oluyimba .';

  @override
  String get nextButtonMenuTutorialText =>
      'Nywa ku bbaatuuni eno okubuuka ku luyimba oluddako .';

  @override
  String get previousButtonMenuTutorialText =>
      'Nywa ku bbaatuuni eno okudda emabega oba okuddayo ku luyimba oluyise .';

  @override
  String get menuButtonTutorialText =>
      'Nywa ku bbaatuuni eno okudda ku menu eyasooka. Oyinza okuginyiga n’ogikwata okuva ku screen endala yonna okugenda butereevu ku menu enkulu.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Eno ye screen y’okulaga. Touch Screen ne Split Screen Mode zikolebwa nga bwe zibeera era zisobola okusengekebwa okwongera mu nteekateeka.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Tambuza engalo yo ennene ku nnamuziga y’okunyiga okutereeza eddoboozi .';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Nywa ku bbaatuuni ya wakati okuvuga okuyita mu bbaala ya Seek, Scrubber Bar ne Shuffle Slider. Nywa era onyige bbaatuuni ya wakati okusobola okufuna eby’okulonda ebirala.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Nywa era onyige button eno okusiiba mu maaso oluyimba .';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Nywa era onyige button eno okuddamu okuvuga oluyimba .';

  @override
  String get deviceControlSearchTutorialText =>
      'Tambuza engalo yo ensajja mu ngeri etali ya maanyi ku nnamuziga y’okunyiga okulaga ennukuta .';

  @override
  String get centerButtonSearchTutorialText =>
      'Nywa ku bbaatuuni ya wakati okulonda ennukuta ezisiddwaako akabonero .';

  @override
  String get nextButtonSearchTutorialText =>
      'Nywa ku bbaatuuni eno okwongerako ekifo .';

  @override
  String get previousButtonSearchTutorialText =>
      'Nywa ku bbaatuuni eno okusazaamu ennukuta esembayo .';

  @override
  String get menuButtonSearchTutorialText =>
      'Nywa ku bbaatuuni eno okuggalawo keyboard era okwatagane n’ebivudde mu kunoonyereza .';

  @override
  String get allSongs => 'Ennyimba zonna .';
}
