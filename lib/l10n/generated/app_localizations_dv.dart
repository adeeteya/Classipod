// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dhivehi Divehi Maldivian (`dv`).
class AppLocalizationsDv extends AppLocalizations {
  AppLocalizationsDv([String locale = 'dv']) : super(locale);

  @override
  String get appTitle => 'ކްލާސިޕޮޑް';

  @override
  String get menuButtonText => 'މެނޫ';

  @override
  String get audioAccessPermissionTitle => 'އޯޑިއޯ އެކްސެސް ހުއްދަ ބޭނުންވާ';

  @override
  String get audioAccessPermissionContent =>
      'މިއުޒިކް ފައިލްތައް ކުޅެވޭނެ ގޮތް ހެދުމަށްޓަކައި އޯޑިއޯ ފައިލްތަކަށް އެކްސެސް ދެއްވުން އެދެމެވެ.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'އޯޑިއޯ އެކްސެސް ހުއްދަ ދޮގުކޮށްފި';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'މިއުޒިކް ފައިލްތައް ކުޅެވޭނެ ގޮތަށް ޑިވައިސް ސެޓިންގްސްގައި މި އެޕް އަށް އޯޑިއޯ ފައިލްތަކަށް އެކްސެސް ދިނުން އެދެމެވެ.';

  @override
  String get menuScreenTitle => 'މެނޫ';

  @override
  String get musicMenuScreenTitle => 'މިއުޒިކް';

  @override
  String get nowPlayingScreenTitle => 'މިހާރު ކުޅެނީ';

  @override
  String get shuffleSongsMenuTitle => 'ޝަފްލް ލަވަތައް';

  @override
  String get shuffleSettingTitle => 'ޝަފްލް';

  @override
  String get settingsScreenTitle => 'ސެޓިންގސް';

  @override
  String get aboutScreenTitle => 'ގުޅިގެން';

  @override
  String get coverFlowScreenTitle => 'ކަވަރ ފްލޯ';

  @override
  String get artistsScreenTitle => 'ފަންނާނުން';

  @override
  String get albumsScreenTitle => 'އަލްބަމްތައް';

  @override
  String get songsScreenTitle => 'ލަވަތައް';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ލަވަތަކެވެ',
      one: '1 ލަވަ',
      zero: 'ލަވައެއް ނެތް',
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
      other: '$countString އަލްބަމްތަކެވެ',
      one: '1 އަލްބަމް',
      zero: 'އަލްބަމެއް ނެތް',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'ޖޯންރާސް';

  @override
  String get genreSongsScreenTitle => 'ޖެންރަލް ލަވަތައް';

  @override
  String get deviceColorSettingTitle => 'ޑިވައިސް ކުލަ';

  @override
  String get touchScreenSettingTitle => 'ޓަޗް ސްކްރީން އެނެބަލް';

  @override
  String get repeatModeSettingTitle => 'ރިޕީޓްކުރުން';

  @override
  String get repeatModeOne => 'އެކެއް';

  @override
  String get repeatModeAll => 'ހުރިހާ';

  @override
  String get vibrateSettingTitle => 'ވައިބަރޓް';

  @override
  String get clickWheelSettingTitle => 'ވީލް ސައުންޑްސް އަށް ފިތާލާށެވެ .';

  @override
  String get splitScreenSettingTitle => 'ސްޕްލިޓް ސްކްރީން މޯޑް';

  @override
  String get touchSoundsDialogTitle => 'އަތްލާ އަޑުތައް';

  @override
  String get touchSoundsDialogContent =>
      'ކްލިކް ވީލް ސައުންޑްސް އަޑުއަހަން ސިސްޓަމް ސެޓިންގސް އިން ޓަޗް ސައުންޑްސް އެނެބަލް ކޮށްލައްވާ';

  @override
  String get immersiveModeSettingTitle => 'އިމަރސިވް މޯޑް';

  @override
  String get showAppTutorialSettingTitle => 'ޓިއުޓޯރިއަލް ދައްކާ';

  @override
  String get changeDirectorySettingTitle => 'ޑައިރެކްޓަރީ ބަދަލުކުރުން';

  @override
  String get donateSettingTitle => 'ހަދިޔާކުރުން';

  @override
  String get donateSettingDescription =>
      'މި އެޕް ކަމުދާނަމަ ހަދިޔާ ކުރުމަށް ވިސްނާށެވެ.';

