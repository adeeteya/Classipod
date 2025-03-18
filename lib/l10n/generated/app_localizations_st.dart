// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Southern Sotho (`st`).
class AppLocalizationsSt extends AppLocalizations {
  AppLocalizationsSt([String locale = 'st']) : super(locale);

  @override
  String get appTitle => 'Classipod';

  @override
  String get menuButtonText => 'Menu';

  @override
  String get audioAccessPermissionTitle =>
      'Ho hlokahala tumello ea ho fihlella';

  @override
  String get audioAccessPermissionContent =>
      'Ka kopo sheba lifaele tsa audio phihlello ea ho re lumella ho bapala lifaele tsa hau tsa mmino.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'AUD Audio Adive Tumello e hanne';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Ka kopo sheba lifaele tsa audio ho fihlella sesebelisoa sena ho sesebelisoa sa sesebelisoa ho re lumella ho bapala lifaele tsa hau tsa mmino.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Mmino';

  @override
  String get nowPlayingScreenTitle => 'Hona joale ea bapala';

  @override
  String get shuffleSongsMenuTitle => 'Lipina tsa shuffle';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Litlhophiso';

  @override
  String get aboutScreenTitle => 'About';

  @override
  String get coverFlowScreenTitle => 'Koahela phallo';

  @override
  String get artistsScreenTitle => 'Baetsi ba botaki';

  @override
  String get albumsScreenTitle => 'Albums';

  @override
  String get songsScreenTitle => 'Lipina';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Lipina',
      one: '1 Sefela',
      zero: 'Ha ho Lipina',
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
      other: '$countString Lialbamo',
      one: '1 Letlapa',
      zero: 'Ha ho Lialbamo',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Mefuta';

  @override
  String get genreSongsScreenTitle => 'Lipina tsa Mofuta';

  @override
  String get deviceColorSettingTitle => '\'Mala oa sesebelisoa';

  @override
  String get touchScreenSettingTitle => 'Ho utloa skrini';

  @override
  String get repeatModeSettingTitle => 'Pheta';

  @override
  String get repeatModeOne => 'Ngoe';

  @override
  String get repeatModeAll => 'Tsohle';

  @override
  String get vibrateSettingTitle => 'Vibrar';

  @override
  String get clickWheelSettingTitle => 'Tobetsa melumo ea wheel';

  @override
  String get splitScreenSettingTitle => 'Mode oa skrit';

  @override
  String get touchSoundsDialogTitle => 'Ama melumo';

  @override
  String get touchSoundsDialogContent =>
      'Ka kopo, nolofalletsa melumo ea ho boloka litlhophiso tsa sisteme ho utloa melumo ea wheelli';

  @override
  String get immersiveModeSettingTitle => 'Mode ea ho qoelisoa';

  @override
  String get showAppTutorialSettingTitle => 'Tšoaea Tutorial';

  @override
  String get changeDirectorySettingTitle => 'Fetola Directory';

  @override
  String get donateSettingTitle => 'Donate';

  @override
  String get donateSettingDescription =>
      'Haeba u rata sesebelisoa sena, ka kopo nahana ka ho u fafa.';

  @override
  String get versionAboutScreenTitle => 'Mofuta';

  @override
  String get madeWithLoveTitle => 'Entsoe ka ❤️ ka';

  @override
  String get noMusicFilesFound => 'Ha ho na \'mino';

  @override
  String get noArtistsFound => 'Ha ho litšoantšo';

  @override
  String get noAlbumsFound => 'Ha ho li-albhamu';

  @override
  String get unknownSong => 'Sengoli se sa tsejoeng';

  @override
  String get unknownArtist => 'Setsebi se sa tsejoeng';

  @override
  String get unknownAlbum => 'Albamo e sa tsejoeng';

  @override
  String get unknownGenre => 'Sebopeho se sa tsejoeng';

  @override
  String get buttonConfirmText => 'HO LOKILE';

  @override
  String get tileValueOn => 'Ho';

  @override
  String get tileValueOff => 'Theoha';

  @override
  String get commonOfText => 'tsa';

  @override
  String get pageNotFoundText => 'Leqephe le fanoeng ha lea fumanoa';

  @override
  String get commonErrorText => 'Phoso';

  @override
  String get retryButtonText => 'Leka hape';

  @override
  String get filePickerDialogTitle => 'Khetha Spictory ho hlahloba \'mino';

