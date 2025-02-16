// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Lithuanian (`lt`).
class AppLocalizationsLt extends AppLocalizations {
  AppLocalizationsLt([String locale = 'lt']) : super(locale);

  @override
  String get appTitle => 'Klasipodas';

  @override
  String get menuButtonText => 'Meniu';

  @override
  String get audioAccessPermissionTitle => 'Reikalingas garso prieigos leidimas';

  @override
  String get audioAccessPermissionContent => 'Suteikite garso failų prieigą, kad galėtume leisti mums jūsų muzikos failus.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Garso prieigos leidimas paneigtas';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Prašome suteikti šios programos garso failų prieigą įrenginio nustatymuose, kad galėtume atkurti jūsų muzikos failus.';

  @override
  String get menuScreenTitle => 'Meniu';

  @override
  String get musicMenuScreenTitle => 'Muzika';

  @override
  String get nowPlayingScreenTitle => 'Dabar žaidžia';

  @override
  String get shuffleSongsMenuTitle => 'Sumaišykite dainas';

  @override
  String get shuffleSettingTitle => 'Maišymas';

  @override
  String get settingsScreenTitle => 'Nustatymai';

  @override
  String get aboutScreenTitle => 'Apie';

  @override
  String get coverFlowScreenTitle => 'Dangčio srautas';

  @override
  String get artistsScreenTitle => 'Menininkai';

  @override
  String get albumsScreenTitle => 'Albumai';

  @override
  String get songsScreenTitle => 'Dainos';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Dainos',
      one: '1 daina',
      zero: 'be dainų',
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
      other: '$countString albumai',
      one: '1 albumas',
      zero: 'be albumų',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Žanrai';

  @override
  String get genreSongsScreenTitle => 'Žanro dainos';

  @override
  String get deviceColorSettingTitle => 'Įrenginio spalva';

  @override
  String get touchScreenSettingTitle => 'Įjungtas jutiklinis ekranas';

  @override
  String get repeatModeSettingTitle => 'Pakartoti';

  @override
  String get repeatModeOne => 'Vienas';

  @override
  String get repeatModeAll => 'Viskas';

  @override
  String get vibrateSettingTitle => 'Vibruoti';

  @override
  String get clickWheelSettingTitle => 'Spustelėkite ratų garsus';

  @override
  String get splitScreenSettingTitle => 'Padalijimo ekrano režimas';

  @override
  String get touchSoundsDialogTitle => 'Palieskite garsus';

  @override
  String get touchSoundsDialogContent => 'Įgalinkite „System Settings“ liesti garsus, kad išgirstumėte paspaudimo rato garsus';

  @override
  String get immersiveModeSettingTitle => 'Smegimo režimas';

  @override
  String get showAppTutorialSettingTitle => 'Parodykite vadovėlį';

  @override
  String get changeDirectorySettingTitle => 'Keisti katalogą';

  @override
  String get donateSettingTitle => 'Paaukoti';

  @override
  String get donateSettingDescription => 'Jei jums patinka ši programa, apsvarstykite galimybę aukoti.';

  @override
  String get versionAboutScreenTitle => 'Versija';

  @override
  String get madeWithLoveTitle => 'Pagaminta su ❤️';

  @override
  String get noMusicFilesFound => 'Nėra muzikos';

  @override
  String get noArtistsFound => 'Nėra menininkų';

  @override
  String get noAlbumsFound => 'Nėra albumų';

  @override
  String get unknownSong => 'Nežinoma daina';

  @override
  String get unknownArtist => 'Nežinomas menininkas';

  @override
  String get unknownAlbum => 'Nežinomas albumas';

  @override
  String get unknownGenre => 'Nežinomas žanras';

  @override
  String get buttonConfirmText => 'Gerai';

  @override
  String get tileValueOn => 'Ant';

  @override
  String get tileValueOff => 'Išjungtas';

  @override
  String get commonOfText => 'iš';

  @override
  String get pageNotFoundText => 'Pateiktas puslapis nebuvo rastas';

  @override
  String get commonErrorText => 'Klaida';

  @override
  String get retryButtonText => 'Bandyti';

  @override
  String get filePickerDialogTitle => 'Pasirinkite katalogą, kurį norite nuskaityti muzikai';

  @override
  String get searchScreenTitle => 'Ieškoti';

  @override
  String get searchEmptyText => 'Nėra paieškos rezultatų';

