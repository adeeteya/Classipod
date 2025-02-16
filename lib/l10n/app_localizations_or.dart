// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Oriya (`or`).
class AppLocalizationsOr extends AppLocalizations {
  AppLocalizationsOr([String locale = 'or']) : super(locale);

  @override
  String get appTitle => 'ଶ୍ରେଣୀକରଣ';

  @override
  String get menuButtonText => 'ମେନୁ';

  @override
  String get audioAccessPermissionTitle => 'ଅଡିଓ ଆକ୍ସେସ୍ ଅନୁମତି ଆବଶ୍ୟକ |';

  @override
  String get audioAccessPermissionContent => 'ଆମକୁ ମ୍ୟୁଜିକ୍ ଫାଇଲ୍ ଖେଳିବାକୁ ଅନୁମତି ଦେବା ପାଇଁ ଦୟାକରି ଅଡିଓ ଫାଇଲ୍ ଆକ୍ସେସ୍ ପ୍ରଦାନ କରନ୍ତୁ |';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'ଅଡିଓ ଆକ୍ସେସ୍ ଅନୁମତି ପ୍ରତ୍ୟାଖ୍ୟାନ |';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'ଦୟାକରି ଆମକୁ ଆପଣଙ୍କର ମ୍ୟୁଜିକ୍ ଫାଇଲଗୁଡ଼ିକ ବଜାଇବାକୁ ଅନୁମତି ଦେବା ପାଇଁ ଦୟାକରି ଏହି ଆପ୍ ପାଇଁ ଅଡିଓ ଫାଇଲ୍ ଆକ୍ସେସ୍ ପାଇଁ ଗ୍ରାଟ୍ କରନ୍ତୁ |';

  @override
  String get menuScreenTitle => 'ମେନୁ';

  @override
  String get musicMenuScreenTitle => 'ସଙ୍ଗୀତ';

  @override
  String get nowPlayingScreenTitle => 'ବର୍ତ୍ତମାନ ଖେଳୁଛି |';

  @override
  String get shuffleSongsMenuTitle => 'ଗୀତଗୁଡ଼ିକ ଗୀତ';

  @override
  String get shuffleSettingTitle => 'ଶଫଲ';

  @override
  String get settingsScreenTitle => 'ସେଟିଂସମୂହ';

  @override
  String get aboutScreenTitle => 'ବିଷୟରେ';

  @override
  String get coverFlowScreenTitle => 'Ble ପ୍ରବାହ';

  @override
  String get artistsScreenTitle => 'କଳାକାରମାନେ';

  @override
  String get albumsScreenTitle => 'ଆଲବମ୍';

  @override
  String get songsScreenTitle => 'ଗୀତ';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ଗୀତ',
      one: '1 ଗୀତ',
      zero: 'କ Songs ଣସି ଗୀତ ନାହିଁ |',
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
      other: '$countString ଆଲବମ୍',
      one: '1 ଆଲବମ୍',
      zero: 'କ No ଣସି ଆଲବମ୍ ନାହିଁ',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'ଧାରା';

  @override
  String get genreSongsScreenTitle => 'ପ୍ରତି ପ୍ରଥମ ଗୀତ';

  @override
  String get deviceColorSettingTitle => 'ଉପକରଣ ରଙ୍ଗ |';

  @override
  String get touchScreenSettingTitle => 'ଟଚ୍ ସ୍କ୍ରିନ୍ ସକ୍ଷମ |';

  @override
  String get repeatModeSettingTitle => 'ପୁନରାବୃତ୍ତି କର |';

  @override
  String get repeatModeOne => 'ଗୋଟିଏ |';

  @override
  String get repeatModeAll => 'ସମସ୍ତ';

  @override
  String get vibrateSettingTitle => 'କମ୍ପନ';

  @override
  String get clickWheelSettingTitle => 'ଚକ ଶବ୍ଦ କ୍ଲିକ୍ କରନ୍ତୁ |';

  @override
  String get splitScreenSettingTitle => 'ସ୍କ୍ରିନ୍ ମୋଡ୍ ବିଭାଜିତ ସ୍କ୍ରିନ୍ ମୋଡ୍ |';

