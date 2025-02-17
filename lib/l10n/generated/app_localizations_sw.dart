// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swahili (`sw`).
class AppLocalizationsSw extends AppLocalizations {
  AppLocalizationsSw([String locale = 'sw']) : super(locale);

  @override
  String get appTitle => 'Classipod';

  @override
  String get menuButtonText => 'Mechi';

  @override
  String get audioAccessPermissionTitle =>
      'Ruhusa ya ufikiaji wa sauti inahitajika';

  @override
  String get audioAccessPermissionContent =>
      'Tafadhali toa ufikiaji wa faili za sauti kuturuhusu kucheza faili zako za muziki.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Ruhusa ya ufikiaji wa sauti imekataliwa';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Tafadhali toa ufikiaji wa faili za sauti za programu hii kwenye mipangilio ya kifaa kuturuhusu kucheza faili zako za muziki.';

  @override
  String get menuScreenTitle => 'Mechi';

  @override
  String get musicMenuScreenTitle => 'Muziki';

  @override
  String get nowPlayingScreenTitle => 'Sasa kucheza';

  @override
  String get shuffleSongsMenuTitle => 'Nyimbo za Shuffle';

  @override
  String get shuffleSettingTitle => 'Shuffle';

  @override
  String get settingsScreenTitle => 'Mipangilio';

  @override
  String get aboutScreenTitle => 'Kuhusu';

  @override
  String get coverFlowScreenTitle => 'Mtiririko wa kufunika';

  @override
  String get artistsScreenTitle => 'Wasanii';

  @override
  String get albumsScreenTitle => 'Albamu';

  @override
  String get songsScreenTitle => 'Nyimbo';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Nyimbo',
      one: '1 Wimbo',
      zero: 'Hakuna Nyimbo',
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
      other: '$countString albamu',
      one: '1 albamu',
      zero: 'hakuna Albamu',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Aina';

  @override
  String get genreSongsScreenTitle => 'Nyimbo za aina';

  @override
  String get deviceColorSettingTitle => 'Rangi ya kifaa';

  @override
  String get touchScreenSettingTitle => 'Gusa skrini iliyowezeshwa';

  @override
  String get repeatModeSettingTitle => 'Kurudia';

  @override
  String get repeatModeOne => 'Moja';

  @override
  String get repeatModeAll => 'Zote';

  @override
  String get vibrateSettingTitle => 'Kutetemeka';

  @override
  String get clickWheelSettingTitle => 'Bonyeza sauti za gurudumu';

  @override
  String get splitScreenSettingTitle => 'Gawanya hali ya skrini';

  @override
  String get touchSoundsDialogTitle => 'Sauti za kugusa';

  @override
  String get touchSoundsDialogContent =>
      'Tafadhali Wezesha Sauti za Kugusa kutoka kwa Mipangilio ya Mfumo kusikia sauti za gurudumu';

  @override
  String get immersiveModeSettingTitle => 'Njia ya kuzama';

  @override
  String get showAppTutorialSettingTitle => 'Onyesha mafunzo';

  @override
  String get changeDirectorySettingTitle => 'Badilisha saraka';

  @override
  String get donateSettingTitle => 'Toa';

  @override
  String get donateSettingDescription =>
      'Ikiwa unapenda programu hii, tafadhali fikiria kutoa.';

  @override
  String get versionAboutScreenTitle => 'Toleo';

  @override
  String get madeWithLoveTitle => 'Imetengenezwa na ❤️ na';

  @override
  String get noMusicFilesFound => 'Hakuna muziki';

  @override
  String get noArtistsFound => 'Hakuna wasanii';

  @override
  String get noAlbumsFound => 'Hakuna Albamu';

  @override
  String get unknownSong => 'Wimbo usiojulikana';

  @override
  String get unknownArtist => 'Msanii asiyejulikana';

  @override
  String get unknownAlbum => 'Albamu isiyojulikana';

  @override
  String get unknownGenre => 'Aina isiyojulikana';

  @override
  String get buttonConfirmText => 'Sawa';

  @override
  String get tileValueOn => 'On';

  @override
  String get tileValueOff => 'Mbali';

  @override
  String get commonOfText => 'ya';

  @override
  String get pageNotFoundText => 'Ukurasa uliyopewa haukupatikana';

  @override
  String get commonErrorText => 'Kosa';

  @override
  String get retryButtonText => 'Jaribu tena';

  @override
  String get filePickerDialogTitle => 'Chagua saraka ya kuchambua muziki';

