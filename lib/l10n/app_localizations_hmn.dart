// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hmong Mong (`hmn`).
class AppLocalizationsHmn extends AppLocalizations {
  AppLocalizationsHmn([String locale = 'hmn']) : super(locale);

  @override
  String get appTitle => 'Chav taw';

  @override
  String get menuButtonText => 'Daim qhia muaj zaub mov li cas';

  @override
  String get audioAccessPermissionTitle => 'Audio Access Tso Cai Xav Tau';

  @override
  String get audioAccessPermissionContent => 'Thov txais cov ntaub ntawv audio kom tso cai rau peb ua si koj cov ntaub ntawv nkauj.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Audio kev nkag tau kev tso cai audio';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Thov txais cov ntaub ntawv audio nkag rau cov app no ​​hauv cov cuab yeej cuab tam tso cai rau peb ua si koj cov ntaub ntawv nkauj.';

  @override
  String get menuScreenTitle => 'Daim qhia muaj zaub mov li cas';

  @override
  String get musicMenuScreenTitle => 'Zaj nkauj';

  @override
  String get nowPlayingScreenTitle => 'Tam sim no ua si';

  @override
  String get shuffleSongsMenuTitle => 'Sholule nkauj';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Chaw teeb tsa';

  @override
  String get aboutScreenTitle => 'Txog';

  @override
  String get coverFlowScreenTitle => 'Npog ntws';

  @override
  String get artistsScreenTitle => 'Ntawv ua yeeb yam';

  @override
  String get albumsScreenTitle => 'Albums';

  @override
  String get songsScreenTitle => 'Nkauj';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Nkauj',
      one: '1 Nkauj',
      zero: 'Nkauj Noog Hawj',
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
      zero: 'Tsis muaj albums',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Neeg';

  @override
  String get genreSongsScreenTitle => 'Cov nkauj tshiab';

  @override
  String get deviceColorSettingTitle => 'Ntaus Xim';

  @override
  String get touchScreenSettingTitle => 'Kov Screen enabled';

  @override
  String get repeatModeSettingTitle => 'Rov hais dua';

  @override
  String get repeatModeOne => 'Ib';

  @override
  String get repeatModeAll => 'Tag nrho';

  @override
  String get vibrateSettingTitle => 'Co';

  @override
  String get clickWheelSettingTitle => 'Nyem lub log log';

  @override
  String get splitScreenSettingTitle => 'Sib cais cov npo hom';

  @override
  String get touchSoundsDialogTitle => 'Kov Suab';

  @override
  String get touchSoundsDialogContent => 'Thov Pab kov Suab los ntawm cov chaw teeb tsa kom hnov ​​cov nias lub suab nrov';

  @override
  String get immersiveModeSettingTitle => 'Cov hom';

  @override
  String get showAppTutorialSettingTitle => 'Qhia Kev Qhia';

  @override
  String get changeDirectorySettingTitle => 'Hloov Cov Ntawv Qhia';

  @override
  String get donateSettingTitle => 'Pub dawb';

  @override
  String get donateSettingDescription => 'Yog tias koj nyiam cov app no, thov txiav txim siab pub nyiaj.';

  @override
  String get versionAboutScreenTitle => 'Zaj';

  @override
  String get madeWithLoveTitle => 'Ua nrog ❤️ los ntawm';

  @override
  String get noMusicFilesFound => 'Tsis muaj nkauj';

  @override
  String get noArtistsFound => 'Tsis muaj neeg ua yeeb yam';

  @override
  String get noAlbumsFound => 'Tsis muaj albums';

  @override
  String get unknownSong => 'Tsis paub zaj nkauj';

  @override
  String get unknownArtist => 'Tsis paub tus kws kos duab';

  @override
  String get unknownAlbum => 'Tsis Paub Cov nkauj';

  @override
  String get unknownGenre => 'Tsis paub hom';

  @override
  String get buttonConfirmText => 'Ua li cas';

  @override
  String get tileValueOn => 'Saum';

  @override
  String get tileValueOff => 'Tawm';

  @override
  String get commonOfText => 'ntawm';

  @override
  String get pageNotFoundText => 'Cov nplooj ntawv muab tsis pom';

  @override
  String get commonErrorText => 'Yuam kev';

  @override
  String get retryButtonText => 'Rov ua';

  @override
  String get filePickerDialogTitle => 'Xaiv cov ntawv qhia kom luam theej duab rau nkauj';

  @override
  String get searchScreenTitle => 'Kev tshawb nrhiav';

