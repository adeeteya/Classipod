// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Luo (`luo`).
class AppLocalizationsLuo extends AppLocalizations {
  AppLocalizationsLuo([String locale = 'luo']) : super(locale);

  @override
  String get appTitle => 'KlasiPod';

  @override
  String get menuButtonText => 'MENU';

  @override
  String get audioAccessPermissionTitle => 'Dwaro mar Audio Dwaro';

  @override
  String get audioAccessPermissionContent =>
      'Omiyo, ng’e ni fainde mag dwol nyalo miyo wabed gi thuolo mar goyo fainde mag thum.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Audio Arimo mar Chiwo Gik Mowinjore';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Yie mondo chiw fainde mag apps mag program ma ni e chenro mag masin mondo oyienewa mondo watim fainde mag thum.';

  @override
  String get menuScreenTitle => 'Menu';

  @override
  String get musicMenuScreenTitle => 'Thum';

  @override
  String get nowPlayingScreenTitle => 'Koro tugo';

  @override
  String get shuffleSongsMenuTitle => 'Jo-Som mag lwedo';

  @override
  String get shuffleSettingTitle => 'Shumbul';

  @override
  String get settingsScreenTitle => 'Sete';

  @override
  String get aboutScreenTitle => 'Kuom';

  @override
  String get coverFlowScreenTitle => 'Oueyo Flap';

  @override
  String get artistsScreenTitle => 'Jotugo';

  @override
  String get albumsScreenTitle => 'Albus';

  @override
  String get songsScreenTitle => 'Weche';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Nyiem',
      one: '1 Wer',
      zero: 'Onge wende',
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
      other: '$countString Albam',
      one: '1 Albam',
      zero: 'No Albums',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Jin';

  @override
  String get genreSongsScreenTitle => 'Midhiero mag Chakruok';

  @override
  String get deviceColorSettingTitle => 'Dwaro Rangi';

  @override
  String get touchScreenSettingTitle => 'Kuong’o Skrin mar Skrin';

  @override
  String get repeatModeSettingTitle => 'Nwo';

  @override
  String get repeatModeOne => 'Achiel';

  @override
  String get repeatModeAll => 'Duto';

  @override
  String get vibrateSettingTitle => 'neno sinema';

  @override
  String get clickWheelSettingTitle => 'Gwel Dhoot Duong\'';

  @override
  String get splitScreenSettingTitle => 'Mode mar Skul';

  @override
  String get touchSoundsDialogTitle => 'Telo mag tiendi';

  @override
  String get touchSoundsDialogContent =>
      '<2Zepa> 2:10, 11. 10 Bende, ng’ato nyalo ng’eyo ni ng’ato nigi nyalo mar timo gik ma ng’ato dwaro timo';

  @override
  String get immersiveModeSettingTitle => 'Mode ma ok tiyo';

  @override
  String get showAppTutorialSettingTitle => 'Nyiso Yore mag Tem';

  @override
  String get changeDirectorySettingTitle => 'Lokiruok';

  @override
  String get donateSettingTitle => 'Chiwo ne jomoko';

  @override
  String get donateSettingDescription =>
      'Kapo ni ihero program ni, yie mondo ipar mar chiwo pesa.';

  @override
  String get versionAboutScreenTitle => 'Kido';

  @override
  String get madeWithLoveTitle => 'Ne otim gi ❤️ gi';

  @override
  String get noMusicFilesFound => 'Onge Muzik';

  @override
  String get noArtistsFound => 'Onge jogo ma tiyo kod jotugo';

  @override
  String get noAlbumsFound => 'Onge Alms';

  @override
  String get unknownSong => 'Ok ong\'eyo ni ok ong\'ere';

  @override
  String get unknownArtist => 'Jatugo mar sinema';

  @override
  String get unknownAlbum => 'Album ma ok ong\'ere';

  @override
  String get unknownGenre => 'Genre';

  @override
  String get buttonConfirmText => 'OO';

  @override
  String get tileValueOn => 'Kuom';

  @override
  String get tileValueOff => 'Not translatable on its own';

  @override
  String get commonOfText => 'mar';

  @override
  String get pageNotFoundText => 'Oboke ma ne omiye ne ok yudre';

  @override
  String get commonErrorText => 'Kier';

