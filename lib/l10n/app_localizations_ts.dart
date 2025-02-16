// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tsonga (`ts`).
class AppLocalizationsTs extends AppLocalizations {
  AppLocalizationsTs([String locale = 'ts']) : super(locale);

  @override
  String get appTitle => 'Xihlawuhlawu xa xiyimo xa le henhla';

  @override
  String get menuButtonText => 'Menyu';

  @override
  String get audioAccessPermissionTitle => 'Mpfumelelo wo nghena hi mpfumawulo wa laveka';

  @override
  String get audioAccessPermissionContent => 'Hi kombela u nyika tifayela ta mpfumawulo ku nghena ku hi pfumelela ku tlanga tifayela ta wena ta vuyimbeleri.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Mpfumelelo wo nghena eka mpfumawulo wu ariwile';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Hi kombela u nyika tifayele ta mpfumawulo mfikelelo wa app leyi eka swiletelo swa xitirhisiwa ku hi pfumelela ku tlanga tifayela ta wena ta vuyimbeleri.';

  @override
  String get menuScreenTitle => 'Menyu';

  @override
  String get musicMenuScreenTitle => 'Vuyimbeleri';

  @override
  String get nowPlayingScreenTitle => 'Sweswi ku tlanga';

  @override
  String get shuffleSongsMenuTitle => 'Shuffle Songs';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Swiyimiso';

  @override
  String get aboutScreenTitle => 'Hi';

  @override
  String get coverFlowScreenTitle => 'Ku khuluka ka xifunengeto';

  @override
  String get artistsScreenTitle => 'Vatsari va swifaniso';

  @override
  String get albumsScreenTitle => 'Tialbamu';

  @override
  String get songsScreenTitle => 'Tinsimu';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Tinsimu',
      one: '1 risimu',
      zero: 'ku hava tinsimu',
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
      other: '$countString Tialibamu',
      one: '1 alibamu',
      zero: 'ku hava tialibamu',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Tinxaka ta swifaniso';

  @override
  String get genreSongsScreenTitle => 'Tinsimu ta Genre';

  @override
  String get deviceColorSettingTitle => 'Muhlovo wa xitirhisiwa';

  @override
  String get touchScreenSettingTitle => 'Xikirini xo khumba xi pfuriwile';

  @override
  String get repeatModeSettingTitle => 'Vuyelela';

  @override
  String get repeatModeOne => 'N\'we';

  @override
  String get repeatModeAll => 'Hinkwaswo';

  @override
  String get vibrateSettingTitle => 'Vibrate';

  @override
  String get clickWheelSettingTitle => 'Click mimpfumawulo ya mavhilwa';

  @override
  String get splitScreenSettingTitle => 'Mode ya Xikirini lexi avanaka';

  @override
  String get touchSoundsDialogTitle => 'Mimpfumawulo yo khumba';

  @override
  String get touchSoundsDialogContent => 'Hi kombela u pfumelela ku khumba mimpfumawulo ku suka eka swiyimiso swa sisiteme ku twa mimpfumawulo ya click wheel';

  @override
  String get immersiveModeSettingTitle => 'Mode yo nyuperisa';

  @override
  String get showAppTutorialSettingTitle => 'Dyondzo ya nkombiso';

  @override
  String get changeDirectorySettingTitle => 'Xikombo xa Cinca';

  @override
  String get donateSettingTitle => 'Nyikela';

  @override
  String get donateSettingDescription => 'Loko u tsakela app leyi, hi kombela u ehleketa ku nyikela.';

  @override
  String get versionAboutScreenTitle => 'Nkandziyiso';

  @override
  String get madeWithLoveTitle => 'Yi endliwe hi ❤️ hi';

  @override
  String get noMusicFilesFound => 'Ku hava vuyimbeleri';

  @override
  String get noArtistsFound => 'Ku hava vayimbeleri va swifaniso';

  @override
  String get noAlbumsFound => 'Ku hava tialbamu';

  @override
  String get unknownSong => 'Risimu leri nga tiviwiki';

  @override
  String get unknownArtist => 'Mutshila loyi a nga tiviwiki';

  @override
  String get unknownAlbum => 'Album leyi nga tiviwiki';

  @override
  String get unknownGenre => 'Genre leyi nga tiviwiki';

  @override
  String get buttonConfirmText => 'LULAMILE';

  @override
  String get tileValueOn => 'Eka';

  @override
  String get tileValueOff => 'Timile';

  @override
  String get commonOfText => 'ya';

  @override
  String get pageNotFoundText => 'Tluka leri nyikiweke a ri kumekanga';

  @override
  String get commonErrorText => 'Xihoxo';

  @override
  String get retryButtonText => 'Ku ringeta nakambe';

  @override
  String get filePickerDialogTitle => 'Hlawula xikombo xo skena vuyimbeleri';

