// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hausa (`ha`).
class AppLocalizationsHa extends AppLocalizations {
  AppLocalizationsHa([String locale = 'ha']) : super(locale);

  @override
  String get appTitle => 'Rarraba ta asali';

  @override
  String get menuButtonText => 'Takardar tsarin abinci';

  @override
  String get audioAccessPermissionTitle => 'Izinin shiga mai shiga sauti';

  @override
  String get audioAccessPermissionContent => 'Da fatan za a ba da fayilolin sauti mai aiki don ba mu damar kunna fayilolin kiɗa.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'An hana izinin shiga Audio';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Da fatan za a ba da fayilolin bidiyo a cikin wannan app a cikin saitunan na\'urar don ba mu damar kunna fayilolin kiɗa.';

  @override
  String get menuScreenTitle => 'Takardar tsarin abinci';

  @override
  String get musicMenuScreenTitle => 'Kiɗa';

  @override
  String get nowPlayingScreenTitle => 'Yanzu wasa';

  @override
  String get shuffleSongsMenuTitle => 'Songs Songs';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Saitunan';

  @override
  String get aboutScreenTitle => 'Kayi';

  @override
  String get coverFlowScreenTitle => 'Rufe farawa';

  @override
  String get artistsScreenTitle => 'Masu zane-zane';

  @override
  String get albumsScreenTitle => 'Albums';

  @override
  String get songsScreenTitle => 'Waƙoƙi';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ગીતો',
      one: '1 ગીત',
      zero: 'કોઈ ગીતો નથી',
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
      other: '$countString આલ્બમ્સ',
      one: '1 આલ્બમ',
      zero: 'કોઈ આલ્બમ્સ નથી',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Kwayoyin';

  @override
  String get genreSongsScreenTitle => 'Genre Songs';

  @override
  String get deviceColorSettingTitle => 'Launin na\'urar';

  @override
  String get touchScreenSettingTitle => 'An kunna allon taba';

  @override
  String get repeatModeSettingTitle => 'Maimaita';

  @override
  String get repeatModeOne => 'Ɗaya';

  @override
  String get repeatModeAll => 'Duka';

  @override
  String get vibrateSettingTitle => 'Yi makarkata';

  @override
  String get clickWheelSettingTitle => 'Latsa sauti sauti';

  @override
  String get splitScreenSettingTitle => 'Yanayin allo na rabon';

  @override
  String get touchSoundsDialogTitle => 'Sauya sauti';

  @override
  String get touchSoundsDialogContent => 'Da fatan za a kunna sauti na taba wurin saitunan tsarin don jin danna Saurar da Sauti';

  @override
  String get immersiveModeSettingTitle => 'Yanayin nutsewa';

  @override
  String get showAppTutorialSettingTitle => 'Nuna koyawa';

  @override
  String get changeDirectorySettingTitle => 'Canza shugabanci';

  @override
  String get donateSettingTitle => 'Ba da kyauta';

  @override
  String get donateSettingDescription => 'Idan kuna son wannan app, da fatan za a yi amfani da gudummawa.';

  @override
  String get versionAboutScreenTitle => 'Irin ra\'ayi';

  @override
  String get madeWithLoveTitle => 'Sanya tare da ❤️ by';

  @override
  String get noMusicFilesFound => 'Babu kiɗa';

  @override
  String get noArtistsFound => 'Babu Artists';

  @override
  String get noAlbumsFound => 'Babu Albums';

  @override
  String get unknownSong => 'Waƙar da ba a san ba';

  @override
  String get unknownArtist => 'Ba a sani ba Artist';

  @override
  String get unknownAlbum => 'Kundin da ba a sani ba';

  @override
  String get unknownGenre => 'Nau\'in da ba a san shi ba';

  @override
  String get buttonConfirmText => 'KO';

  @override
  String get tileValueOn => 'A kan';

  @override
  String get tileValueOff => 'Katse lantarki';

  @override
  String get commonOfText => 'na';

  @override
  String get pageNotFoundText => 'Ba a samo shafin ba';

  @override
  String get commonErrorText => 'Kuskure';

  @override
  String get retryButtonText => 'Sake gwadawa';

