// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Icelandic (`is`).
class AppLocalizationsIs extends AppLocalizations {
  AppLocalizationsIs([String locale = 'is']) : super(locale);

  @override
  String get appTitle => 'Classipod';

  @override
  String get menuButtonText => 'Matseðill';

  @override
  String get audioAccessPermissionTitle => 'Hljóðaðgangsleyfi krafist';

  @override
  String get audioAccessPermissionContent => 'Vinsamlegast gefðu hljóðskrár aðgang til að leyfa okkur að spila tónlistarskrárnar þínar.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Hljóðaðgangsleyfi hafnað';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Vinsamlegast gefðu hljóðskrár aðgang fyrir þetta forrit í tækjastillingunum til að leyfa okkur að spila tónlistarskrárnar þínar.';

  @override
  String get menuScreenTitle => 'Matseðill';

  @override
  String get musicMenuScreenTitle => 'Tónlist';

  @override
  String get nowPlayingScreenTitle => 'Spila nú';

  @override
  String get shuffleSongsMenuTitle => 'Stokka lög';

  @override
  String get shuffleSettingTitle => 'Uppstokkun';

  @override
  String get settingsScreenTitle => 'Stillingar';

  @override
  String get aboutScreenTitle => 'Um';

  @override
  String get coverFlowScreenTitle => 'Kápa flæði';

  @override
  String get artistsScreenTitle => 'Listamenn';

  @override
  String get albumsScreenTitle => 'Plötur';

  @override
  String get songsScreenTitle => 'Lög';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Lög',
      one: '1 lag',
      zero: 'engin lög',
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
      other: '$countString Albúm',
      one: '1 albúm',
      zero: 'engin albúm',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Tegundir';

  @override
  String get genreSongsScreenTitle => 'Tegund lög';

  @override
  String get deviceColorSettingTitle => 'Litur tækisins';

  @override
  String get touchScreenSettingTitle => 'Snertiskjár virkur';

  @override
  String get repeatModeSettingTitle => 'Endurtaktu';

  @override
  String get repeatModeOne => 'Eitt';

  @override
  String get repeatModeAll => 'Allt';

  @override
  String get vibrateSettingTitle => 'Titra';

  @override
  String get clickWheelSettingTitle => 'Smelltu á hjól hljóð';

  @override
  String get splitScreenSettingTitle => 'Skipting skjástillingar';

  @override
  String get touchSoundsDialogTitle => 'Snertu hljóð';

  @override
  String get touchSoundsDialogContent => 'Vinsamlegast virkjaðu Touch Sounds frá kerfisstillingum til að heyra Click Wheel Sounds';

  @override
  String get immersiveModeSettingTitle => 'Yfirgripsmikil stilling';

  @override
  String get showAppTutorialSettingTitle => 'Sýna kennslu';

  @override
  String get changeDirectorySettingTitle => 'Breyta skráasafninu';

  @override
  String get donateSettingTitle => 'Gefðu';

  @override
  String get donateSettingDescription => 'Ef þér líkar vel við þetta forrit skaltu íhuga að gefa.';

  @override
  String get versionAboutScreenTitle => 'Útgáfa';

  @override
  String get madeWithLoveTitle => 'Búið til með ❤️ af';

  @override
  String get noMusicFilesFound => 'Engin tónlist';

  @override
  String get noArtistsFound => 'Engir listamenn';

  @override
  String get noAlbumsFound => 'Engar plötur';

  @override
  String get unknownSong => 'Óþekkt lag';

  @override
  String get unknownArtist => 'Óþekktur listamaður';

  @override
  String get unknownAlbum => 'Óþekkt plata';

  @override
  String get unknownGenre => 'Óþekkt tegund';

  @override
  String get buttonConfirmText => 'OK';

  @override
  String get tileValueOn => 'Á';

  @override
  String get tileValueOff => 'Off';

  @override
  String get commonOfText => 'af';

  @override
  String get pageNotFoundText => 'Gefin blaðsíða fannst ekki';

  @override
  String get commonErrorText => 'Villa';

  @override
  String get retryButtonText => 'Reyni aftur';

  @override
  String get filePickerDialogTitle => 'Veldu möppu til að skanna fyrir tónlist';