  @override
  String get retryButtonText => 'kendo';

  @override
  String get filePickerDialogTitle =>
      'Yier Opira ma ibiro tiyogo Skan mar Muziki';

  @override
  String get searchScreenTitle => 'Manyo';

  @override
  String get searchEmptyText => 'Onge Duoko mar Neno';

  @override
  String get searchResultsText => 'Duoko mag manyo:';

  @override
  String get resultsForText => 'Duoko mag:';

  @override
  String get disableBatteryOptimizationTitle => 'Mathindo ma Ok Nyalre';

  @override
  String get disableBatteryOptimizationContent =>
      'Yie mondo iweri gi betri ma ni e program ni e chenro mag masin mondo owek thum ma ng’ato winjo.';

  @override
  String get languageScreenTitle => 'Dhok';

  @override
  String get silverDeviceColor => 'Fail';

  @override
  String get blackDeviceColor => 'Rateng';

  @override
  String get resetSettingsTitle => 'Sete mag Sete';

  @override
  String get browseArtist => 'Dik ng\'ama aduoko mar jotugo';

  @override
  String get browseAlbum => 'Dwok Albom';

  @override
  String get cancelText => 'ketho';

  @override
  String get playlistsScreenTitle => 'Listi mag';

  @override
  String get addToOnTheGoPlaylist => 'Medo nyaka e kinde ma idhigo';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Med Album e kinde machon-Tiyo';

  @override
  String get removeSongFromThePlaylist => 'Ogolo oko mar listi mar Tugo';

  @override
  String get allAlbums => 'Albus duto';

  @override
  String get scanningMusicFiles => 'Fail mag Muziki mag Muziki';

  @override
  String get newPlaylist => 'Listi manyien mar tuke';

  @override
  String get savePlaylist => 'Limbe mag tuke';

  @override
  String get clearPlaylist => 'Lim mar tuke mag ot';

  @override
  String get rescanMusicFilesSettingTitle => 'Fail mag Muziki';

  @override
  String get deviceControlMenuTutorialText =>
      'Ting’ lith lweti matin mana machiegni gi ng’at ma itiyogo mondo idhi e menu mar menyu';

  @override
  String get centerButtonMenuTutorialText =>
      'Dier baton mar diere mondo iyier gik ma nigi ler';

  @override
  String get playPauseMenuTutorialText =>
      'Dier baton ni mondo iweye kata iweri gi wende';

  @override
  String get nextButtonMenuTutorialText =>
      'Dhi e baton ni mondo idhi e wer maluwo';

  @override
  String get previousButtonMenuTutorialText =>
      'Dhi e baton ni mondo iduok piny kata idok e wer mokalo';

  @override
  String get menuButtonTutorialText =>
      'Dier baton ni mondo idog e menyu mokalo. Inyalo ng’ado kendo imake kowuok e skrin moro amora mamoko mondo idhi e menu maduong’.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Mano e skrin ma nyiso gik moko. Mode mar Skrin ma mulo ng’ato kod ng’iyo gik moko nyalo bedo gi teko mar ng’iyo gik moko kendo inyalo keto e yo matut e alwora.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Inyalo dhi e bath Wil ma itiyogo mondo ilok dwol';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Dier baton mar Center ma inyalo luwo e wi bar, ng’ado mtoka ma ng’ato nyalo ng’adoe. Dier kendo imak baton mar Senta mondo iyud yore mamoko ma inyalo yiero.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Di kendo mako baton ni mondo idhi nyime gi wero wende mapiyo';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Dhi kendo imak baton mar baton ni mondo iduok wende';

  @override
  String get deviceControlSearchTutorialText =>
      'Inyalo ng’ado lith lweti matin mana ka idhi e Wiel mondo oket ler kuom alfabet';

  @override
  String get centerButtonSearchTutorialText =>
      'Dier baton mar diere mondo iyier alfabet ma nigi ler';

  @override
  String get nextButtonSearchTutorialText => 'Dier baton ni mondo imed thuolo';

  @override
  String get previousButtonSearchTutorialText =>
      'Dier baton ni mondo iduok kido mogik';

  @override
  String get menuButtonSearchTutorialText =>
      'Dhi e batonni mondo ilor kibod kendo iti gi duoko mag manyo';
}