  @override
  String get touchSoundsDialogTitle => 'ସ୍ପର୍ଶ ଶବ୍ଦ |';

  @override
  String get touchSoundsDialogContent => 'କ୍ଲିକ୍ ଚକ ଶବ୍ଦ ଶୁଣିବା ପାଇଁ ଦୟାକରି ସିଷ୍ଟମ୍ ସେଟିଂସମୂହରୁ ସିଷ୍ଟମ୍ ସେଟିଂସମୂହରୁ ସକ୍ଷମ ହୁଅନ୍ତୁ |';

  @override
  String get immersiveModeSettingTitle => 'ଅମଗର୍ସ ମୋଡ୍ |';

  @override
  String get showAppTutorialSettingTitle => 'ଟ୍ୟୁଟୋରିଆଲ୍ ଦେଖାନ୍ତୁ |';

  @override
  String get changeDirectorySettingTitle => 'ଡିରେକ୍ଟୋରୀ ପରିବର୍ତ୍ତନ କରନ୍ତୁ |';

  @override
  String get donateSettingTitle => 'ଦାନ କରନ୍ତୁ |';

  @override
  String get donateSettingDescription => 'ଯଦି ଆପଣ ଏହି ଆପ୍ ପସନ୍ଦ କରନ୍ତି, ଦୟାକରି ଦାନ କରିବାକୁ ବିଚାର କରନ୍ତୁ |';

  @override
  String get versionAboutScreenTitle => 'ସଂସ୍କରଣ';

  @override
  String get madeWithLoveTitle => '❤️ ଦ୍ୱାରା ତିଆରି |';

  @override
  String get noMusicFilesFound => 'କ music ଣସି ସଙ୍ଗୀତ';

  @override
  String get noArtistsFound => 'କ be ଣସି କଳାକାର ନାହିଁ |';

  @override
  String get noAlbumsFound => 'ନା ଆଲବମ୍ ନାହିଁ |';

  @override
  String get unknownSong => 'ଅଜ୍ଞାତ ଗୀତ |';

  @override
  String get unknownArtist => 'ଅଜ୍ଞାତ କଳାକାର |';

  @override
  String get unknownAlbum => 'ଅଜ୍ଞାତ ଆଲବମ୍ |';

  @override
  String get unknownGenre => 'ଅଜ୍ଞାତ ଧାରା';

  @override
  String get buttonConfirmText => 'ଠିକ୍ ଅଛି';

  @override
  String get tileValueOn => 'ଉପରେ';

  @override
  String get tileValueOff => 'ବନ୍ଦ';

  @override
  String get commonOfText => 'of of of of of of';

  @override
  String get pageNotFoundText => 'ପ୍ରଦତ୍ତ ପୃଷ୍ଠା ମିଳିଲା ନାହିଁ |';

  @override
  String get commonErrorText => 'ତ୍ରୁଟି';

  @override
  String get retryButtonText => 'ପୁନ ry ଚେଷ୍ଟା କର';

  @override
  String get filePickerDialogTitle => 'ସଙ୍ଗୀତ ପାଇଁ ସ୍କାନ୍ କରିବାକୁ ଏକ ଡିରେକ୍ଟୋରୀ ଚୟନ କରନ୍ତୁ |';

  @override
  String get searchScreenTitle => 'ସନ୍ଧାନ କର |';

  @override
  String get searchEmptyText => 'କ search ଣସି ସନ୍ଧାନ ଫଳାଫଳ ନାହିଁ |';

  @override
  String get searchResultsText => 'ସନ୍ଧାନ ଫଳାଫଳ:';

  @override
  String get resultsForText => 'ଫଳାଫଳ:';

  @override
  String get disableBatteryOptimizationTitle => 'ବ୍ୟାଟେରୀ ଅପ୍ଟିମାଇଜେସନ୍ ଅକ୍ଷମ କରନ୍ତୁ |';

