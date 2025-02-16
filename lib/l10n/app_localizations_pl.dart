// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Classipod';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle => 'Wymagane pozwolenie na dostęp do dźwięku';

  @override
  String get audioAccessPermissionContent => 'Udaj dostęp do plików audio, aby umożliwić nam odtwarzanie plików muzycznych.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Odmowa uprawnienia do dostępu do dźwięku';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Udostępnij dostęp do plików audio dla tej aplikacji w ustawieniach urządzenia, aby umożliwić nam odtwarzanie plików muzycznych.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Muzyka';

  @override
  String get nowPlayingScreenTitle => 'Teraz gra';

  @override
  String get shuffleSongsMenuTitle => 'Piosenki Shuffle';

  @override
  String get shuffleSettingTitle => 'Człapać';

  @override
  String get settingsScreenTitle => 'Ustawienia';

  @override
  String get aboutScreenTitle => 'O';

  @override
  String get coverFlowScreenTitle => 'Przepływ pokrycia';

  @override
  String get artistsScreenTitle => 'Artyści';

  @override
  String get albumsScreenTitle => 'Albumy';

  @override
  String get songsScreenTitle => 'Piosenki';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Piosenki',
      one: '1 Piosenki',
      zero: 'brak piosenek',
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
      other: '$countString albumy',
      one: '1 album',
      zero: 'bez albumów',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Gatunki';

  @override
  String get genreSongsScreenTitle => 'Piosenki gatunku';

  @override
  String get deviceColorSettingTitle => 'Kolor urządzenia';

  @override
  String get touchScreenSettingTitle => 'Włączony ekran dotykowy';

  @override
  String get repeatModeSettingTitle => 'Powtarzać';

  @override
  String get repeatModeOne => 'Jeden';

  @override
  String get repeatModeAll => 'Wszystko';

  @override
  String get vibrateSettingTitle => 'Wibrować';

  @override
  String get clickWheelSettingTitle => 'Kliknij dźwięki koła';

  @override
  String get splitScreenSettingTitle => 'Tryb podzielonego ekranu';

  @override
  String get touchSoundsDialogTitle => 'Dotknij dźwięków';

  @override
  String get touchSoundsDialogContent => 'Włącz dźwięki dotykowe z ustawień systemu, aby usłyszeć dźwięki kliknięć';

  @override
  String get immersiveModeSettingTitle => 'Tryb wciągający';

  @override
  String get showAppTutorialSettingTitle => 'Samouczek pokazowy';

  @override
  String get changeDirectorySettingTitle => 'Zmień katalog';

  @override
  String get donateSettingTitle => 'Podarować';

  @override
  String get donateSettingDescription => 'Jeśli podoba Ci się ta aplikacja, rozważ darowiznę.';

  @override
  String get versionAboutScreenTitle => 'Wersja';

  @override
  String get madeWithLoveTitle => 'Wykonane z ❤️';

  @override
  String get noMusicFilesFound => 'Brak muzyki';

  @override
  String get noArtistsFound => 'Brak artystów';

  @override
  String get noAlbumsFound => 'Brak albumów';

  @override
  String get unknownSong => 'Nieznana piosenka';

  @override
  String get unknownArtist => 'Nieznany artysta';

  @override
  String get unknownAlbum => 'Nieznany album';

  @override
  String get unknownGenre => 'Nieznany gatunek';

  @override
  String get buttonConfirmText => 'OK';

  @override
  String get tileValueOn => 'NA';

  @override
  String get tileValueOff => 'Wyłączony';

  @override
  String get commonOfText => 'z';

  @override
  String get pageNotFoundText => 'Dana strona nie została znaleziona';

  @override
  String get commonErrorText => 'Błąd';

  @override
  String get retryButtonText => 'Spróbować ponownie';

  @override
  String get filePickerDialogTitle => 'Wybierz katalog, aby skanować muzykę';

  @override
  String get searchScreenTitle => 'Szukaj';

  @override
  String get searchEmptyText => 'Brak wyników wyszukiwania';

  @override
  String get searchResultsText => 'Wyniki wyszukiwania:';

  @override
  String get resultsForText => 'Wyniki dla:';

  @override
  String get disableBatteryOptimizationTitle => 'Wyłącz optymalizację baterii';

  @override
  String get disableBatteryOptimizationContent => 'Wyłącz optymalizację baterii dla tej aplikacji w ustawieniach urządzenia, aby umożliwić odtwarzanie muzyki w tle.';

  @override
  String get languageScreenTitle => 'Język';

  @override
  String get silverDeviceColor => 'Srebrny';

  @override
  String get blackDeviceColor => 'Czarny';

  @override
  String get resetSettingsTitle => 'Zresetuj ustawienia';

  @override
  String get browseArtist => 'Przeglądaj artystę';

  @override
  String get browseAlbum => 'Przeglądaj album';

  @override
  String get cancelText => 'Anulować';

  @override
  String get playlistsScreenTitle => 'Listy odtwarzania';

  @override
  String get addToOnTheGoPlaylist => 'Dodaj do podróży';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Dodaj album do gości';

  @override
  String get removeSongFromThePlaylist => 'Usuń z listy odtwarzania';

  @override
  String get allAlbums => 'Wszystkie albumy';

  @override
  String get scanningMusicFiles => 'Skanowanie plików muzycznych';

  @override
  String get newPlaylist => 'Nowa lista odtwarzania';

  @override
  String get savePlaylist => 'Zapisz listę odtwarzania';

  @override
  String get clearPlaylist => 'Clear Playlist';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan Music Files';

  @override
  String get deviceControlMenuTutorialText => 'Lekko przesuń kciuk wokół kliknięcia, aby poruszać się po menu';

  @override
  String get centerButtonMenuTutorialText => 'Naciśnij przycisk środkowy, aby wybrać podświetlony element menu';

  @override
  String get playPauseMenuTutorialText => 'Naciśnij ten przycisk, aby odtwarzać lub zatrzymać piosenkę';

  @override
  String get nextButtonMenuTutorialText => 'Naciśnij ten przycisk, aby przejść do następnej piosenki';

  @override
  String get previousButtonMenuTutorialText => 'Naciśnij ten przycisk, aby przewidzieć lub wróć do poprzedniej piosenki';

  @override
  String get menuButtonTutorialText => 'Naciśnij ten przycisk, aby wrócić do poprzedniego menu. Możesz nacisnąć i przytrzymać z dowolnego innego ekranu, aby bezpośrednio przejść do menu głównego.';

  @override
  String get deviceScreenMenuTutorialText => 'To jest ekran wyświetlania. Tryb ekranu dotknięcia i podzielony ekran są domyślnie włączone i mogą być skonfigurowane dalej w ustawieniach.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Przesuń kciuk wokół koła kliknięcia, aby dostosować głośność';

  @override
  String get centerButtonNowPlayingTutorialText => 'Naciśnij przycisk środkowy, aby przełączać się przez pasek Seek, pasek do szorowania i suwaka do przetasowania. Naciśnij i przytrzymaj przycisk środkowy, aby uzyskać dostęp do dodatkowych opcji.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Naciśnij i przytrzymaj ten przycisk, aby szybko przekazać piosenkę';

  @override
  String get previousButtonNowPlayingTutorialText => 'Naciśnij i przytrzymaj ten przycisk, aby przewidzieć piosenkę';

  @override
  String get deviceControlSearchTutorialText => 'Lekko przesuń kciuk wokół kliknięcia, aby podświetlić alfabet';

  @override
  String get centerButtonSearchTutorialText => 'Naciśnij przycisk środkowy, aby wybrać podświetlony alfabet';

  @override
  String get nextButtonSearchTutorialText => 'Naciśnij ten przycisk, aby dodać miejsce';

  @override
  String get previousButtonSearchTutorialText => 'Naciśnij ten przycisk, aby usunąć ostatnią postać';

  @override
  String get menuButtonSearchTutorialText => 'Naciśnij ten przycisk, aby zamknąć klawiaturę i wchodzić w interakcje z wynikami wyszukiwania';
}
