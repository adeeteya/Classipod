// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Gujarati (`gu`).
class AppLocalizationsGu extends AppLocalizations {
  AppLocalizationsGu([String locale = 'gu']) : super(locale);

  @override
  String get appTitle => 'વર્ગીકરણ';

  @override
  String get menuButtonText => 'વીનાશ';

  @override
  String get audioAccessPermissionTitle =>
      'Audio ડિઓ access ક્સેસ પરવાનગી આવશ્યક છે';

  @override
  String get audioAccessPermissionContent =>
      'કૃપા કરીને અમને તમારી સંગીત ફાઇલો રમવા માટે પરવાનગી આપવા માટે audio ડિઓ ફાઇલોને grow ક્સેસ આપો.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Audio ડિઓ access ક્સેસ પરવાનગી નકારી';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'અમને તમારી સંગીત ફાઇલો રમવા માટે પરવાનગી આપવા માટે કૃપા કરીને ડિવાઇસ સેટિંગ્સમાં આ એપ્લિકેશન માટે audio ડિઓ ફાઇલો access ક્સેસ આપો.';

  @override
  String get menuScreenTitle => 'વીનાશ';

  @override
  String get musicMenuScreenTitle => 'સંગીત';

  @override
  String get nowPlayingScreenTitle => 'હવે રમવું';

  @override
  String get shuffleSongsMenuTitle => 'શફલ ગીતો';

  @override
  String get shuffleSettingTitle => 'લટકવું';

  @override
  String get settingsScreenTitle => 'પતાવટ';

  @override
  String get aboutScreenTitle => 'લગભગ';

  @override
  String get coverFlowScreenTitle => 'પ્રવાહ';

  @override
  String get artistsScreenTitle => 'કલાકારો';

  @override
  String get albumsScreenTitle => 'આલ્બમ';

  @override
  String get songsScreenTitle => 'ગીતો';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ગીતો',
      one: '1 ગીત',
      zero: 'કોઈ ગીતો નથી',
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
      other: '$countString આલ્બમ્સ',
      one: '1 આલ્બમ',
      zero: 'કોઈ આલ્બમ્સ નથી',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'શૈલી';

  @override
  String get genreSongsScreenTitle => 'શૈલીનાં ગીતો';

  @override
  String get deviceColorSettingTitle => 'રંગબેરંગી રંગ';

  @override
  String get touchScreenSettingTitle => 'ટચ સ્ક્રીન સક્ષમ';

  @override
  String get repeatModeSettingTitle => 'પુનરાવર્તિત કરવું';

  @override
  String get repeatModeOne => 'એક';

  @override
  String get repeatModeAll => 'સમગ્ર';

  @override
  String get vibrateSettingTitle => 'ઝૂમી લેવું';

  @override
  String get clickWheelSettingTitle => 'વ્હીલ અવાજો ક્લિક કરો';

  @override
  String get splitScreenSettingTitle => 'સ્પ્લિટ સ્ક્રીન મોડ';

  @override
  String get touchSoundsDialogTitle => 'અવાજો';

  @override
  String get touchSoundsDialogContent =>
      'ક્લિક વ્હીલ અવાજો સાંભળવા માટે કૃપા કરીને સિસ્ટમ સેટિંગ્સમાંથી ટચ અવાજોને સક્ષમ કરો';

  @override
  String get immersiveModeSettingTitle => 'નિમુ -મોડ';

  @override
  String get showAppTutorialSettingTitle => 'ટ્યુટોરિયલ બતાવો';

  @override
  String get changeDirectorySettingTitle => 'ડિરેક્ટરી બદલો';

  @override
  String get donateSettingTitle => 'દાન કરવું';

  @override
  String get donateSettingDescription =>
      'જો તમને આ એપ્લિકેશન ગમે છે, તો કૃપા કરીને દાન આપવાનો વિચાર કરો.';

  @override
  String get versionAboutScreenTitle => 'ભાષાંતર';

  @override
  String get madeWithLoveTitle => 'દ્વારા with સાથે બનાવેલ';

  @override
  String get noMusicFilesFound => 'કોઈ સંગીત નથી';

  @override
  String get noArtistsFound => 'કલાકારો નથી';

  @override
  String get noAlbumsFound => 'કોઈ આલ્બમ્સ નથી';

  @override
  String get unknownSong => 'અજાણ્યું ગીત';

  @override
  String get unknownArtist => 'અજાણ્યા કલાકાર';

  @override
  String get unknownAlbum => 'અજાણ્યો આલ્બમ';

  @override
  String get unknownGenre => 'અજાણ્યું શૈલી';

  @override
  String get buttonConfirmText => 'ઠીક';

  @override
  String get tileValueOn => 'ચાલુ';

  @override
  String get tileValueOff => 'Offંચું';

  @override
  String get commonOfText => 'ની';

  @override
  String get pageNotFoundText => 'આપેલ પૃષ્ઠ મળ્યું ન હતું';

  @override
  String get commonErrorText => 'ભૂલ';

  @override
  String get retryButtonText => 'ફરી કોશિશ કરવી';

  @override
  String get filePickerDialogTitle =>
      'સંગીત માટે સ્કેન કરવાની ડિરેક્ટરી પસંદ કરો';

  @override
  String get searchScreenTitle => 'શોધ';

  @override
  String get searchEmptyText => 'કોઈ શોધ પરિણામ નથી';

  @override
  String get searchResultsText => 'શોધ પરિણામ:';

