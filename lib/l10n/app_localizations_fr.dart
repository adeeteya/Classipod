import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Classipode';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle => 'Autorisation d\'accès audio requise';

  @override
  String get audioAccessPermissionContent => 'Veuillez accorder l\'accès aux fichiers audio pour nous permettre de lire vos fichiers musicaux.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Autorisation d\'accès audio refusé';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Veuillez accorder l\'accès aux fichiers audio pour cette application dans les paramètres de l\'appareil pour nous permettre de lire vos fichiers musicaux.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Musique';

  @override
  String get nowPlayingScreenTitle => 'Jouer maintenant';

  @override
  String get shuffleSongsMenuTitle => 'Mélanger les chansons';

  @override
  String get shuffleSettingTitle => 'Mélanger';

  @override
  String get settingsScreenTitle => 'Paramètres';

  @override
  String get aboutScreenTitle => 'À propos';

  @override
  String get coverFlowScreenTitle => 'Couverture';

  @override
  String get artistsScreenTitle => 'Artistes';

  @override
  String get albumsScreenTitle => 'Albums';

  @override
  String get songsScreenTitle => 'Chansons';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString chansons',
      one: '1 chanson',
      zero: 'pas de chansons',
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
      one: '1 album',
      zero: 'pas d\'albums',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Genres';

  @override
  String get genreSongsScreenTitle => 'Chansons de genre';

  @override
  String get deviceColorSettingTitle => 'Couleur de l\'appareil';

  @override
  String get touchScreenSettingTitle => 'Écran tactile activé';

  @override
  String get repeatModeSettingTitle => 'Répéter';

  @override
  String get repeatModeOne => 'Un';

  @override
  String get repeatModeAll => 'Tous';

  @override
  String get vibrateSettingTitle => 'Vibrer';

  @override
  String get clickWheelSettingTitle => 'Cliquez sur les sons de la roue';

  @override
  String get splitScreenSettingTitle => 'Mode d\'écran divisé';

  @override
  String get touchSoundsDialogTitle => 'Toucher les sons';

  @override
  String get touchSoundsDialogContent => 'Veuillez activer les sons tactiles des paramètres du système pour entendre les sons de la roue cliquetis';

  @override
  String get immersiveModeSettingTitle => 'Mode immersif';

  @override
  String get showAppTutorialSettingTitle => 'Tutoriel de montre';

  @override
  String get changeDirectorySettingTitle => 'Répertoire de modification';

  @override
  String get donateSettingTitle => 'Faire un don';

  @override
  String get donateSettingDescription => 'Si vous aimez cette application, veuillez envisager de faire un don.';

  @override
  String get versionAboutScreenTitle => 'Version';

  @override
  String get madeWithLoveTitle => 'Fait avec ❤️ par';

  @override
  String get noMusicFilesFound => 'Pas de musique';

  @override
  String get noArtistsFound => 'Pas d\'artistes';

  @override
  String get noAlbumsFound => 'Pas d\'albums';

  @override
  String get unknownSong => 'Chanson inconnue';

  @override
  String get unknownArtist => 'Artiste inconnu';

  @override
  String get unknownAlbum => 'Album inconnu';

  @override
  String get unknownGenre => 'Genre inconnu';

  @override
  String get buttonConfirmText => 'D\'ACCORD';

  @override
  String get tileValueOn => 'Sur';

  @override
  String get tileValueOff => 'Désactivé';

  @override
  String get commonOfText => 'de';

  @override
  String get pageNotFoundText => 'La page donnée n\'a pas été trouvée';

  @override
  String get commonErrorText => 'Erreur';

  @override
  String get retryButtonText => 'Réessayer';

  @override
  String get filePickerDialogTitle => 'Sélectionnez un répertoire pour rechercher la musique';

  @override
  String get searchScreenTitle => 'Recherche';

  @override
  String get searchEmptyText => 'Pas de résultats de recherche';

  @override
  String get searchResultsText => 'Résultats de la recherche:';

  @override
  String get resultsForText => 'Résultats pour:';

  @override
  String get disableBatteryOptimizationTitle => 'Désactiver l\'optimisation de la batterie';

  @override
  String get disableBatteryOptimizationContent => 'Veuillez désactiver l\'optimisation de la batterie pour cette application dans les paramètres de l\'appareil pour permettre la lecture en arrière-plan de la musique.';

  @override
  String get languageScreenTitle => 'Langue';

  @override
  String get silverDeviceColor => 'Argent';

  @override
  String get blackDeviceColor => 'Noir';

  @override
  String get resetSettingsTitle => 'Réinitialiser les paramètres';

  @override
  String get browseArtist => 'Parcourir';

  @override
  String get browseAlbum => 'Album de parcourir';

  @override
  String get cancelText => 'Annuler';

  @override
  String get playlistsScreenTitle => 'Playlists';

  @override
  String get addToOnTheGoPlaylist => 'Ajouter à l\'emploi';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Ajouter un album à la bouge';

  @override
  String get removeSongFromThePlaylist => 'Supprimer de la playlist';

  @override
  String get allAlbums => 'Tous les albums';

  @override
  String get scanningMusicFiles => 'Analyser des fichiers musicaux';

  @override
  String get newPlaylist => 'Nouvelle liste de lecture';

  @override
  String get savePlaylist => 'Enregistrer la playlist';

  @override
  String get clearPlaylist => 'Playlist claire';

  @override
  String get rescanMusicFilesSettingTitle => 'Fichiers de musique de sauvetage';

  @override
  String get deviceControlMenuTutorialText => 'Déplacez votre pouce légèrement autour de la roue cliquetis pour naviguer dans le menu';

  @override
  String get centerButtonMenuTutorialText => 'Appuyez sur le bouton central pour sélectionner l\'élément de menu en surbrillance';

  @override
  String get playPauseMenuTutorialText => 'Appuyez sur ce bouton pour jouer ou suspendre une chanson';

  @override
  String get nextButtonMenuTutorialText => 'Appuyez sur ce bouton pour passer à la chanson suivante';

  @override
  String get previousButtonMenuTutorialText => 'Appuyez sur ce bouton pour rembobiner ou revenir à la chanson précédente';

  @override
  String get menuButtonTutorialText => 'Appuyez sur ce bouton pour revenir au menu précédent. Vous pouvez appuyer et le maintenir à partir de n\'importe quel autre écran pour accéder directement au menu principal.';

  @override
  String get deviceScreenMenuTutorialText => 'Ceci est l\'écran d\'affichage. L\'écran tactile et le mode d\'écran divisé sont activés par défaut et peuvent être configurés plus loin dans les paramètres.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Déplacez votre pouce autour de la roue cliquetis pour régler le volume';

  @override
  String get centerButtonNowPlayingTutorialText => 'Appuyez sur le bouton central pour faire le tour de la barre de recherche, de la barre d\'époudeur et du curseur de remaniement. Appuyez et maintenez le bouton central pour accéder aux options supplémentaires.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Appuyez et maintenez ce bouton pour faire avancer rapidement la chanson';

  @override
  String get previousButtonNowPlayingTutorialText => 'Appuyez et maintenez ce bouton pour rembobiner la chanson';

  @override
  String get deviceControlSearchTutorialText => 'Déplacez votre pouce légèrement autour de la roue cliquetis pour mettre en surbrillance un alphabet';

  @override
  String get centerButtonSearchTutorialText => 'Appuyez sur le bouton central pour sélectionner l\'alphabet en surbrillance';

  @override
  String get nextButtonSearchTutorialText => 'Appuyez sur ce bouton pour ajouter un espace';

  @override
  String get previousButtonSearchTutorialText => 'Appuyez sur ce bouton pour supprimer le dernier caractère';

  @override
  String get menuButtonSearchTutorialText => 'Appuyez sur ce bouton pour fermer le clavier et interagir avec les résultats de recherche';
}
