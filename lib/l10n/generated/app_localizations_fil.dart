// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Filipino Pilipino (`fil`).
class AppLocalizationsFil extends AppLocalizations {
  AppLocalizationsFil([String locale = 'fil']) : super(locale);

  @override
  String get appTitle => 'Classipod';

  @override
  String get menuButtonText => 'Menu';

  @override
  String get audioAccessPermissionTitle =>
      'Kinakailangan ang pahintulot sa pag -access sa audio';

  @override
  String get audioAccessPermissionContent =>
      'Mangyaring bigyan ang pag -access ng mga audio file upang payagan kaming i -play ang iyong mga file ng musika.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Tinanggihan ang pahintulot sa pag -access sa audio';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Mangyaring bigyan ang pag -access ng mga audio file para sa app na ito sa mga setting ng aparato upang payagan kaming i -play ang iyong mga file ng musika.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Musika';

  @override
  String get nowPlayingScreenTitle => 'Naglalaro ngayon';

  @override
  String get shuffleSongsMenuTitle => 'Mga kanta ng shuffle';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Mga setting';

  @override
  String get aboutScreenTitle => 'Tungkol sa';

  @override
  String get coverFlowScreenTitle => 'Takpan ang daloy';

  @override
  String get artistsScreenTitle => 'Mga Artista';

  @override
  String get albumsScreenTitle => 'Mga album';

  @override
  String get songsScreenTitle => 'Mga kanta';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString mga kanta',
      one: '1 kanta',
      zero: 'walang mga kanta',
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
      other: '$countString mga album',
      one: '1 album',
      zero: 'walang mga album',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Mga genre';

  @override
  String get genreSongsScreenTitle => 'Mga kanta ng Genre';

  @override
  String get deviceColorSettingTitle => 'Kulay ng aparato';

  @override
  String get touchScreenSettingTitle => 'Pinagana ang touch screen';

  @override
  String get repeatModeSettingTitle => 'Ulitin';

  @override
  String get repeatModeOne => 'Isa';

  @override
  String get repeatModeAll => 'Lahat';

  @override
  String get vibrateSettingTitle => 'Vibrate';

  @override
  String get clickWheelSettingTitle => 'I -click ang mga tunog ng gulong';

  @override
  String get splitScreenSettingTitle => 'Split screen mode';

  @override
  String get touchSoundsDialogTitle => 'Touch tunog';

  @override
  String get touchSoundsDialogContent =>
      'Mangyaring paganahin ang mga tunog ng touch mula sa mga setting ng system upang marinig ang mga tunog ng pag -click sa gulong';

  @override
  String get immersiveModeSettingTitle => 'Mode ng nakaka -immersive';

  @override
  String get showAppTutorialSettingTitle => 'Ipakita ang tutorial';

  @override
  String get changeDirectorySettingTitle => 'Baguhin ang direktoryo';

  @override
  String get donateSettingTitle => 'Mag -donate';

  @override
  String get donateSettingDescription =>
      'Kung gusto mo ang app na ito, mangyaring isaalang -alang ang pagbibigay.';

  @override
  String get versionAboutScreenTitle => 'Bersyon';

  @override
  String get madeWithLoveTitle => 'Ginawa ng ❤️ ni';

  @override
  String get noMusicFilesFound => 'Walang musika';

  @override
  String get noArtistsFound => 'Walang mga artista';

  @override
  String get noAlbumsFound => 'Walang mga album';

  @override
  String get unknownSong => 'Hindi kilalang kanta';

  @override
  String get unknownArtist => 'Hindi kilalang artista';

  @override
  String get unknownAlbum => 'Hindi kilalang album';

  @override
  String get unknownGenre => 'Hindi kilalang genre';

  @override
  String get buttonConfirmText => 'Ok';

  @override
  String get tileValueOn => 'Sa';

  @override
  String get tileValueOff => 'Off';

  @override
  String get commonOfText => 'ng';

  @override
  String get pageNotFoundText => 'Ang ibinigay na pahina ay hindi natagpuan';

  @override
  String get commonErrorText => 'Error';

  @override
  String get retryButtonText => 'Muling';

  @override
  String get filePickerDialogTitle =>
      'Pumili ng isang direktoryo upang mag -scan para sa musika';