  @override
  String get disableBatteryOptimizationContent => 'ସଂଗୀତ ପୃଷ୍ଠଭୂମି ପ୍ଲେବ୍ୟାକ୍ କୁ ଅନୁମତି ଦେବା ପାଇଁ ଦୟାକରି ଏହି ଆପ୍ ପାଇଁ ବ୍ୟାଟେରୀ ଅପ୍ଟିମାଇଜେସନ୍ ଅକ୍ଷମ କରନ୍ତୁ |';

  @override
  String get languageScreenTitle => 'ଭାଷା';

  @override
  String get silverDeviceColor => 'ରୂପା';

  @override
  String get blackDeviceColor => 'କଳା';

  @override
  String get resetSettingsTitle => 'ସେଟିଂସମୂହ ପୁନ et ସେଟ୍ କରନ୍ତୁ |';

  @override
  String get browseArtist => 'କଳାକାର ବ୍ରାଉଜ୍ କରନ୍ତୁ |';

  @override
  String get browseAlbum => 'ଆଲବମ୍ ବ୍ରାଉଜ୍ କରନ୍ତୁ |';

  @override
  String get cancelText => 'ବାତିଲ୍ କରନ୍ତୁ |';

  @override
  String get playlistsScreenTitle => 'ପ୍ଲେଲିଷ୍ଟଗୁଡିକ |';

  @override
  String get addToOnTheGoPlaylist => 'ଅନ୍-ଟୁରେ ଯୋଡନ୍ତୁ |';

  @override
  String get addAlbumToOnTheGoPlaylist => 'ଅନ୍-ଟୁରେ ଆଲବମ୍ ଯୋଡନ୍ତୁ |';

  @override
  String get removeSongFromThePlaylist => 'ପ୍ଲେଲିଷ୍ଟରୁ ବାହାର କରନ୍ତୁ |';

  @override
  String get allAlbums => 'ସମସ୍ତ ଆଲବମ୍ |';

  @override
  String get scanningMusicFiles => 'ମ୍ୟୁଜିକ୍ ଫାଇଲ୍ ସ୍କାନ୍ କରିବା |';

  @override
  String get newPlaylist => 'ନୂତନ ପ୍ଲେଲିଷ୍ଟ |';

  @override
  String get savePlaylist => 'ପ୍ଲେଲିଷ୍ଟ ସଞ୍ଚୟ କରନ୍ତୁ |';

  @override
  String get clearPlaylist => 'ପ୍ଲେଲିଷ୍ଟ ସଫା କରନ୍ତୁ |';

  @override
  String get rescanMusicFilesSettingTitle => 'ସଂଗୀତ ସଂଗୀତ ଫାଇଲଗୁଡିକ |';

  @override
  String get deviceControlMenuTutorialText => 'ମେନୁକୁ ନେଭିଗେଟ୍ କରିବା ପାଇଁ ଆପଣଙ୍କ ଆଙ୍ଗୁଠିକୁ ହାଲୁକା ଘୁଞ୍ଚାନ୍ତୁ |';

  @override
  String get centerButtonMenuTutorialText => 'ହାଇଲାଇଟ୍ ହୋଇଥିବା ମେନୁ ଆଇଟମ୍ ବାଛିବା ପାଇଁ କେନ୍ଦ୍ର ବଟନ୍ ଦବାନ୍ତୁ |';

  @override
  String get playPauseMenuTutorialText => 'ଏକ ଗୀତ ବଜାଇବା କିମ୍ବା ବିରାମ ଦେବା ପାଇଁ ଏହି ବଟନ୍ ଦବାନ୍ତୁ |';

  @override
  String get nextButtonMenuTutorialText => 'ପରବର୍ତ୍ତୀ ଗୀତକୁ ଯିବାକୁ ଏହି ବଟନ୍ ଦବାନ୍ତୁ |';

  @override
  String get previousButtonMenuTutorialText => 'ପୂର୍ବ ଗୀତକୁ ରିଭାଇଣ୍ଡ୍ କରିବା କିମ୍ବା ପଛକୁ ଯିବା ପାଇଁ ଏହି ବଟନ୍ ଦବାନ୍ତୁ |';

