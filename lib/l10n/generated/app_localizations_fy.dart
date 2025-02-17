// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Western Frisian (`fy`).
class AppLocalizationsFy extends AppLocalizations {
  AppLocalizationsFy([String locale = 'fy']) : super(locale);

  @override
  String get appTitle => 'Klassifod';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle => 'AUDIO Tagong tastimming fereaske';

  @override
  String get audioAccessPermissionContent =>
      'GRAGJE AUDIO BESLAAPT TAYS TO FERGESE OM FILL OM JOU MUSIEBILDS SPELLEN.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Audio tagongsrjochten wegere';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'GRAG FERGESE AUDIO BESLAADY TAGTEN FAN DIT APP IN DE FERGESJOCHTSJOCHTEN OM FS TO LJOCHT OM JOU MUSIE BILDS SPELLEN.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Muzyk';

  @override
  String get nowPlayingScreenTitle => 'No boartsje';

  @override
  String get shuffleSongsMenuTitle => 'Shuffle Songs';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Ynstellings';

  @override
  String get aboutScreenTitle => 'Oer';

  @override
  String get coverFlowScreenTitle => 'Cover stream';

  @override
  String get artistsScreenTitle => 'Keunstners';

  @override
  String get albumsScreenTitle => 'Albums';

  @override
  String get songsScreenTitle => 'Songs';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Songs',
      one: '1 Song',
      zero: 'NO Songs',
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
      zero: 'No Albums',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Sjenres';

  @override
  String get genreSongsScreenTitle => 'Sjenre Songs';

  @override
  String get deviceColorSettingTitle => 'Apparaatkleur';

  @override
  String get touchScreenSettingTitle => 'TROCH-skerm ynskeakele';

  @override
  String get repeatModeSettingTitle => 'Herhelje';

  @override
  String get repeatModeOne => 'Ien';

  @override
  String get repeatModeAll => 'Alle';

  @override
  String get vibrateSettingTitle => 'Trilje';

  @override
  String get clickWheelSettingTitle => 'Klikje op tsjil klinkt';

  @override
  String get splitScreenSettingTitle => 'Split skermmodus';

  @override
  String get touchSoundsDialogTitle => 'Touch lûden';

  @override
  String get touchSoundsDialogContent =>
      'Aktivearje asjebleaft touch lûden út systeemynstellingen om it klik te hearren';

  @override
  String get immersiveModeSettingTitle => 'Unmoleaze modus';

  @override
  String get showAppTutorialSettingTitle => 'Tutorial sjen litte';

  @override
  String get changeDirectorySettingTitle => 'Feroarje map';

  @override
  String get donateSettingTitle => 'Donearje';

  @override
  String get donateSettingDescription =>
      'As jo ​​dizze app leuk fine, beskôgje dan dat doneart.';

  @override
  String get versionAboutScreenTitle => 'Ferzje';

  @override
  String get madeWithLoveTitle => 'Makke mei ❤️ troch';

  @override
  String get noMusicFilesFound => 'Gjin muzyk';

  @override
  String get noArtistsFound => 'Gjin artysten';

  @override
  String get noAlbumsFound => 'Gjin albums';

  @override
  String get unknownSong => 'Ûnbidich ferske';

  @override
  String get unknownArtist => 'Unbekende artyst';

  @override
  String get unknownAlbum => 'Unbekind album';

  @override
  String get unknownGenre => 'Unbekend genre';

  @override
  String get buttonConfirmText => 'Ok';

  @override
  String get tileValueOn => 'Op';

  @override
  String get tileValueOff => 'Út';

  @override
  String get commonOfText => 'fan';

  @override
  String get pageNotFoundText => 'De opjûne pagina waard net fûn';

  @override
  String get commonErrorText => 'Fersin';

  @override
  String get retryButtonText => 'Twurkje';

  @override
  String get filePickerDialogTitle =>
      'Selektearje in map om te scannen foar muzyk';