  @override
  String get searchScreenTitle => 'Tafuta';

  @override
  String get searchEmptyText => 'Hakuna matokeo ya utaftaji';

  @override
  String get searchResultsText => 'Matokeo ya utaftaji:';

  @override
  String get resultsForText => 'Matokeo ya:';

  @override
  String get disableBatteryOptimizationTitle => 'Lemaza utaftaji wa betri';

  @override
  String get disableBatteryOptimizationContent =>
      'Tafadhali lemaza utaftaji wa betri kwa programu hii kwenye mipangilio ya kifaa ili kuruhusu uchezaji wa nyuma wa muziki.';

  @override
  String get languageScreenTitle => 'Lugha';

  @override
  String get silverDeviceColor => 'Fedha';

  @override
  String get blackDeviceColor => 'Nyeusi';

  @override
  String get resetSettingsTitle => 'Rudisha mipangilio';

  @override
  String get browseArtist => 'Vinjari Msanii';

  @override
  String get browseAlbum => 'Vinjari Albamu';

  @override
  String get cancelText => 'Ghairi';

  @override
  String get playlistsScreenTitle => 'Orodha za kucheza';

  @override
  String get addToOnTheGoPlaylist => 'Ongeza kwa kwenda-kwenda';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Ongeza albamu kwa kwenda-kwenda';

  @override
  String get removeSongFromThePlaylist => 'Ondoa kwenye orodha ya kucheza';

  @override
  String get allAlbums => 'Albamu zote';

  @override
  String get scanningMusicFiles => 'Skanning faili za muziki';

  @override
  String get newPlaylist => 'Orodha mpya ya kucheza';

  @override
  String get savePlaylist => 'Okoa orodha ya kucheza';

  @override
  String get clearPlaylist => 'Orodha ya kucheza wazi';

  @override
  String get rescanMusicFilesSettingTitle => 'Faili za Muziki za Kuokoa';

  @override
  String get deviceControlMenuTutorialText =>
      'Sogeza kidole chako kidogo kuzunguka gurudumu la kubonyeza ili kuzunguka menyu';

  @override
  String get centerButtonMenuTutorialText =>
      'Bonyeza kitufe cha Kituo ili uchague kipengee cha menyu kilichoangaziwa';

  @override
  String get playPauseMenuTutorialText =>
      'Bonyeza kitufe hiki kucheza au kusitisha wimbo';

  @override
  String get nextButtonMenuTutorialText =>
      'Bonyeza kitufe hiki kuruka kwa wimbo unaofuata';

  @override
  String get previousButtonMenuTutorialText =>
      'Bonyeza kitufe hiki kurudi nyuma au kurudi kwenye wimbo uliopita';

  @override
  String get menuButtonTutorialText =>
      'Bonyeza kitufe hiki kurudi kwenye menyu iliyopita. Unaweza kubonyeza na kuishikilia kutoka kwa skrini nyingine yoyote kwenda moja kwa moja kwenye menyu kuu.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Hii ndio skrini ya kuonyesha. Screen ya kugusa na modi ya skrini ya mgawanyiko imewezeshwa na chaguo -msingi na inaweza kusanidiwa zaidi katika mipangilio.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Sogeza kidole chako kuzunguka gurudumu la kubonyeza ili kurekebisha kiasi';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Bonyeza kitufe cha katikati ili kuzunguka kupitia bar ya kutafuta, bar ya scrubber na slider. Bonyeza na ushikilie kitufe cha kituo ili kufikia chaguzi za ziada.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Bonyeza na ushikilie kitufe hiki ili kusonga mbele wimbo';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Bonyeza na ushikilie kitufe hiki kurudisha wimbo';

  @override
  String get deviceControlSearchTutorialText =>
      'Sogeza kidole chako kidogo kuzunguka gurudumu la kubonyeza ili kuonyesha alfabeti';

  @override
  String get centerButtonSearchTutorialText =>
      'Bonyeza kitufe cha katikati kuchagua alfabeti iliyoangaziwa';

  @override
  String get nextButtonSearchTutorialText =>
      'Bonyeza kitufe hiki ili kuongeza nafasi';

  @override
  String get previousButtonSearchTutorialText =>
      'Bonyeza kitufe hiki kufuta tabia ya mwisho';

  @override
  String get menuButtonSearchTutorialText =>
      'Bonyeza kitufe hiki ili kufunga kibodi na kuingiliana na matokeo ya utaftaji';
}