  @override
  String get searchScreenTitle => 'Batla';

  @override
  String get searchEmptyText => 'Ha ho na sephetho sa Patlo';

  @override
  String get searchResultsText => 'Liphetho tsa Patlo:';

  @override
  String get resultsForText => 'Liphetho tsa:';

  @override
  String get disableBatteryOptimizationTitle => 'Qoba Battery Outter';

  @override
  String get disableBatteryOptimizationContent =>
      'Ka kopo hlakola sesebelisoa sa betri ho sesebelisoa sena ho sesebelisoa sa sesebelisoa ho lumella ho bapala ha semelo sa \'mino.';

  @override
  String get languageScreenTitle => 'Puo';

  @override
  String get silverDeviceColor => 'Silifera';

  @override
  String get blackDeviceColor => 'E ntšo';

  @override
  String get resetSettingsTitle => 'Seta Litlhophiso';

  @override
  String get browseArtist => 'Setsebi sa botaki';

  @override
  String get browseAlbum => 'Browse album';

  @override
  String get cancelText => 'Hlakola';

  @override
  String get playlistsScreenTitle => 'Manane a lipina';

  @override
  String get addToOnTheGoPlaylist => 'Eketsa ho-ea-ea';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Kenya albamo ho ea ho-ea';

  @override
  String get removeSongFromThePlaylist => 'Tlosa ho sehlopha sa lipina';

  @override
  String get allAlbums => 'Albums tsa Albums';

  @override
  String get scanningMusicFiles => 'Lifaele tsa mmino';

  @override
  String get newPlaylist => 'Setsebi sa lipina tse ncha';

  @override
  String get savePlaylist => 'Boloka lipina tsa playlist';

  @override
  String get clearPlaylist => 'Lenane la lipina tse hlakileng';

  @override
  String get rescanMusicFilesSettingTitle => 'Lifaele tsa mmino';

  @override
  String get deviceControlMenuTutorialText =>
      'Tsamaisetsa monoana oa hau o motle ho potoloha lebili ho navigate menu';

  @override
  String get centerButtonMenuTutorialText =>
      'Tobetsa konopo ea Center ho khetha ntho e totobetseng ea menu';

  @override
  String get playPauseMenuTutorialText =>
      'Tobetsa konopo ena ho bapala kapa ho khefutsa pina';

  @override
  String get nextButtonMenuTutorialText =>
      'Tobetsa konopo ena ho tlola pina e latelang';

  @override
  String get previousButtonMenuTutorialText =>
      'Tobetsa konopo ena ho nchafatsa kapa ho khutlela pina e fetileng';

  @override
  String get menuButtonTutorialText =>
      'Tobetsa konopo ena ho khutlela ho menyu e fetileng. U ka tobetsa ebe u e ts\'oara ka skrineng e ngoe ho ea ho ea ho ea ka kotloloho ho ea menu e ka sehloohong.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Ena ke skrini ea lipontšo. Sesebelisoa sa ho ama le ho arola skril skrili se entsoe ka nako le nako ebile se ka hlophisoa haholoanyane maemong.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Tsamaisa monoana oa hau ho potoloha lebili ho lokisa molumo';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Tobetsa konopo ea Center ho potoloha ka ho batla Bar, Bar, Bar le Shuffle Slider. Tobetsa le ho tšoara konopo ea Center ho fumana likhetho tse ling.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Tobetsa \'me u tšoare konopo ena ho potlakisa pina';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Tobetsa le ho tšoara konopo ena ho nchafatsa pina';

  @override
  String get deviceControlSearchTutorialText =>
      'Tsamaisa monoana oa hau o bobebe ho potoloha lebili le totobatsang alfabeta';

  @override
  String get centerButtonSearchTutorialText =>
      'Tobetsa konopo ea Center ho khetha alfabeta e totobalitsoeng';

  @override
  String get nextButtonSearchTutorialText =>
      'Tobetsa konopo ena ho eketsa sebaka';

  @override
  String get previousButtonSearchTutorialText =>
      'Tobetsa konopo ena ho hlakola sebopeho sa ho qetela';

  @override
  String get menuButtonSearchTutorialText =>
      'Tobetsa konopo ena ho koala keyboard ebe o buisana le sephetho sa lipatlisiso';

  @override
  String get allSongs => 'Lipina tsohle';
}
