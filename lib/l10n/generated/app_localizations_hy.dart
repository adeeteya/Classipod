// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Armenian (`hy`).
class AppLocalizationsHy extends AppLocalizations {
  AppLocalizationsHy([String locale = 'hy']) : super(locale);

  @override
  String get appTitle => 'Դասակարգ';

  @override
  String get menuButtonText => 'Մենյու';

  @override
  String get audioAccessPermissionTitle =>
      'Պահանջվում է աուդիո մուտքի թույլտվություն';

  @override
  String get audioAccessPermissionContent =>
      'Խնդրում ենք տրամադրել աուդիո ֆայլերի հասանելիությունը `թույլ տալով, որ մենք նվագենք ձեր երաժշտական ​​ֆայլերը:';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Աուդիո մուտքի թույլտվությունը մերժվեց';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Խնդրում ենք տրամադրել աուդիո ֆայլերի մուտքը սարքի պարամետրերում այս ծրագրի համար `թույլ տալու համար, որ մենք նվագենք ձեր երաժշտական ​​ֆայլերը:';

  @override
  String get menuScreenTitle => 'Մենյու';

  @override
  String get musicMenuScreenTitle => 'Երաժշտություն';

  @override
  String get nowPlayingScreenTitle => 'Հիմա խաղում';

  @override
  String get shuffleSongsMenuTitle => 'Shuffle երգերը';

  @override
  String get shuffleSettingTitle => 'Խորամանկել';

  @override
  String get settingsScreenTitle => 'Կարգավորումներ';

  @override
  String get aboutScreenTitle => 'Մոտավորապես';

  @override
  String get coverFlowScreenTitle => 'Ծածկույթի հոսքը';

  @override
  String get artistsScreenTitle => 'Նկարիչներ';

  @override
  String get albumsScreenTitle => 'Ալբոմներ';

  @override
  String get songsScreenTitle => 'Երգեր';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Երգեր',
      one: '1 երգ',
      zero: 'Ոչ երգեր',
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
      other: '$countString Ալբոմներ',
      one: '1 Ալբոմ',
      zero: 'Ալբոմներ չկան',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Ժանրեր';

  @override
  String get genreSongsScreenTitle => 'Ժանրային երգեր';

  @override
  String get deviceColorSettingTitle => 'Սարքի գույնը';

  @override
  String get touchScreenSettingTitle => 'Touch էկրանը միացված է';

  @override
  String get repeatModeSettingTitle => 'Կրկնություն';

  @override
  String get repeatModeOne => 'Մեկ';

  @override
  String get repeatModeAll => 'Բոլորը';

  @override
  String get vibrateSettingTitle => 'Թրթռալ';

  @override
  String get clickWheelSettingTitle => 'Կտտացրեք անիվի հնչյունները';

  @override
  String get splitScreenSettingTitle => 'Split էկրանի ռեժիմ';

  @override
  String get touchSoundsDialogTitle => 'Հպեք հնչյուններ';

  @override
  String get touchSoundsDialogContent =>
      'Խնդրում ենք միացնել հպումային հնչյունները համակարգի պարամետրերից `կտտոցների անիվի հնչյունները լսելու համար';

  @override
  String get immersiveModeSettingTitle => 'Ընկղմող ռեժիմ';

  @override
  String get showAppTutorialSettingTitle => 'Show ուցադրել ձեռնարկը';

  @override
  String get changeDirectorySettingTitle => 'Փոխեք տեղեկատու';

  @override
  String get donateSettingTitle => 'Նվիրել';

  @override
  String get donateSettingDescription =>
      'Եթե ​​Ձեզ դուր է գալիս այս ծրագիրը, խնդրում ենք հաշվի առնել նվիրատվությունը:';

  @override
  String get versionAboutScreenTitle => 'Տարբերակ';

  @override
  String get madeWithLoveTitle => 'Պատրաստված է ❤️ -ով';

  @override
  String get noMusicFilesFound => 'Ոչ մի երաժշտություն';

  @override
  String get noArtistsFound => 'Ոչ մի նկարիչ';

  @override
  String get noAlbumsFound => 'Ոչ մի ալբոմ';

  @override
  String get unknownSong => 'Անհայտ երգ';

  @override
  String get unknownArtist => 'Անհայտ նկարիչ';

  @override
  String get unknownAlbum => 'Անհայտ ալբոմ';

  @override
  String get unknownGenre => 'Անհայտ ժանր';

  @override
  String get buttonConfirmText => 'Լավ';

  @override
  String get tileValueOn => 'Մի կողմ';

  @override
  String get tileValueOff => 'Անկայուն';

  @override
  String get commonOfText => 'է';

  @override
  String get pageNotFoundText => 'Տվյալ էջը չի գտնվել';

  @override
  String get commonErrorText => 'Սխալ';

  @override
  String get retryButtonText => 'Փորձել';