  @override
  String get searchScreenTitle => 'Leitaðu';

  @override
  String get searchEmptyText => 'Engar leitarniðurstöður';

  @override
  String get searchResultsText => 'Leitarniðurstöður:';

  @override
  String get resultsForText => 'Niðurstöður fyrir:';

  @override
  String get disableBatteryOptimizationTitle => 'Slökkva á hagræðingu rafhlöðunnar';

  @override
  String get disableBatteryOptimizationContent => 'Vinsamlegast slökktu á hagræðingu rafhlöðunnar fyrir þetta forrit í tækjastillingunum til að leyfa bakgrunnsspilun tónlistar.';

  @override
  String get languageScreenTitle => 'Tungumál';

  @override
  String get silverDeviceColor => 'Silfur';

  @override
  String get blackDeviceColor => 'Svartur';

  @override
  String get resetSettingsTitle => 'Endurstilla stillingar';

  @override
  String get browseArtist => 'Skoðaðu listamann';

  @override
  String get browseAlbum => 'Vafraðu plötu';

  @override
  String get cancelText => 'Hætta við';

  @override
  String get playlistsScreenTitle => 'Leiklistar';

  @override
  String get addToOnTheGoPlaylist => 'Bættu við á ferðinni';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Bættu plötu við á ferðinni';

  @override
  String get removeSongFromThePlaylist => 'Fjarlægðu af lagalistanum';

  @override
  String get allAlbums => 'Allar plötur';

  @override
  String get scanningMusicFiles => 'Skannar tónlistarskrár';

  @override
  String get newPlaylist => 'Nýr lagalisti';

  @override
  String get savePlaylist => 'Sparaðu lagalista';

  @override
  String get clearPlaylist => 'Skýr lagalisti';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan Music Files';

  @override
  String get deviceControlMenuTutorialText => 'Færðu þumalfingurinn létt um smellihjólið til að fletta í valmyndinni';

  @override
  String get centerButtonMenuTutorialText => 'Ýttu á miðjuhnappinn til að velja auðkennda valmyndaratriðið';

  @override
  String get playPauseMenuTutorialText => 'Ýttu á þennan hnapp til að spila eða gera hlé á lag';

  @override
  String get nextButtonMenuTutorialText => 'Ýttu á þennan hnapp til að sleppa í næsta lag';

  @override
  String get previousButtonMenuTutorialText => 'Ýttu á þennan hnapp til að spóla til baka eða fara aftur í fyrra lagið';

  @override
  String get menuButtonTutorialText => 'Ýttu á þennan hnapp til að fara aftur í fyrri valmyndina. Þú gætir ýtt á og haldið honum frá öðrum skjá til að fara beint í aðalvalmyndina.';

  @override
  String get deviceScreenMenuTutorialText => 'Þetta er skjárinn. Snertiskjár og skiptaskjárstilling eru sjálfgefin virk og hægt er að stilla þær frekar í stillingunum.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Færðu þumalfingurinn um smellihjólið til að stilla hljóðstyrkinn';

  @override
  String get centerButtonNowPlayingTutorialText => 'Ýttu á miðjuhnappinn til að hjóla í gegnum LEEK Bar, Scrubber Bar og stokka rennibraut. Haltu inni miðjuhnappnum til að fá aðgang að viðbótarvalkostum.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Haltu þessum hnapp til að halda laginu áfram';

  @override
  String get previousButtonNowPlayingTutorialText => 'Haltu þessum hnapp til að spóla til baka lagið';

  @override
  String get deviceControlSearchTutorialText => 'Færðu þumalfingurinn létt um smellihjólið til að auðkenna stafrófið';

  @override
  String get centerButtonSearchTutorialText => 'Ýttu á miðjuhnappinn til að velja auðkennda stafrófið';

  @override
  String get nextButtonSearchTutorialText => 'Ýttu á þennan hnapp til að bæta við rými';

  @override
  String get previousButtonSearchTutorialText => 'Ýttu á þennan hnapp til að eyða síðasta staf';

  @override
  String get menuButtonSearchTutorialText => 'Ýttu á þennan hnapp til að loka lyklaborðinu og hafa samskipti við leitarniðurstöðurnar';
}