  @override
  String get resultsForText => 'માટે પરિણામો:';

  @override
  String get disableBatteryOptimizationTitle =>
      'બેટરી optim પ્ટિમાઇઝેશનને અક્ષમ કરો';

  @override
  String get disableBatteryOptimizationContent =>
      'કૃપા કરીને સંગીતના પૃષ્ઠભૂમિ પ્લેબેકને મંજૂરી આપવા માટે ઉપકરણ સેટિંગ્સમાં આ એપ્લિકેશન માટે બેટરી optim પ્ટિમાઇઝેશનને અક્ષમ કરો.';

  @override
  String get languageScreenTitle => 'ભાષા';

  @override
  String get silverDeviceColor => 'ચાંદી';

  @override
  String get blackDeviceColor => 'કાળું';

  @override
  String get resetSettingsTitle => 'રીસેટ સેટિંગ્સ';

  @override
  String get browseArtist => 'બ્રાઉઝ કલાકાર';

  @override
  String get browseAlbum => 'બ્રાઉઝ આલ્બમ';

  @override
  String get cancelText => 'રદ કરવું';

  @override
  String get playlistsScreenTitle => 'પ્લેલિસ્ટ્સ';

  @override
  String get addToOnTheGoPlaylist => 'પર જાઓ';

  @override
  String get addAlbumToOnTheGoPlaylist => 'ઓન-ધ-ગોમાં આલ્બમ ઉમેરો';

  @override
  String get removeSongFromThePlaylist => 'પ્લેલિસ્ટમાંથી દૂર કરો';

  @override
  String get allAlbums => 'બધા આલ્બમ્સ';

  @override
  String get scanningMusicFiles => 'સંગીત ફાઇલો સ્કેન કરી રહી છે';

  @override
  String get newPlaylist => 'નવી પ્લેલિસ્ટ';

  @override
  String get savePlaylist => 'પ્લેલિસ્ટ સાચવો';

  @override
  String get clearPlaylist => 'સ્પષ્ટ પ્લેલિસ્ટ';

  @override
  String get rescanMusicFilesSettingTitle => 'રિસ્કન મ્યુઝિક ફાઇલો';

  @override
  String get deviceControlMenuTutorialText =>
      'મેનૂ નેવિગેટ કરવા માટે તમારા અંગૂઠાને થોડું ક્લિક વ્હીલની આસપાસ ખસેડો';

  @override
  String get centerButtonMenuTutorialText =>
      'પ્રકાશિત મેનૂ આઇટમ પસંદ કરવા માટે કેન્દ્ર બટન દબાવો';

  @override
  String get playPauseMenuTutorialText =>
      'ગીત વગાડવા અથવા થોભવા માટે આ બટન દબાવો';

  @override
  String get nextButtonMenuTutorialText => 'આગલા ગીત પર જવા માટે આ બટન દબાવો';

  @override
  String get previousButtonMenuTutorialText =>
      'આ બટનને રીવાઇન્ડ કરવા અથવા પાછલા ગીત પર પાછા જવા માટે દબાવો';

  @override
  String get menuButtonTutorialText =>
      'પાછલા મેનૂ પર પાછા જવા માટે આ બટન દબાવો. તમે સીધા મુખ્ય મેનૂ પર જવા માટે તમે તેને કોઈપણ અન્ય સ્ક્રીનથી દબાવો અને પકડી શકો છો.';

  @override
  String get deviceScreenMenuTutorialText =>
      'આ ડિસ્પ્લે સ્ક્રીન છે. ટચ સ્ક્રીન અને સ્પ્લિટ સ્ક્રીન મોડ ડિફ default લ્ટ રૂપે સક્ષમ છે અને સેટિંગ્સમાં વધુ ગોઠવી શકાય છે.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'વોલ્યુમને સમાયોજિત કરવા માટે તમારા અંગૂઠાને ક્લિક વ્હીલની આસપાસ ખસેડો';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'સીક બાર, સ્ક્રબર બાર અને શફલ સ્લાઇડર દ્વારા ચક્ર કરવા માટે કેન્દ્ર બટન દબાવો. વધારાના વિકલ્પોને to ક્સેસ કરવા માટે કેન્દ્ર બટન દબાવો અને હોલ્ડ કરો.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'ગીતને ઝડપથી આગળ વધારવા માટે આ બટન દબાવો અને હોલ્ડ કરો';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'ગીતને ફરીથી દોરવા માટે આ બટન દબાવો અને પકડી રાખો';

  @override
  String get deviceControlSearchTutorialText =>
      'મૂળાક્ષરોને પ્રકાશિત કરવા માટે તમારા અંગૂઠાને ક્લિક વ્હીલની આસપાસ થોડું ખસેડો';

  @override
  String get centerButtonSearchTutorialText =>
      'પ્રકાશિત મૂળાક્ષરોને પસંદ કરવા માટે કેન્દ્ર બટન દબાવો';

  @override
  String get nextButtonSearchTutorialText => 'જગ્યા ઉમેરવા માટે આ બટન દબાવો';

  @override
  String get previousButtonSearchTutorialText =>
      'છેલ્લું પાત્ર કા delete ી નાખવા માટે આ બટન દબાવો';

  @override
  String get menuButtonSearchTutorialText =>
      'કીબોર્ડને બંધ કરવા અને શોધ પરિણામો સાથે સંપર્ક કરવા માટે આ બટન દબાવો';
}