  @override
  String get searchResultsText => 'Paieškos rezultatai:';

  @override
  String get resultsForText => 'Rezultatai:';

  @override
  String get disableBatteryOptimizationTitle => 'Išjunkite akumuliatoriaus optimizavimą';

  @override
  String get disableBatteryOptimizationContent => 'Išjunkite šios programos akumuliatoriaus optimizavimą įrenginio nustatymuose, kad būtų galima atkurti muziką.';

  @override
  String get languageScreenTitle => 'Kalba';

  @override
  String get silverDeviceColor => 'Sidabras';

  @override
  String get blackDeviceColor => 'Juodas';

  @override
  String get resetSettingsTitle => 'Iš naujo nustatymai';

  @override
  String get browseArtist => 'Naršykite menininką';

  @override
  String get browseAlbum => 'Naršyti albumą';

  @override
  String get cancelText => 'Atšaukti';

  @override
  String get playlistsScreenTitle => 'Grojaraščiai';

  @override
  String get addToOnTheGoPlaylist => 'Pridėkite prie kelio';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Pridėkite albumą į „On-Go“';

  @override
  String get removeSongFromThePlaylist => 'Išimkite iš grojaraščio';

  @override
  String get allAlbums => 'Visi albumai';

  @override
  String get scanningMusicFiles => 'Nuskaitydami muzikos failus';

  @override
  String get newPlaylist => 'Naujas grojaraštis';

  @override
  String get savePlaylist => 'Išsaugokite grojaraštį';

  @override
  String get clearPlaylist => 'Aiškus grojaraštis';

  @override
  String get rescanMusicFilesSettingTitle => '„Rescan“ muzikos failai';

  @override
  String get deviceControlMenuTutorialText => 'Norėdami naršyti po meniu';

  @override
  String get centerButtonMenuTutorialText => 'Paspauskite mygtuką Centru, kad pasirinktumėte paryškintą meniu elementą';

  @override
  String get playPauseMenuTutorialText => 'Paspauskite šį mygtuką, kad atkurtumėte arba pristabdytumėte dainą';

  @override
  String get nextButtonMenuTutorialText => 'Paspauskite šį mygtuką, jei norite pereiti prie kitos dainos';

  @override
  String get previousButtonMenuTutorialText => 'Paspauskite šį mygtuką, kad atsuktumėte atsukimą arba grįžtumėte į ankstesnę dainą';

  @override
  String get menuButtonTutorialText => 'Paspauskite šį mygtuką, kad grįžtumėte į ankstesnį meniu. Galite paspausti ir laikyti jį iš bet kurio kito ekrano, kad galėtumėte tiesiogiai pereiti į pagrindinį meniu.';

  @override
  String get deviceScreenMenuTutorialText => 'Tai yra ekranas. Jutiklinio ekrano ir padalijimo ekrano režimas įjungtas pagal numatytuosius nustatymus ir gali būti sukonfigūruotas toliau nustatymuose.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Norėdami sureguliuoti garsumą, perkelkite nykštį aplink paspaudimo ratą';

  @override
  String get centerButtonNowPlayingTutorialText => 'Paspauskite centrinį mygtuką, kad važiuotumėte važiuodami per „Seew Bar“, „Scrubber“ juostą ir „Shuffle Slider“. Paspauskite ir palaikykite centrinį mygtuką, kad pasiektumėte papildomas parinktis.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Paspauskite ir palaikykite šį mygtuką, kad greitai persiųstų dainą';

  @override
  String get previousButtonNowPlayingTutorialText => 'Paspauskite ir palaikykite šį mygtuką, kad vėl atstumtumėte dainą';

  @override
  String get deviceControlSearchTutorialText => 'Lengvai judinkite nykštį aplink paspaudimo ratą, kad paryškintumėte abėcėlę';

  @override
  String get centerButtonSearchTutorialText => 'Paspauskite mygtuką Centrinis, kad pasirinktumėte paryškintą abėcėlę';

  @override
  String get nextButtonSearchTutorialText => 'Paspauskite šį mygtuką, kad pridėtumėte vietos';

  @override
  String get previousButtonSearchTutorialText => 'Paspauskite šį mygtuką, kad ištrintumėte paskutinį simbolią';

  @override
  String get menuButtonSearchTutorialText => 'Paspauskite šį mygtuką, kad uždarytumėte klaviatūrą ir sąveikaujtumėte su paieškos rezultatais';
}