  @override
  String get searchEmptyText => 'Tsis muaj kev tshawb fawb';

  @override
  String get searchResultsText => 'Nrhiav tau:';

  @override
  String get resultsForText => 'Cov txiaj ntsig rau:';

  @override
  String get disableBatteryOptimizationTitle => 'Kaw cov roj teeb kev txhim kho';

  @override
  String get disableBatteryOptimizationContent => 'Thov tua cov roj teeb ua kom zoo rau cov app no ​​hauv cov khoom siv ntaus ntawv kom tso cai tom qab cov nkauj playback.';

  @override
  String get languageScreenTitle => 'Yam lus';

  @override
  String get silverDeviceColor => 'Nyiaj';

  @override
  String get blackDeviceColor => 'Xim dub';

  @override
  String get resetSettingsTitle => 'Rov Pib Chaw';

  @override
  String get browseArtist => 'Xauj edist';

  @override
  String get browseAlbum => 'Xauj album';

  @override
  String get cancelText => 'Tshem';

  @override
  String get playlistsScreenTitle => 'Playlists';

  @override
  String get addToOnTheGoPlaylist => 'Ntxiv rau on-the-mus';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Ntxiv album rau on-the-mus';

  @override
  String get removeSongFromThePlaylist => 'Tshem tawm ntawm cov playlist';

  @override
  String get allAlbums => 'Txhua albums';

  @override
  String get scanningMusicFiles => 'Scanning cov ntaub ntawv suab paj nruag cov ntaub ntawv';

  @override
  String get newPlaylist => 'PlayList Tshiab';

  @override
  String get savePlaylist => 'TXUAG Playlist';

  @override
  String get clearPlaylist => 'Ntshiab playlist';

  @override
  String get rescanMusicFilesSettingTitle => 'Cov Ntaub Ntawv Sedran Music';

  @override
  String get deviceControlMenuTutorialText => 'Txav koj tus ntiv tes xoo me ntsis nyob ib ncig ntawm nias lub log los tshawb cov zaub mov';

  @override
  String get centerButtonMenuTutorialText => 'Nias khawm nruab nrab kom xaiv cov ntawv qhia zaub mov tseem ceeb';

  @override
  String get playPauseMenuTutorialText => 'Nias lub pob no los ua si lossis ncua ib zaj nkauj';

  @override
  String get nextButtonMenuTutorialText => 'Nias lub pob no mus rau tom ntej zaj nkauj';

  @override
  String get previousButtonMenuTutorialText => 'Nias lub pob no rau rewind lossis rov qab mus rau zaj nkauj dhau los';

  @override
  String get menuButtonTutorialText => 'Nias lub pob no rov qab mus rau cov ntawv qhia zaub mov dhau los. Koj tuaj yeem nias thiab tuav nws los ntawm lwm lub vijtsam kom ncaj qha mus rau cov ntawv qhia zaub mov tseem ceeb.';

  @override
  String get deviceScreenMenuTutorialText => 'Nov yog cov zaub. Kov npo thiab split screen hom yog qhib los ntawm lub neej ntawd thiab tuaj yeem teeb tsa txuas ntxiv hauv cov chaw.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Txav koj tus ntiv tes xoo ib ncig ntawm lub log nyem kom hloov cov ntim';

  @override
  String get centerButtonNowPlayingTutorialText => 'Nias lub chaw nruab nrab mus rau voj voog los ntawm nrhiav bar, cov kab ntawv kom nruj thiab ua rau slider. Nias thiab tuav lub pob nruab nrab kom nkag mus rau cov kev xaiv ntxiv.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Nias thiab tuav lub pob no kom khiav tawm rau yav tsaus ntuj';

  @override
  String get previousButtonNowPlayingTutorialText => 'Nias thiab tuav lub pob no kom rewind zaj nkauj';

  @override
  String get deviceControlSearchTutorialText => 'Txav koj tus ntiv tes xoo me ntsis nyob ib ncig ntawm nias log kom nrov rau cov tsiaj ntawv';

  @override
  String get centerButtonSearchTutorialText => 'Nias khawm nruab nrab kom xaiv cov tsiaj ntawv tseem ceeb';

  @override
  String get nextButtonSearchTutorialText => 'Nias lub pob no kom ntxiv chaw';

  @override
  String get previousButtonSearchTutorialText => 'Nias lub pob no kom rho tawm tus cwj pwm kawg';

  @override
  String get menuButtonSearchTutorialText => 'Nias lub pob no kaw cov keyboard thiab cuam tshuam nrog cov kev tshawb fawb';
}
