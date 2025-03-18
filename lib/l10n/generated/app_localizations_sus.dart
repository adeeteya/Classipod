// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Susu (`sus`).
class AppLocalizationsSus extends AppLocalizations {
  AppLocalizationsSus([String locale = 'sus']) : super(locale);

  @override
  String get appTitle => 'Khi';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle =>
      'Audio xa walie nan lanma a xa raba .';

  @override
  String get audioAccessPermissionContent =>
      'Wo xa yi bukie rawali alako wo xa nɔ wo xa kɔrae rawalide.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Audio xa wali xunmasafe .';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Wo xa yi appli xa fe fala yi luti ma alako wo xa nɔ wo xa sigie rawalide.';

  @override
  String get menuScreenTitle => 'mou';

  @override
  String get musicMenuScreenTitle => 'Sigui';

  @override
  String get nowPlayingScreenTitle => 'Awa, yi pirinti .';

  @override
  String get shuffleSongsMenuTitle => 'Shuffle xa sigi';

  @override
  String get shuffleSettingTitle => 'cé nakhan cé na .';

  @override
  String get settingsScreenTitle => 'settings';

  @override
  String get aboutScreenTitle => 'Micé afé';

  @override
  String get coverFlowScreenTitle => 'Wo xa Flow .';

  @override
  String get artistsScreenTitle => 'Artikè';

  @override
  String get albumsScreenTitle => 'Albulu';

  @override
  String get songsScreenTitle => 'Yi sigi';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString sigi',
      one: '1 Sigui',
      zero: 'sigi yo mu na',
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
      other: '$countString Albume',
      one: '1 Album',
      zero: 'Album yo mu na',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Gérésé';

  @override
  String get genreSongsScreenTitle => 'Genre xa sigi';

  @override
  String get deviceColorSettingTitle => 'Device Color';

  @override
  String get touchScreenSettingTitle => 'Touch screen naxa a rawali .';

  @override
  String get repeatModeSettingTitle => 'Gbelinfé ama';

  @override
  String get repeatModeOne => 'Kerén';

  @override
  String get repeatModeAll => 'Ebirin';

  @override
  String get vibrateSettingTitle => 'atoma';

  @override
  String get clickWheelSettingTitle => 'Wo yi buki mato .';

  @override
  String get splitScreenSettingTitle => 'Split screen Mode';

  @override
  String get touchSoundsDialogTitle => 'Touch sounds';

  @override
  String get touchSoundsDialogContent =>
      'Wo xa yi luti yusi kelife System Paramètres ma alako wo xa na xui ramɛ .';

  @override
  String get immersiveModeSettingTitle => 'Yi Mode dan a sago';

  @override
  String get showAppTutorialSettingTitle => 'Wo xa Tutori .';

  @override
  String get changeDirectorySettingTitle => 'Direktere masarafe';

  @override
  String get donateSettingTitle => 'Fi';

  @override
  String get donateSettingDescription =>
      'Xa wo wama yi appli xɔn, wo xa wo ɲɔxɔ sa a ma.';

  @override
  String get versionAboutScreenTitle =>
      'Fé falaki Évolution fé ma siguè ya ré ma';

  @override
  String get madeWithLoveTitle => 'A rafalaxi ❤️ nan na .';

  @override
  String get noMusicFilesFound => 'Musiki mu na .';

  @override
  String get noArtistsFound => 'Artiste yo mu na';

  @override
  String get noAlbumsFound => 'Albums yo mu na';

  @override
  String get unknownSong => 'Naxan mu kolonxi .';

  @override
  String get unknownArtist => 'Artist naxan mu kolonxi';

  @override
  String get unknownAlbum => 'Album mu nu kolonxi .';

  @override
  String get unknownGenre => 'Genre naxan kolonxi';

  @override
  String get buttonConfirmText => 'TIN';

  @override
  String get tileValueOn => 'Afari';

  @override
  String get tileValueOff => 'Dounougna';

  @override
  String get commonOfText => 'kha';

  @override
  String get pageNotFoundText => 'Na buki naxan fixi, a mu toxi .';

  @override
  String get commonErrorText => 'Tantanyi';

  @override
  String get retryButtonText => 'na ba fé';

  @override
  String get filePickerDialogTitle =>
      'Wo xa Directory sugandi Scan for Music .';

