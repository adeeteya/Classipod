// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Silesian (`szl`).
class AppLocalizationsSzl extends AppLocalizations {
  AppLocalizationsSzl([String locale = 'szl']) : super(locale);

  @override
  String get appTitle => 'Klasyfikacyjo';

  @override
  String get menuButtonText => 'BEENUU; IENEU';

  @override
  String get audioAccessPermissionTitle => 'Dostymp do Audis Permis Wymogajōm sie';

  @override
  String get audioAccessPermissionContent => 'Proszymy prziznać pliki audio, coby przizwolić nōm na ôdtworzynie plikōw muzycznych.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Audio Access Persmisyjo Zuczano';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Proszymy prziznać pliki audio do tyj aplikacyje w ustawiyniach maszin, coby przizwolić nōm na ôdtworzynie plikōw muzycznych.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Muzyka';

  @override
  String get nowPlayingScreenTitle => 'Terŏz Granie';

  @override
  String get shuffleSongsMenuTitle => 'Śpiyczka';

  @override
  String get shuffleSettingTitle => 'Wykozać; niy wymimo';

  @override
  String get settingsScreenTitle => 'Ustawiynia';

  @override
  String get aboutScreenTitle => 'Ô';

  @override
  String get coverFlowScreenTitle => 'Pokryj Flowo';

  @override
  String get artistsScreenTitle => 'artykuł';

  @override
  String get albumsScreenTitle => 'Ôgōlnie';

  @override
  String get songsScreenTitle => 'Zażyczki';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Śpiywki',
      one: '1 Śpiywka',
      zero: 'Brak śpiywek',
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
      other: '$countString Albumy',
      one: '1 Album',
      zero: 'Brak albumōw',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Pożyki';

  @override
  String get genreSongsScreenTitle => 'Ślemy';

  @override
  String get deviceColorSettingTitle => 'Darta Kolorek';

  @override
  String get touchScreenSettingTitle => 'Dołōnczynie ekranu Eklamyntu';

  @override
  String get repeatModeSettingTitle => 'Powtorzać';

  @override
  String get repeatModeOne => 'Jedyn';

  @override
  String get repeatModeAll => 'Wszysko';

  @override
  String get vibrateSettingTitle => 'Narōj';

  @override
  String get clickWheelSettingTitle => 'Kliknij Wheel Sounds';

  @override
  String get splitScreenSettingTitle => 'Tryb spliny ekranu';

  @override
  String get touchSoundsDialogTitle => 'Doświyżōne dźwiyrze';

  @override
  String get touchSoundsDialogContent => 'Proszymy Enuble dźwiynki z Ustawiyń Systymu, coby usłyszeć klangy koła klikniyńcio';

  @override
  String get immersiveModeSettingTitle => 'Tymeracyjny mrōwno';

  @override
  String get showAppTutorialSettingTitle => 'Wykoże Twojisty';

  @override
  String get changeDirectorySettingTitle => 'Dyrektoryjo zmiynio';

  @override
  String get donateSettingTitle => 'Podarować';

  @override
  String get donateSettingDescription => 'Jeźli ci sie podobo ta aplikacyjo, proszōm, rozwożaj podarowanie.';

  @override
  String get versionAboutScreenTitle => 'Wersyjo';

  @override
  String get madeWithLoveTitle => 'Wykōnane z ❤️ bez';

  @override
  String get noMusicFilesFound => 'Żodna';

  @override
  String get noArtistsFound => 'Brak';

  @override
  String get noAlbumsFound => 'Żodyn Albumy';

  @override
  String get unknownSong => 'Niyznōmy Song';

  @override
  String get unknownArtist => 'Niyznōmy artysta';

  @override
  String get unknownAlbum => 'Niyznōmy Albam';

  @override
  String get unknownGenre => 'Niyznōmy Genre';

  @override
  String get buttonConfirmText => 'OK';

  @override
  String get tileValueOn => 'Na';

  @override
  String get tileValueOff => 'Wyłōnczōny';

  @override
  String get commonOfText => 'z';

  @override
  String get pageNotFoundText => 'Dowoga niy była znojdziōno';

  @override
  String get commonErrorText => 'Błōnd';

  @override
  String get retryButtonText => 'Retrya';

  @override
  String get filePickerDialogTitle => 'Wybierz Dyrektory do Skanu za Music';

  @override
  String get searchScreenTitle => 'Szukej';