  @override
  String get searchScreenTitle => 'Sykje';

  @override
  String get searchEmptyText => 'Gjin sykresultaten';

  @override
  String get searchResultsText => 'Sykresultaten:';

  @override
  String get resultsForText => 'Resultaten foar:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Batterij-optimalisaasje útskeakelje';

  @override
  String get disableBatteryOptimizationContent =>
      'Skeakelje asjebleaft Batterijoptimalisaasje foar dizze app yn \'e apparaatynstellingen om eftergrûnôfbylding fan muzyk tastean.';

  @override
  String get languageScreenTitle => 'Taal';

  @override
  String get silverDeviceColor => 'Sulver';

  @override
  String get blackDeviceColor => 'Swart';

  @override
  String get resetSettingsTitle => 'Ynstellings weromsette';

  @override
  String get browseArtist => 'Blêdzje troch artyst';

  @override
  String get browseAlbum => 'Browse album';

  @override
  String get cancelText => 'Opheffe';

  @override
  String get playlistsScreenTitle => 'Playlists';

  @override
  String get addToOnTheGoPlaylist => 'Taheakje oan oan \'e-Go';

  @override
  String get addAlbumToOnTheGoPlaylist => 'NEMMAAL tafoegje oan oan \'e-Go';

  @override
  String get removeSongFromThePlaylist => 'Ferwiderje fan \'e playlist';

  @override
  String get allAlbums => 'Alle albums';

  @override
  String get scanningMusicFiles => 'SCINS MUSIC-bestannen';

  @override
  String get newPlaylist => 'Nije playlist';

  @override
  String get savePlaylist => 'Spiellist opslaan';

  @override
  String get clearPlaylist => 'CLAYLIST wiskje';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan Music Bestannen';

  @override
  String get deviceControlMenuTutorialText =>
      'Ferpleatse jo tomme ljocht om it klikwiel om it menu te navigearjen';

  @override
  String get centerButtonMenuTutorialText =>
      'Druk op \'e CENTRE knop om it markearre menu-item te selektearjen';

  @override
  String get playPauseMenuTutorialText =>
      'Druk op dizze knop om in ferske te spyljen of te pausjen';

  @override
  String get nextButtonMenuTutorialText =>
      'Druk op dizze knop om te oerslaan nei it folgjende ferske';

  @override
  String get previousButtonMenuTutorialText =>
      'Druk op dizze knop om werom te reitsjen of werom te gean nei it foarige ferske';

  @override
  String get menuButtonTutorialText =>
      'Druk op dizze knop om werom te gean nei it foarige menu. Jo koene it op elk oar skerm drukke en hâlde om direkt nei it haadmenu te gean.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Dit is it skerm skerm. Touch Screen en SPLIT-skermmodus binne standert ynskeakele en kinne fierder ynskeakele wurde yn \'e ynstellingen.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Ferpleatse jo tomme om it klik tsjil om it folume oan te passen';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Druk op \'e sintrumknop om te fytsen troch te syklus, sykje, scrubberbar en shuffle Slider. Druk op en hâld de sintrumknop yn om tagong te krijen ta ekstra opsjes.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Druk op dizze knop en hâld op om it ferske te rapjen';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Druk op dizze knop en hâld op om it ferske werom te reitsjen';

  @override
  String get deviceControlSearchTutorialText =>
      'Ferpleatse jo tomme ljocht om it klik tsjil om in alfabet te markearjen';

  @override
  String get centerButtonSearchTutorialText =>
      'Druk op \'e sintrumknop om it markearre alfabet te selektearjen';

  @override
  String get nextButtonSearchTutorialText =>
      'Druk op dizze knop om in romte ta te foegjen';

  @override
  String get previousButtonSearchTutorialText =>
      'Druk op dizze knop om it lêste karakter te wiskjen';

  @override
  String get menuButtonSearchTutorialText =>
      'Druk op dizze knop om it toetseboerd te sluten en ynteraksje mei de sykresultaten te sluten';
}