  @override
  String get menuButtonTutorialText => 'ପୂର୍ବ ମେନୁକୁ ଫେରିବା ପାଇଁ ଏହି ବଟନ୍ ଦବାନ୍ତୁ | ଆପଣ ମୁଖ୍ୟ ମେନୁକୁ ଯାଆନ୍ତୁକୁ ସିଧାସଳଖ ଯିବାକୁ ଅନ୍ୟ କ the ଣସି ପରଦାରୁ ଏହାକୁ ଦବାଇ ଧରି ପାରିବେ |';

  @override
  String get deviceScreenMenuTutorialText => 'ଏହା ହେଉଛି ଡିସପ୍ଲେ ସ୍କ୍ରିନ | ଡିଫଲ୍ଟ ଭାବରେ ସ୍ପର୍ଶ ସ୍କ୍ରିନ ଏବଂ ସ୍ପ୍ ସ୍ପଟ୍ ସ୍କ୍ରିନ୍ ମୋଡ୍ ସକ୍ଷମ ହୋଇଛି ଏବଂ ସେଟିଂସମୂହରେ ଅଧିକ ବିନ୍ୟାସ କରାଯାଇପାରିବ |';

  @override
  String get deviceControlNowPlayingTutorialText => 'ଭଲ୍ୟୁମ୍ ସଜାଡିବା ପାଇଁ କ୍ଲିକ୍ କରନ୍ତୁ କ୍ଲିକ୍ କରନ୍ତୁ |';

  @override
  String get centerButtonNowPlayingTutorialText => 'ଅନୁସନ୍ଧାନ ଦଣ୍ଡିକା, ସ୍କ୍ରବର୍ ବାର୍ ଏବଂ ଶଫର୍ ସ୍ଲାଇଡର୍ ମାଧ୍ୟମରେ ଚକ୍ରକୁ ଚକ୍ରକୁ ବ char ାନ୍ତୁ | ଅତିରିକ୍ତ ବିକଳ୍ପଗୁଡିକ ପ୍ରବେଶ କରିବାକୁ କେନ୍ଦ୍ର ବଟନ୍ ଦବାନ୍ତୁ ଏବଂ ଧରି ରଖନ୍ତୁ |';

  @override
  String get nextButtonNowPlayingTutorialText => 'ଗୀତକୁ ଶୀଘ୍ର ଆଗକୁ ବ to ିବାକୁ ଏବଂ ଧରି ରଖନ୍ତୁ |';

  @override
  String get previousButtonNowPlayingTutorialText => 'ଗୀତକୁ ପୁନ brand କରିବାକୁ ଏହି ବଟନ୍ ଦବାନ୍ତୁ ଏବଂ ଧରି ରଖନ୍ତୁ |';

  @override
  String get deviceControlSearchTutorialText => 'ଏକ ବର୍ଣ୍ଣମାଳା ହାଇଲାଇଟ୍ କରିବା ପାଇଁ ଆପଣଙ୍କର ଆଙ୍ଗୁଠିକୁ ହାଲୁକା ଘୁଞ୍ଚାନ୍ତୁ |';

  @override
  String get centerButtonSearchTutorialText => 'ହାଇଲାଇଟ୍ ହୋଇଥିବା ବର୍ଣ୍ଣମାଳା ବାଛିବା ପାଇଁ କେନ୍ଦ୍ର ବଟନ୍ ଦବାନ୍ତୁ |';

  @override
  String get nextButtonSearchTutorialText => 'ଏକ ସ୍ଥାନ ଯୋଡିବାକୁ ଏହି ବଟନ୍ ଦବାନ୍ତୁ |';

  @override
  String get previousButtonSearchTutorialText => 'ଶେଷ ବର୍ଣ୍ଣ ବିଲୋପ କରିବାକୁ ଏହି ବଟନ୍ ଦବାନ୍ତୁ |';

  @override
  String get menuButtonSearchTutorialText => 'କୀବୋର୍ଡ୍ ବନ୍ଦ କରିବାକୁ ଏବଂ ସନ୍ଧାନ ଫଳାଫଳ ସହିତ ଯୋଗାଯୋଗ କରିବାକୁ ଏହି ବଟନ୍ ଦବାନ୍ତୁ |';
}