  @override
  String get searchScreenTitle => 'Secha';

  @override
  String get searchEmptyText => 'Ku hava vuyelo bya ku lavisisa';

  @override
  String get searchResultsText => 'Vuyelo bya ku lavisisa:';

  @override
  String get resultsForText => 'Vuyelo bya:';

  @override
  String get disableBatteryOptimizationTitle => 'Ku tshikisa ku antswisiwa ka betri';

  @override
  String get disableBatteryOptimizationContent => 'Hi kombela u tshikisa ku antswisiwa ka betri eka app leyi eka swiyimiso swa xitirhisiwa ku pfumelela ku tlanga ka le ndzhaku ka vuyimbeleri.';

  @override
  String get languageScreenTitle => 'Ririmi';

  @override
  String get silverDeviceColor => 'Silivhere';

  @override
  String get blackDeviceColor => 'Ntima';

  @override
  String get resetSettingsTitle => 'Seta swiyimiso swa ku tlhela u veka';

  @override
  String get browseArtist => 'Browse Artist';

  @override
  String get browseAlbum => 'Browse Album';

  @override
  String get cancelText => 'Khansela';

  @override
  String get playlistsScreenTitle => 'Minxaxamelo ya swichayachayana';

  @override
  String get addToOnTheGoPlaylist => 'Engetelani eka on-the-go';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Engetela album eka on-the-go';

  @override
  String get removeSongFromThePlaylist => 'Susa eka nxaxamelo wa swichayachayana';

  @override
  String get allAlbums => 'Tialbamu hinkwato';

  @override
  String get scanningMusicFiles => 'Ku skena tifayela ta vuyimbeleri';

  @override
  String get newPlaylist => 'Nxaxamelo wa swichayachayana leswintshwa';

  @override
  String get savePlaylist => 'Hlayisa nxaxamelo wa swichayachayana';

  @override
  String get clearPlaylist => 'Nxaxamelo wa swichayachayana leswi nga erivaleni';

  @override
  String get rescanMusicFilesSettingTitle => 'Tifayili ta vuyimbeleri bya Rescan';

  @override
  String get deviceControlMenuTutorialText => 'Susa xikunwana xa wena hi ku olova ku rhendzela vhilwa ro tsindziyela leswaku u famba-famba eka menyu';

  @override
  String get centerButtonMenuTutorialText => 'Cinekela buti ya le xikarhi ku hlawula nchumu wa menyu lowu kombisiweke';

  @override
  String get playPauseMenuTutorialText => 'Cinekela button leyi ku tlanga kumbe ku yimisa risimu';

  @override
  String get nextButtonMenuTutorialText => 'Cinekela button leyi ku skipa eka risimu leri landzelaka';

  @override
  String get previousButtonMenuTutorialText => 'Cinekela button leyi ku rewind kutani u tlhelela eka risimu leri hundzeke';

  @override
  String get menuButtonTutorialText => 'Cinekela button leyi ku tlhelela eka menu leyi hundzeke. U nga ha yi tshikilela u yi khoma ku suka eka xikirini xin’wana ni xin’wana leswaku u ya eka menyu leyikulu hi ku kongoma.';

  @override
  String get deviceScreenMenuTutorialText => 'Lexi i xikirini xa nkombiso. Touch Screen na Split Screen mode swi tirhisiwa hi ku tiyimisela naswona swi nga lulamisiwa ku ya emahlweni eka swiyimiso.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Susa xikunwana xa wena ku rhendzela vhilwa ra Click ku lulamisa vholumo';

  @override
  String get centerButtonNowPlayingTutorialText => 'Cinekela button ya le xikarhi ku rhendzeleka hi seek bar, scrubber bar na shuffle slider. Cinekela u khoma buti ya le xikarhi ku fikelela swihlawulekisi swo engetela.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Cinekela u khoma button leyi ku fast forward risimu';

  @override
  String get previousButtonNowPlayingTutorialText => 'Cinekela u khoma button leyi ku rewind risimu';

  @override
  String get deviceControlSearchTutorialText => 'Susa xikunwana xa wena hi ku olova ku rhendzela vhilwa ra ku tsindziyela leswaku u kombisa maletere';

  @override
  String get centerButtonSearchTutorialText => 'Cinekela eka buti ya le xikarhi ku hlawula alifabete leyi kombisiweke';

  @override
  String get nextButtonSearchTutorialText => 'Cinekela button leyi ku engetela ndhawu';

  @override
  String get previousButtonSearchTutorialText => 'Cinekela button leyi ku susa xihlawulekisi xo hetelela';

  @override
  String get menuButtonSearchTutorialText => 'Cinekela button leyi ku pfala khibhodi na ku tirhisana na mbuyelo wa ku lavisisa';
}