  @override
  String get searchEmptyText => 'Żodnego Wynikōw Spośrōd Wyszukowanio';

  @override
  String get searchResultsText => 'Wyniki Wyszukowanio:';

  @override
  String get resultsForText => 'Wyniki dlo:';

  @override
  String get disableBatteryOptimizationTitle => 'Wyłōnczyć ôptymalizacyjo baterii';

  @override
  String get disableBatteryOptimizationContent => 'Proszymy wyłōnczyć ôptymalizacyjo baterije do tyj aplikacyje w ustawiyniach maszin, coby przizwolić na ôdtworzynie muzyki.';

  @override
  String get languageScreenTitle => 'Jynzyk';

  @override
  String get silverDeviceColor => 'Strzybro';

  @override
  String get blackDeviceColor => 'Czorny';

  @override
  String get resetSettingsTitle => 'Rozwiōnzania Reset';

  @override
  String get browseArtist => 'Namiyńdź Arysta';

  @override
  String get browseAlbum => 'Bliźniynie';

  @override
  String get cancelText => 'Pociepnōńć';

  @override
  String get playlistsScreenTitle => 'Pōłwysōb';

  @override
  String get addToOnTheGoPlaylist => 'Przidej do On-The-Go';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Przidej Album do On-Go';

  @override
  String get removeSongFromThePlaylist => 'Usuwać facelisty';

  @override
  String get allAlbums => 'Wszyjske Albumy';

  @override
  String get scanningMusicFiles => 'Śmiych Muzyka Filczy';

  @override
  String get newPlaylist => 'Nowilika';

  @override
  String get savePlaylist => 'Bezpiyar';

  @override
  String get clearPlaylist => 'Klasztowany';

  @override
  String get rescanMusicFilesSettingTitle => 'Reskanowe File';

  @override
  String get deviceControlMenuTutorialText => 'Przesuń kciuk lekko naôbkoło Kliknijnego Koła, coby nawigować w menu';

  @override
  String get centerButtonMenuTutorialText => 'Naciśnij strzodkowy knop, coby wybrać podświytlōny przedmiot menu';

  @override
  String get playPauseMenuTutorialText => 'Naciśnij tyn guzicz, coby grać abo zatrzymać śpiywka';

  @override
  String get nextButtonMenuTutorialText => 'Naciśnij tyn guzicz, coby przeskoczyć na dalszo śpiywka';

  @override
  String get previousButtonMenuTutorialText => 'Naciśnij tyn guzicz, coby ôdpoczyńć abo wrōcić do piyrwyjszyj śpiywki';

  @override
  String get menuButtonTutorialText => 'Naciśnij tyn guzik, coby wrōcić do piyrwyjszego menu. Mogbyś nacisnōńć i utrzimać go z jakigo ino inkszygo ekranu, coby dyrekt iść do głōwnego menu.';

  @override
  String get deviceScreenMenuTutorialText => 'To je ekran wyświytlanio. Trybek ekranu ekranu i ekranu ekranu sōm domyślnie włōnczōne i mogōm być skōnfigurowane dalij w ustawiyniach.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Przesuń kciuk naôbkoło Kliknijnego Koła, coby przipasować głośność';

  @override
  String get centerButtonNowPlayingTutorialText => 'Naciśnij knopka Cyntrum, coby cyklować bez szukanie baru, szlangu i suwak shuffle. Naciśnij i utrzimuj knopka Cyntrum, coby dostymp do ekstra ôpcyjōw.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Naciśnij i trzymaj tyn guzicz, coby wartko do przodka śpiywka';

  @override
  String get previousButtonNowPlayingTutorialText => 'Naciśnij i trzymaj tyn guzicz, coby ôdtworzić śpiywka';

  @override
  String get deviceControlSearchTutorialText => 'Przesuń kciuka lekko naôbkoło Kliknij, coby podświytlić abecadło';

  @override
  String get centerButtonSearchTutorialText => 'Naciśnij cyntralny knop, coby wybrać podkreślōny alfabet';

  @override
  String get nextButtonSearchTutorialText => 'Naciśnij tyn guzicz, coby przidać przestrzyń';

  @override
  String get previousButtonSearchTutorialText => 'Naciśnij tyn guzicz, coby ususić ôstatni postać';

  @override
  String get menuButtonSearchTutorialText => 'Naciśnij tyn guzicz, coby zawrzić klawiatura i wchodzić w interakcyjo z wynikami poszukowanio';
}
