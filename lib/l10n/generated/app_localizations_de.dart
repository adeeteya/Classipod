// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Classipod';

  @override
  String get menuButtonText => 'SPEISEKARTE';

  @override
  String get audioAccessPermissionTitle =>
      'Erforderliche Genehmigung für Audiozugriff';

  @override
  String get audioAccessPermissionContent =>
      'Bitte gewähren Sie Audio -Dateien Zugriff, damit wir Ihre Musikdateien abspielen können.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Audiozugangserlaubnis abgelehnt';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Bitte gewähren Sie Audio -Dateien Zugriff für diese App in den Geräteeinstellungen, damit wir Ihre Musikdateien abspielen können.';

  @override
  String get menuScreenTitle => 'Speisekarte';

  @override
  String get musicMenuScreenTitle => 'Musik';

  @override
  String get nowPlayingScreenTitle => 'Jetzt spielen';

  @override
  String get shuffleSongsMenuTitle => 'Shuffle Songs';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Einstellungen';

  @override
  String get aboutScreenTitle => 'Um';

  @override
  String get coverFlowScreenTitle => 'Abdeckfluss';

  @override
  String get artistsScreenTitle => 'Künstler';

  @override
  String get albumsScreenTitle => 'Alben';

  @override
  String get songsScreenTitle => 'Lieder';

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
      zero: 'no Songs',
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
      other: '$countString Oder',
      one: '1 Oder',
      zero: 'no Oder',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Genres';

  @override
  String get genreSongsScreenTitle => 'Genre -Lieder';

  @override
  String get deviceColorSettingTitle => 'Gerätefarbe';

  @override
  String get touchScreenSettingTitle => 'Touchscreen aktiviert';

  @override
  String get repeatModeSettingTitle => 'Wiederholen';

  @override
  String get repeatModeOne => 'Eins';

  @override
  String get repeatModeAll => 'Alle';

  @override
  String get vibrateSettingTitle => 'Vibrieren';

  @override
  String get clickWheelSettingTitle => 'Klicken Sie Klicken mit Rad';

  @override
  String get splitScreenSettingTitle => 'Split -Bildschirmmodus';

  @override
  String get touchSoundsDialogTitle => 'Berühren Sie Geräusche';

  @override
  String get touchSoundsDialogContent =>
      'Bitte aktivieren Sie Touch -Sounds aus den Systemeinstellungen, um die Klickrad -Sounds zu hören';

  @override
  String get immersiveModeSettingTitle => 'Immersiven Modus';

  @override
  String get showAppTutorialSettingTitle => 'Tutorial Show';

  @override
  String get changeDirectorySettingTitle => 'Verzeichnis ändern';

  @override
  String get donateSettingTitle => 'Spenden';

  @override
  String get donateSettingDescription =>
      'Wenn Ihnen diese App gefällt, sollten Sie bitte spenden.';

  @override
  String get versionAboutScreenTitle => 'Version';

  @override
  String get madeWithLoveTitle => 'Gemacht mit ❤️ von';

  @override
  String get noMusicFilesFound => 'Keine Musik';

  @override
  String get noArtistsFound => 'Keine Künstler';

  @override
  String get noAlbumsFound => 'Keine Alben';

  @override
  String get unknownSong => 'Unbekanntes Lied';

  @override
  String get unknownArtist => 'Unbekannter Künstler';

  @override
  String get unknownAlbum => 'Unbekanntes Album';

  @override
  String get unknownGenre => 'Unbekanntes Genre';

  @override
  String get buttonConfirmText => 'OK';

  @override
  String get tileValueOn => 'An';

  @override
  String get tileValueOff => 'Aus';

  @override
  String get commonOfText => 'von';

  @override
  String get pageNotFoundText => 'Die angegebene Seite wurde nicht gefunden';

  @override
  String get commonErrorText => 'Fehler';

  @override
  String get retryButtonText => 'Wiederholen';

  @override
  String get filePickerDialogTitle =>
      'Wählen Sie ein Verzeichnis, das Sie nach Musik scannen können';

  @override
  String get searchScreenTitle => 'Suchen';

  @override
  String get searchEmptyText => 'Keine Suchergebnisse';

  @override
  String get searchResultsText => 'Suchergebnisse:';

  @override
  String get resultsForText => 'Ergebnisse für:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Batterieoptimierung deaktivieren';

  @override
  String get disableBatteryOptimizationContent =>
      'Bitte deaktivieren Sie die Akkuoptimierung für diese App in den Geräteeinstellungen, um die Musik -Musik -Wiedergabe von Musik zu ermöglichen.';

  @override
  String get languageScreenTitle => 'Sprache';

  @override
  String get silverDeviceColor => 'Silber';

  @override
  String get blackDeviceColor => 'Schwarz';

  @override
  String get resetSettingsTitle => 'Einstellungen zurücksetzen';

  @override
  String get browseArtist => 'Künstler durchsuchen';

  @override
  String get browseAlbum => 'Album durchsuchen';

  @override
  String get cancelText => 'Stornieren';

  @override
  String get playlistsScreenTitle => 'Wiedergabelisten';

  @override
  String get addToOnTheGoPlaylist => 'Zu unübertroffenes Go fügen';

  @override
  String get addAlbumToOnTheGoPlaylist =>
      'Fügen Sie das Album in der O-Go hinzu';

  @override
  String get removeSongFromThePlaylist => 'Aus der Wiedergabeliste entfernen';

  @override
  String get allAlbums => 'Alle Alben';

  @override
  String get scanningMusicFiles => 'Musikdateien scannen';

  @override
  String get newPlaylist => 'Neue Wiedergabeliste';

  @override
  String get savePlaylist => 'Wiedergabeliste speichern';

  @override
  String get clearPlaylist => 'Klare Wiedergabeliste';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan musikdateien';

  @override
  String get deviceControlMenuTutorialText =>
      'Bewegen Sie Ihren Daumen leicht um das Klickrad, um das Menü zu navigieren';

  @override
  String get centerButtonMenuTutorialText =>
      'Drücken Sie die Mitte -Taste, um den hervorgehobenen Menüelement auszuwählen';

  @override
  String get playPauseMenuTutorialText =>
      'Drücken Sie diese Taste, um einen Song abzuspielen oder zu pausieren';

  @override
  String get nextButtonMenuTutorialText =>
      'Drücken Sie diese Taste, um zum nächsten Song zu springen';

  @override
  String get previousButtonMenuTutorialText =>
      'Drücken Sie diese Taste, um zurückzuspulen oder zum vorherigen Song zurückzukehren';

  @override
  String get menuButtonTutorialText =>
      'Drücken Sie diese Taste, um zum vorherigen Menü zurückzukehren. Sie können es von jedem anderen Bildschirm von der direkten Bildschirm gedrückt halten, um direkt zum Hauptmenü zu gehen.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Dies ist der Anzeigebildschirm. Der Touchscreen- und der Split -Bildschirmmodus sind standardmäßig aktiviert und können in den Einstellungen weiter konfiguriert werden.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Bewegen Sie Ihren Daumen um das Klickrad, um die Lautstärke anzupassen';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Drücken Sie die Mitte -Taste, um durch die Suchleiste, den Schrubbenbalken und den Shuffle Slider zu fahren. Halten Sie die Mitte -Taste gedrückt, um auf zusätzliche Optionen zuzugreifen.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Halten Sie diese Taste gedrückt, um das Lied zu schnell voranzutreiben';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Halten Sie diese Taste gedrückt, um das Lied zurückzuspulen';

  @override
  String get deviceControlSearchTutorialText =>
      'Bewegen Sie Ihren Daumen leicht um das Klickrad, um ein Alphabet hervorzuheben';

  @override
  String get centerButtonSearchTutorialText =>
      'Drücken Sie die Mitte -Taste, um das hervorgehobene Alphabet auszuwählen';

  @override
  String get nextButtonSearchTutorialText =>
      'Drücken Sie diese Taste, um einen Speicherplatz hinzuzufügen';

  @override
  String get previousButtonSearchTutorialText =>
      'Drücken Sie diese Taste, um das letzte Zeichen zu löschen';

  @override
  String get menuButtonSearchTutorialText =>
      'Drücken Sie diese Taste, um die Tastatur zu schließen und mit den Suchergebnissen zu interagieren';

  @override
  String get allSongs => 'Alle Lieder';
}