  @override
  String get versionAboutScreenTitle => 'ވަރޝަން';

  @override
  String get madeWithLoveTitle => '❤️ އިން ހަދާފައިވާ .';

  @override
  String get noMusicFilesFound => 'މިއުޒިކެއް ނެތް';

  @override
  String get noArtistsFound => 'އެއްވެސް ފަންނާނެއް ނެތް';

  @override
  String get noAlbumsFound => 'އެއްވެސް އަލްބަމެއް ނެތް';

  @override
  String get unknownSong => 'ނޭނގޭ ލަވައެއް';

  @override
  String get unknownArtist => 'ނޭނގޭ ފަންނާނެއް';

  @override
  String get unknownAlbum => 'ނޭނގޭ އަލްބަމެއް';

  @override
  String get unknownGenre => 'ނޭނގޭ ޖޯންރާ';

  @override
  String get buttonConfirmText => 'އެންމެ ރަނގަޅު';

  @override
  String get tileValueOn => 'މަތީގައި';

  @override
  String get tileValueOff => 'އޮފް';

  @override
  String get commonOfText => 'ގެ';

  @override
  String get pageNotFoundText => 'ދީފައިވާ ޞަފްޙާއެއް ނުފެނުނު';

  @override
  String get commonErrorText => 'ކުށް';

  @override
  String get retryButtonText => 'ރީޓްރައި';

  @override
  String get filePickerDialogTitle =>
      'މިއުޒިކް ސްކޭން ކުރުމަށް ޑައިރެކްޓަރީއެއް ހޮވާށެވެ .';

  @override
  String get searchScreenTitle => 'ހޯދުން';

  @override
  String get searchEmptyText => 'ހޯދުމުގެ ނަތީޖާއެއް ނުފެނޭ';

  @override
  String get searchResultsText => 'ހޯދުމުގެ ނަތީޖާ:';

  @override
  String get resultsForText => 'ނަތީޖާ:';

  @override
  String get disableBatteryOptimizationTitle =>
      'ބެޓެރީ އޮޕްޓިމައިޒޭޝަން ޑިސެބިލް ކުރުން';

  @override
  String get disableBatteryOptimizationContent =>
      'ޑިވައިސް ސެޓިންގސްގައި މި އެޕް އަށް ބެޓެރީ އޮޕްޓިމައިޒޭޝަން ޑިސެބިލްކޮށް، މިއުޒިކްގެ ބެކްގްރައުންޑް ޕްލޭބެކް އަށް ފުރުސަތު ދެއްވުން އެދެމެވެ.';

  @override
  String get languageScreenTitle => 'ބަސް';

  @override
  String get silverDeviceColor => 'ރިހި';

  @override
  String get blackDeviceColor => 'ކަޅު';

  @override
  String get resetSettingsTitle => 'ރީސެޓް ސެޓިންގސް';

  @override
  String get browseArtist => 'ބްރައުޒް އާޓިސްޓް';

  @override
  String get browseAlbum => 'ބްރައުޒް އަލްބަމް';

  @override
  String get cancelText => 'ކެންސަލް';

  @override
  String get playlistsScreenTitle => 'ޕްލޭލިސްޓްތައް';

  @override
  String get addToOnTheGoPlaylist => 'އޮން ދަ ގޯ';

  @override
  String get addAlbumToOnTheGoPlaylist =>
      'އޮން ދަ ގޯއަށް އަލްބަމް އިތުރުކުރުން';

  @override
  String get removeSongFromThePlaylist => 'ޕްލޭލިސްޓުން ނައްތާލާށެވެ .';

  @override
  String get allAlbums => 'ހުރިހާ އަލްބަމެއް';

  @override
  String get scanningMusicFiles => 'މިއުޒިކް ފައިލްތައް ސްކޭން ކުރުން';

  @override
  String get newPlaylist => 'އައު ޕްލޭލިސްޓެއް';

  @override
  String get savePlaylist => 'ޕްލޭލިސްޓް ރައްކާކުރުން';

  @override
  String get clearPlaylist => 'ކްލިއަރ ޕްލޭލިސްޓް';

  @override
  String get rescanMusicFilesSettingTitle => 'ރީސްކޭން މިއުޒިކް ފައިލްތައް';

