// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get appTitle => 'క్లాసిపోడ్';

  @override
  String get menuButtonText => 'మెను';

  @override
  String get audioAccessPermissionTitle => 'ఆడియో యాక్సెస్ అనుమతి అవసరం';

  @override
  String get audioAccessPermissionContent =>
      'దయచేసి మీ మ్యూజిక్ ఫైల్‌లను ప్లే చేయడానికి మాకు అనుమతించడానికి ఆడియో ఫైల్‌లను యాక్సెస్ చేయండి.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'ఆడియో యాక్సెస్ అనుమతి తిరస్కరించబడింది';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'దయచేసి మీ మ్యూజిక్ ఫైళ్ళను ప్లే చేయడానికి మాకు అనుమతించడానికి పరికర సెట్టింగ్‌లలో ఈ అనువర్తనం కోసం ఆడియో ఫైల్‌లను యాక్సెస్ చేయండి.';

  @override
  String get menuScreenTitle => 'మెను';

  @override
  String get musicMenuScreenTitle => 'సంగీతం';

  @override
  String get nowPlayingScreenTitle => 'ఇప్పుడు ఆడుతున్నారు';

  @override
  String get shuffleSongsMenuTitle => 'షఫుల్ పాటలు';

  @override
  String get shuffleSettingTitle => 'షఫుల్';

  @override
  String get settingsScreenTitle => 'సెట్టింగులు';

  @override
  String get aboutScreenTitle => 'గురించి';

  @override
  String get coverFlowScreenTitle => 'కవర్ ప్రవాహం';

  @override
  String get artistsScreenTitle => 'కళాకారులు';

  @override
  String get albumsScreenTitle => 'ఆల్బమ్‌లు';

  @override
  String get songsScreenTitle => 'పాటలు';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString పాటలు',
      one: '1 పాట',
      zero: 'పాటలు లేవు',
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
      other: '$countString ఆల్బమ్‌లు',
      one: '1 ఆల్బమ్',
      zero: 'ఆల్బమ్‌లు లేవు',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'శైలులు';

  @override
  String get genreSongsScreenTitle => 'శైలి పాటలు';

  @override
  String get deviceColorSettingTitle => 'పరికర రంగు';

  @override
  String get touchScreenSettingTitle => 'టచ్ స్క్రీన్ ప్రారంభించబడింది';

  @override
  String get repeatModeSettingTitle => 'పునరావృతం';

  @override
  String get repeatModeOne => 'ఒకటి';

  @override
  String get repeatModeAll => 'అన్నీ';

  @override
  String get vibrateSettingTitle => 'వైబ్రేట్';

  @override
  String get clickWheelSettingTitle => 'వీల్ శబ్దాలు క్లిక్ చేయండి';

  @override
  String get splitScreenSettingTitle => 'స్ప్లిట్ స్క్రీన్ మోడ్';

  @override
  String get touchSoundsDialogTitle => 'టచ్ శబ్దాలు';

  @override
  String get touchSoundsDialogContent =>
      'క్లిక్ వీల్ శబ్దాలను వినడానికి దయచేసి సిస్టమ్ సెట్టింగుల నుండి టచ్ శబ్దాలను ప్రారంభించండి';

  @override
  String get immersiveModeSettingTitle => 'లీనమయ్యే మోడ్';

  @override
  String get showAppTutorialSettingTitle => 'ట్యుటోరియల్ చూపించు';

  @override
  String get changeDirectorySettingTitle => 'డైరెక్టరీని మార్చండి';

  @override
  String get donateSettingTitle => 'దానం';

  @override
  String get donateSettingDescription =>
      'మీకు ఈ అనువర్తనం నచ్చితే, దయచేసి విరాళం ఇవ్వండి.';

  @override
  String get versionAboutScreenTitle => 'వెర్షన్';

  @override
  String get madeWithLoveTitle => 'By ద్వారా తయారు చేయబడింది';

  @override
  String get noMusicFilesFound => 'సంగీతం లేదు';

  @override
  String get noArtistsFound => 'కళాకారులు లేరు';

  @override
  String get noAlbumsFound => 'ఆల్బమ్‌లు లేవు';

  @override
  String get unknownSong => 'తెలియని పాట';

  @override
  String get unknownArtist => 'తెలియని కళాకారుడు';

  @override
  String get unknownAlbum => 'తెలియని ఆల్బమ్';

  @override
  String get unknownGenre => 'తెలియని శైలి';

  @override
  String get buttonConfirmText => 'సరే';

  @override
  String get tileValueOn => 'ఆన్';

  @override
  String get tileValueOff => 'ఆఫ్';

  @override
  String get commonOfText => 'యొక్క';

  @override
  String get pageNotFoundText => 'ఇచ్చిన పేజీ కనుగొనబడలేదు';

  @override
  String get commonErrorText => 'లోపం';

  @override
  String get retryButtonText => 'మళ్లీ ప్రయత్నించండి';

  @override
  String get filePickerDialogTitle =>
      'సంగీతం కోసం స్కాన్ చేయడానికి డైరెక్టరీని ఎంచుకోండి';

  @override
  String get searchScreenTitle => 'శోధన';

  @override
  String get searchEmptyText => 'శోధన ఫలితాలు లేవు';

  @override
  String get searchResultsText => 'శోధన ఫలితాలు:';

  @override
  String get resultsForText => 'దీని కోసం ఫలితాలు:';

  @override
  String get disableBatteryOptimizationTitle =>
      'బ్యాటరీ ఆప్టిమైజేషన్‌ను నిలిపివేయండి';

  @override
  String get disableBatteryOptimizationContent =>
      'సంగీతం యొక్క నేపథ్య ప్లేబ్యాక్‌ను అనుమతించడానికి పరికర సెట్టింగ్‌లలో ఈ అనువర్తనం కోసం బ్యాటరీ ఆప్టిమైజేషన్‌ను నిలిపివేయండి.';

  @override
  String get languageScreenTitle => 'భాష';

  @override
  String get silverDeviceColor => 'వెండి';

  @override
  String get blackDeviceColor => 'నలుపు';

  @override
  String get resetSettingsTitle => 'సెట్టింగులను రీసెట్ చేయండి';

  @override
  String get browseArtist => 'బ్రౌజ్ ఆర్టిస్ట్';

  @override
  String get browseAlbum => 'బ్రౌజ్ ఆల్బమ్';

  @override
  String get cancelText => 'రద్దు చేయండి';

  @override
  String get playlistsScreenTitle => 'ప్లేజాబితాలు';

  @override
  String get addToOnTheGoPlaylist => 'ప్రయాణంలో చేర్చండి';

  @override
  String get addAlbumToOnTheGoPlaylist => 'ప్రయాణంలో ఆల్బమ్‌ను జోడించండి';

  @override
  String get removeSongFromThePlaylist => 'ప్లేజాబితా నుండి తొలగించండి';

  @override
  String get allAlbums => 'అన్ని ఆల్బమ్‌లు';

  @override
  String get scanningMusicFiles => 'స్కానింగ్ మ్యూజిక్ ఫైల్స్';

  @override
  String get newPlaylist => 'కొత్త ప్లేజాబితా';

  @override
  String get savePlaylist => 'ప్లేజాబితాను సేవ్ చేయండి';

  @override
  String get clearPlaylist => 'స్పష్టమైన ప్లేజాబితా';

  @override
  String get rescanMusicFilesSettingTitle => 'మ్యూజిక్ ఫైళ్ళను రెస్కాన్ చేయండి';

  @override
  String get deviceControlMenuTutorialText =>
      'మెనుని నావిగేట్ చేయడానికి క్లిక్ వీల్ చుట్టూ మీ బొటనవేలును తేలికగా తరలించండి';

  @override
  String get centerButtonMenuTutorialText =>
      'హైలైట్ చేసిన మెను ఐటెమ్‌ను ఎంచుకోవడానికి సెంటర్ బటన్ నొక్కండి';

  @override
  String get playPauseMenuTutorialText =>
      'పాటను ప్లే చేయడానికి లేదా పాజ్ చేయడానికి ఈ బటన్‌ను నొక్కండి';

  @override
  String get nextButtonMenuTutorialText =>
      'తదుపరి పాటను దాటవేయడానికి ఈ బటన్‌ను నొక్కండి';

  @override
  String get previousButtonMenuTutorialText =>
      'రివైండ్ చేయడానికి ఈ బటన్‌ను నొక్కండి లేదా మునుపటి పాటకి తిరిగి వెళ్లండి';

  @override
  String get menuButtonTutorialText =>
      'మునుపటి మెనూకు తిరిగి వెళ్లడానికి ఈ బటన్‌ను నొక్కండి. మీరు నేరుగా ప్రధాన మెనూకు వెళ్ళడానికి ఏ ఇతర స్క్రీన్ నుండి నొక్కండి మరియు పట్టుకోవచ్చు.';

  @override
  String get deviceScreenMenuTutorialText =>
      'ఇది డిస్ప్లే స్క్రీన్. టచ్ స్క్రీన్ మరియు స్ప్లిట్ స్క్రీన్ మోడ్ అప్రమేయంగా ప్రారంభించబడతాయి మరియు సెట్టింగులలో మరింత కాన్ఫిగర్ చేయవచ్చు.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'వాల్యూమ్‌ను సర్దుబాటు చేయడానికి క్లిక్ వీల్ చుట్టూ మీ బొటనవేలును తరలించండి';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'సీక్ బార్, స్క్రబ్బర్ బార్ మరియు షఫుల్ స్లైడర్ ద్వారా సైకిల్ చేయడానికి సెంటర్ బటన్‌ను నొక్కండి. అదనపు ఎంపికలను యాక్సెస్ చేయడానికి సెంటర్ బటన్‌ను నొక్కి ఉంచండి.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'పాటను వేగంగా ఫార్వార్డ్ చేయడానికి ఈ బటన్‌ను నొక్కి ఉంచండి';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'పాటను రివైండ్ చేయడానికి ఈ బటన్‌ను నొక్కి ఉంచండి';

  @override
  String get deviceControlSearchTutorialText =>
      'వర్ణమాలను హైలైట్ చేయడానికి క్లిక్ వీల్ చుట్టూ మీ బొటనవేలును తేలికగా తరలించండి';

  @override
  String get centerButtonSearchTutorialText =>
      'హైలైట్ చేసిన వర్ణమాలను ఎంచుకోవడానికి సెంటర్ బటన్ నొక్కండి';

  @override
  String get nextButtonSearchTutorialText =>
      'స్థలాన్ని జోడించడానికి ఈ బటన్‌ను నొక్కండి';

  @override
  String get previousButtonSearchTutorialText =>
      'చివరి అక్షరాన్ని తొలగించడానికి ఈ బటన్‌ను నొక్కండి';

  @override
  String get menuButtonSearchTutorialText =>
      'కీబోర్డ్‌ను మూసివేయడానికి ఈ బటన్‌ను నొక్కండి మరియు శోధన ఫలితాలతో ఇంటరాక్ట్ అవ్వండి';
}