  @override
  String get searchScreenTitle => 'Maghanap';

  @override
  String get searchEmptyText => 'Walang mga resulta sa paghahanap';

  @override
  String get searchResultsText => 'Mga Resulta sa Paghahanap:';

  @override
  String get resultsForText => 'Mga resulta para sa:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Huwag paganahin ang pag -optimize ng baterya';

  @override
  String get disableBatteryOptimizationContent =>
      'Mangyaring huwag paganahin ang pag -optimize ng baterya para sa app na ito sa mga setting ng aparato upang payagan ang pag -playback ng background ng musika.';

  @override
  String get languageScreenTitle => 'Wika';

  @override
  String get silverDeviceColor => 'Pilak';

  @override
  String get blackDeviceColor => 'Itim';

  @override
  String get resetSettingsTitle => 'I -reset ang mga setting';

  @override
  String get browseArtist => 'Mag -browse Artist';

  @override
  String get browseAlbum => 'Mag -browse ng album';

  @override
  String get cancelText => 'Kanselahin';

  @override
  String get playlistsScreenTitle => 'Mga playlist';

  @override
  String get addToOnTheGoPlaylist => 'Idagdag sa on-the-go';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Magdagdag ng album sa on-the-go';

  @override
  String get removeSongFromThePlaylist => 'Alisin mula sa playlist';

  @override
  String get allAlbums => 'Lahat ng mga album';

  @override
  String get scanningMusicFiles => 'Pag -scan ng mga file ng musika';

  @override
  String get newPlaylist => 'Bagong Playlist';

  @override
  String get savePlaylist => 'I -save ang playlist';

  @override
  String get clearPlaylist => 'Malinaw na playlist';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan Music Files';

  @override
  String get deviceControlMenuTutorialText =>
      'Ilipat ang iyong hinlalaki sa paligid ng pag -click ng gulong upang mag -navigate sa menu';

  @override
  String get centerButtonMenuTutorialText =>
      'Pindutin ang pindutan ng Center upang piliin ang item na naka -highlight na menu';

  @override
  String get playPauseMenuTutorialText =>
      'Pindutin ang pindutan na ito upang i -play o i -pause ang isang kanta';

  @override
  String get nextButtonMenuTutorialText =>
      'Pindutin ang pindutan na ito upang laktawan sa susunod na kanta';

  @override
  String get previousButtonMenuTutorialText =>
      'Pindutin ang pindutan na ito upang mag -rewind o bumalik sa nakaraang kanta';

  @override
  String get menuButtonTutorialText =>
      'Pindutin ang pindutan na ito upang bumalik sa nakaraang menu. Maaari mong pindutin at hawakan ito mula sa anumang iba pang screen upang direktang pumunta sa pangunahing menu.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Ito ang display screen. Ang touch screen at split screen mode ay pinagana sa pamamagitan ng default at maaaring mai -configure pa sa mga setting.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Ilipat ang iyong hinlalaki sa paligid ng pag -click ng gulong upang ayusin ang dami';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Pindutin ang pindutan ng Center upang mag -ikot sa pamamagitan ng Seek Bar, Scrubber Bar at Shuffle Slider. Pindutin at hawakan ang pindutan ng sentro upang ma -access ang mga karagdagang pagpipilian.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Pindutin nang matagal ang pindutan na ito upang mabilis na maipasa ang kanta';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Pindutin nang matagal ang pindutan na ito upang i -rewind ang kanta';

  @override
  String get deviceControlSearchTutorialText =>
      'Ilipat ang iyong hinlalaki sa paligid ng pag -click ng gulong upang i -highlight ang isang alpabeto';

  @override
  String get centerButtonSearchTutorialText =>
      'Pindutin ang pindutan ng Center upang piliin ang naka -highlight na alpabeto';

  @override
  String get nextButtonSearchTutorialText =>
      'Pindutin ang pindutan na ito upang magdagdag ng isang puwang';

  @override
  String get previousButtonSearchTutorialText =>
      'Pindutin ang pindutan na ito upang tanggalin ang huling karakter';

  @override
  String get menuButtonSearchTutorialText =>
      'Pindutin ang pindutan na ito upang isara ang keyboard at makipag -ugnay sa mga resulta ng paghahanap';
}