  @override
  String get deviceControlMenuTutorialText =>
      'ކްލިކް ވީލްގެ ވަށައިގެން އިނގިލި ލުއިކޮށް ގެންދިއުން މެނޫގައި ނެވިގޭޓް ކުރާށެވެ .';

  @override
  String get centerButtonMenuTutorialText =>
      'ހައިލައިޓް ކޮށްފައިވާ މެނޫ އައިޓަމް ހޮވަން ސެންޓަރ ބަޓަން ފިއްތާލާށެވެ .';

  @override
  String get playPauseMenuTutorialText =>
      'ލަވައެއް ކުޅެން ނުވަތަ މަޑުޖައްސާލުމަށް މި ބަޓަން ފިއްތާލާށެވެ .';

  @override
  String get nextButtonMenuTutorialText =>
      'ދެން އޮންނަ ލަވައަށް ސްކިޕް ކުރުމަށް މި ބަޓަން ފިއްތާލާށެވެ .';

  @override
  String get previousButtonMenuTutorialText =>
      'ރިވައިންޑް ކުރުމަށް ނުވަތަ ކުރީގެ ލަވައަށް އެނބުރި ދިއުމަށް މި ބަޓަން ފިއްތާލާށެވެ .';

  @override
  String get menuButtonTutorialText =>
      'ކުރީގެ މެނޫއަށް އެނބުރި ދިއުމަށްޓަކައި މި ބަޓަން ފިއްތާލާށެވެ. ސީދާ މައި މެނޫއަށް ދިއުމަށްޓަކައި އެހެން ކޮންމެ ސްކްރީނަކުން ވެސް ފިތާލާފައި ހިފަހައްޓާލެވިދާނެ އެވެ.';

  @override
  String get deviceScreenMenuTutorialText =>
      'މިއީ ޑިސްޕްލޭ ސްކްރީނެވެ. ޓަޗް ސްކްރީން އަދި ސްޕްލިޓް ސްކްރީން މޯޑް ޑިފޯލްޓްކޮށް އެނެބަލްކޮށްފައިވާއިރު، ސެޓިންގްސްގައި އިތުރަށް ކޮންފިގްރޭޓް ކުރެވޭނެ އެވެ.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'ވޮލިއުމް އެޖެސްޓް ކުރުމަށް ކްލިކް ވީލް ވަށައިގެން އިނގިލި ގެންދިއުން';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'ސީކް ބާރ، ސްކްރަބަރ ބާރ އަދި ޝަފްލް ސްލައިޑަރ މެދުވެރިކޮށް ސައިކަލް ކުރުމަށް ސެންޓަރ ބަޓަން ފިއްތާލާށެވެ. އިތުރު އިޚްތިޔާރުތަކަށް ވަނުމަށްޓަކައި ސެންޓަރ ބަޓަން ފިއްތާފައި ބަހައްޓާށެވެ.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'ލަވަ ފަސްޓް ފޯވާޑް ކުރުމަށް މި ބަޓަން ފިއްތާފައި ބަހައްޓާށެވެ .';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'ލަވަ ރިވައިންޑް ކުރުމަށް މި ބަޓަން ފިއްތާފައި ބަހައްޓާށެވެ .';

  @override
  String get deviceControlSearchTutorialText =>
      'ކްލިކް ވީލްގެ ވަށައިގެން އިނގިލި ލުއިކޮށް އަކުރެއް ހައިލައިޓް ކުރުމަށް ގެންދިއުން';

  @override
  String get centerButtonSearchTutorialText =>
      'ހައިލައިޓް ކޮށްފައިވާ އަކުރުތައް ހޮވަން ސެންޓަރ ބަޓަން ފިއްތާލާށެވެ .';

  @override
  String get nextButtonSearchTutorialText =>
      'މި ބަޓަން ފިއްތާލުމުން ޖާގައެއް އިތުރު ކުރެވޭނެއެވެ .';

  @override
  String get previousButtonSearchTutorialText =>
      'އެންމެ ފަހު އަކުރު ޑިލީޓް ކުރުމަށް މި ބަޓަން ފިއްތާލާށެވެ .';

  @override
  String get menuButtonSearchTutorialText =>
      'މި ބަޓަން ފިއްތާލުމުން ކީބޯޑް ބަންދުކޮށް ސަރޗް ނަތީޖާތަކާ މުޢާމަލާތު ކުރުން';
}