  @override
  String get filePickerDialogTitle => 'Zaɓi directory don bincika kiɗa';

  @override
  String get searchScreenTitle => 'Bincika';

  @override
  String get searchEmptyText => 'Babu Sakamakon Bincike';

  @override
  String get searchResultsText => 'Sakamakon bincike:';

  @override
  String get resultsForText => 'Sakamako don:';

  @override
  String get disableBatteryOptimizationTitle => 'Kashe ingantawa baturi';

  @override
  String get disableBatteryOptimizationContent => 'Da fatan za a kashe ingantawa ta baturi don wannan app a cikin saitunan na\'urar don ba da damar sake kunnawa na kiɗa.';

  @override
  String get languageScreenTitle => 'Harshe';

  @override
  String get silverDeviceColor => 'Azurfa';

  @override
  String get blackDeviceColor => 'Baƙi';

  @override
  String get resetSettingsTitle => 'Sake saita saiti';

  @override
  String get browseArtist => 'Yi bincike mai zane';

  @override
  String get browseAlbum => 'Binciko album';

  @override
  String get cancelText => 'Warware';

  @override
  String get playlistsScreenTitle => 'Lamba';

  @override
  String get addToOnTheGoPlaylist => 'Kara zuwa kan-da-tafi';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Sanya album a kan-da-go';

  @override
  String get removeSongFromThePlaylist => 'Cire daga jerin waƙoƙi';

  @override
  String get allAlbums => 'Duk Albums';

  @override
  String get scanningMusicFiles => 'Fayilolin kiɗa';

  @override
  String get newPlaylist => 'Sabuwar waƙa';

  @override
  String get savePlaylist => 'Ajiye lissafin waƙa';

  @override
  String get clearPlaylist => 'Share jerin waƙoƙi';

  @override
  String get rescanMusicFilesSettingTitle => 'Fayilolin Music';

  @override
  String get deviceControlMenuTutorialText => 'Matsar da yatsa da sauƙi a kusa da dannawa don kewaya menu';

  @override
  String get centerButtonMenuTutorialText => 'Latsa maɓallin tsakiyar don zaɓar abun da aka yi';

  @override
  String get playPauseMenuTutorialText => 'Latsa wannan maɓallin don wasa ko dakatar da waƙa';

  @override
  String get nextButtonMenuTutorialText => 'Latsa wannan maballin don tsallake zuwa waƙar ta gaba';

  @override
  String get previousButtonMenuTutorialText => 'Latsa wannan maɓallin don komawa ko komawa zuwa waƙar da ta gabata';

  @override
  String get menuButtonTutorialText => 'Latsa wannan maɓallin don komawa menu na baya. Kuna iya latsa ku riƙe shi daga kowane allon don kai tsaye zuwa menu na ainihi.';

  @override
  String get deviceScreenMenuTutorialText => 'Wannan shine allon nuni. Yanayin allo aka kunna yanayin raba allo ta tsohuwa kuma za\'a iya saita shi a saitunan.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Matsa babban yatsa a kusa da dannawa don daidaita ƙarar';

  @override
  String get centerButtonNowPlayingTutorialText => 'Latsa maɓallin tsakiyar zuwa sake zagayowar ta hanyar neman mashaya, goge goge kuma supfle Slider. Latsa ka riƙe maɓallin cibiyar don samun damar ƙarin zaɓuɓɓuka.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Latsa ka riƙe wannan maɓallin don saurin tura waƙar';

  @override
  String get previousButtonNowPlayingTutorialText => 'Latsa ka riƙe wannan maɓallin don sake kunna wakar';

  @override
  String get deviceControlSearchTutorialText => 'Matsar da yatsa a kusa da dannawa don ƙarin haruffa';

  @override
  String get centerButtonSearchTutorialText => 'Latsa maɓallin tsakiyar don zaɓar wasika mai alama';

  @override
  String get nextButtonSearchTutorialText => 'Latsa wannan maɓallin don ƙara sarari';

  @override
  String get previousButtonSearchTutorialText => 'Latsa wannan maɓallin don share halayyar ƙarshe';

  @override
  String get menuButtonSearchTutorialText => 'Latsa wannan maɓallin don rufe maballin kuma yana hulɗa da sakamakon binciken';
}