  @override
  String get filePickerDialogTitle =>
      'Երաժշտության համար սկանավորելու համար ընտրեք գրացուցակ';

  @override
  String get searchScreenTitle => 'Որոնել';

  @override
  String get searchEmptyText => 'Որոնման արդյունք չկա';

  @override
  String get searchResultsText => 'Որոնման արդյունքները.';

  @override
  String get resultsForText => 'Արդյունքներ.';

  @override
  String get disableBatteryOptimizationTitle =>
      'Անջատեք մարտկոցի օպտիմիզացումը';

  @override
  String get disableBatteryOptimizationContent =>
      'Խնդրում ենք անջատել մարտկոցի օպտիմիզացումը սարքի պարամետրերում այս ծրագրի համար `երաժշտության ֆոնային նվագարկումը թույլ տալու համար:';

  @override
  String get languageScreenTitle => 'Լեզու';

  @override
  String get silverDeviceColor => 'Արծաթ';

  @override
  String get blackDeviceColor => 'Սեվ';

  @override
  String get resetSettingsTitle => 'Վերականգնել պարամետրերը';

  @override
  String get browseArtist => 'Նայեք նկարիչ';

  @override
  String get browseAlbum => 'Դիտեք ալբոմը';

  @override
  String get cancelText => 'Չեղարկել';

  @override
  String get playlistsScreenTitle => 'Play անկերը';

  @override
  String get addToOnTheGoPlaylist => 'Ավելացնել';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Ավելացնել ալբոմը';

  @override
  String get removeSongFromThePlaylist => 'Հեռացրեք երգացանկից';

  @override
  String get allAlbums => 'Բոլոր ալբոմները';

  @override
  String get scanningMusicFiles => 'Երաժշտական ​​ֆայլերի սկանավորում';

  @override
  String get newPlaylist => 'Նոր խաղացանկ';

  @override
  String get savePlaylist => 'Save Playlist';

  @override
  String get clearPlaylist => 'Մաքուր երգացանկ';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan երաժշտական ​​ֆայլեր';

  @override
  String get deviceControlMenuTutorialText =>
      'Menu անկը նավարկելու համար ձեր մատը թեթեւ տեղափոխեք կտտոցով';

  @override
  String get centerButtonMenuTutorialText =>
      'Սեղմեք կենտրոնի կոճակը `ընդգծված ընտրացանկի տարրը ընտրելու համար';

  @override
  String get playPauseMenuTutorialText =>
      'Սեղմեք այս կոճակը `երգը նվագելու կամ դադար տալու համար';

  @override
  String get nextButtonMenuTutorialText =>
      'Հաջորդ երգը բաց թողնելու համար սեղմեք այս կոճակը';

  @override
  String get previousButtonMenuTutorialText =>
      'Սեղմեք այս կոճակը `նախորդ երգին վերադառնանք կամ վերադառնալու համար';

  @override
  String get menuButtonTutorialText =>
      'Սեղմեք այս կոճակը նախորդ ընտրացանկին վերադառնալու համար: Դուք կարող եք սեղմել եւ պահել այն ցանկացած այլ էկրանից `ուղղակիորեն անցնելու հիմնական ընտրացանկին:';

  @override
  String get deviceScreenMenuTutorialText =>
      'Սա ցուցադրման էկրանն է: Touch էկրանը եւ Split էկրանի ռեժիմը միացված են լռելյայն եւ կարող եք կազմաձեւվել պարամետրերում:';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Ձեռքը կարգավորելու համար ձեր բութ մատը տեղափոխեք կտտացման անիվը';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Սեղմեք կենտրոնի կոճակը `փխրուն բար, մացառի բար եւ խորամանկ սահող: Լրացուցիչ ընտրանքներ մուտք գործելու համար սեղմեք եւ պահեք կենտրոնի կոճակը:';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Սեղմեք եւ պահեք այս կոճակը `երգը արագ առաջ տանելու համար';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Սեղմեք եւ պահեք այս կոճակը `երգը վերափոխելու համար';

  @override
  String get deviceControlSearchTutorialText =>
      'Այբուբենն ընդգծելու համար ձեր մատը թեթեւ տեղափոխեք կտտոցով';

  @override
  String get centerButtonSearchTutorialText =>
      'Սեղմեք կենտրոնի կոճակը `ընդգծված այբուբենը ընտրելու համար';

  @override
  String get nextButtonSearchTutorialText =>
      'Սեղմեք այս կոճակը `տարածք ավելացնելու համար';

  @override
  String get previousButtonSearchTutorialText =>
      'Վերջին կերպարը ջնջելու համար սեղմեք այս կոճակը';

  @override
  String get menuButtonSearchTutorialText =>
      'Սեղմեք այս կոճակը `ստեղնաշարը փակելու եւ որոնման արդյունքների հետ շփվելու համար';

  @override
  String get allSongs => 'Բոլոր երգերը';
}