  @override
  String get searchScreenTitle => 'Fenfé';

  @override
  String get searchEmptyText => 'Fe fenfe yo mu na .';

  @override
  String get searchResultsText => 'Fe fenfe:';

  @override
  String get resultsForText => 'Yi buki xaranfe:';

  @override
  String get disableBatteryOptimizationTitle => 'Bateri naxan mu kanama .';

  @override
  String get disableBatteryOptimizationContent =>
      'Wo xa yi appli xa fe rawali ki fanyi ra alako wo xa nɔ wo xa kɔrae rawalide.';

  @override
  String get languageScreenTitle => 'Nènyi';

  @override
  String get silverDeviceColor => 'Kobiri';

  @override
  String get blackDeviceColor => 'A forè';

  @override
  String get resetSettingsTitle => 'Reset Settings';

  @override
  String get browseArtist => 'Wo yi buki mato';

  @override
  String get browseAlbum => 'Wo xa Album mato .';

  @override
  String get cancelText => 'abama';

  @override
  String get playlistsScreenTitle => 'Playa';

  @override
  String get addToOnTheGoPlaylist => 'Wo xa On-The-Go .';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Wo xa Album sa On-The-Go .';

  @override
  String get removeSongFromThePlaylist => 'Wo xa na buki rawali .';

  @override
  String get allAlbums => 'Alɔ Kitaabui birin';

  @override
  String get scanningMusicFiles => 'Scanning Musiki .';

  @override
  String get newPlaylist => 'Nougandi';

  @override
  String get savePlaylist => 'Wo xa yi luti yusi';

  @override
  String get clearPlaylist => 'Klear xa fe .';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan xa sigie';

  @override
  String get deviceControlMenuTutorialText =>
      'Wo xa wo bɛlɛxɛsole ragoro Click Wheel rabilinyi alako wo xa na donse rawali .';

  @override
  String get centerButtonMenuTutorialText =>
      'Wo xa na button makɔrɛ alako wo xa na buki sugandi .';

  @override
  String get playPauseMenuTutorialText =>
      'Wo yi button makɔrɛ alako wo xa sigi sa xa na mu wo xa sigi sa .';

  @override
  String get nextButtonMenuTutorialText =>
      'Wo yi button makɔrɛ alako wo xa siga na sigi naxan fama .';

  @override
  String get previousButtonMenuTutorialText =>
      'Wo yi button makɔrɛ alako wo xa gbilen na sigi fori ma .';

  @override
  String get menuButtonTutorialText =>
      'Wo yi button makɔrɛ alako wo xa gbilen na menu fori ma. Wo nɔma a dinde wo xa a suxu, wo xa a suxu alako wo xa siga a rawalide a fanyi ra.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Na nan a ra, yi buki xaranfe. Touch Screen nun Split Screen Mode naxa a rawali a fanyi ra, a man nɔma rawalide a gbengbenyi a xa walie kui.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Wo xa wo furi ragoro Click Wheel ma alako wo xa na buki rawali .';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Wo xa Centre xa button makɔrɛ alako wo xa nɔ wo xa bar, wo xa scrubber bar nun wo xa shuffle slider rawali. Wo yi buki rawali alako wo xa nɔ yi buki rawalide.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Wo yi button makɔrɛ alako wo xa na sigi rawali mafuren .';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Wo yi buki ragoro wo ma alako wo xa na sigi rawali .';

  @override
  String get deviceControlSearchTutorialText =>
      'Wo xa wo bɛlɛxɛsole ragoro Click Wheel ma alako wo xa alfabe masen .';

  @override
  String get centerButtonSearchTutorialText =>
      'Wo xa na button makɔrɛ alako wo xa na sɛbɛli sugandi naxan xili alphabet .';

  @override
  String get nextButtonSearchTutorialText =>
      'Wo yi button makɔrɛ alako wo xa yire nde sa a ma .';

  @override
  String get previousButtonSearchTutorialText =>
      'Wo yi button makɔrɛ alako wo xa na sɛbɛli dɔnxɔɛ raxara .';

  @override
  String get menuButtonSearchTutorialText =>
      'Wo yi button makɔrɛ alako wo xa na buki balan anun wo xa wo maso na fe fenfe ra .';

  @override
  String get allSongs => 'Na sigi birin';
}
