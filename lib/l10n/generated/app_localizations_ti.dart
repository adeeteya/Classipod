// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tigrinya (`ti`).
class AppLocalizationsTi extends AppLocalizations {
  AppLocalizationsTi([String locale = 'ti']) : super(locale);

  @override
  String get appTitle => 'ክላሲፖዶድ';

  @override
  String get menuButtonText => 'ዝርዝር መግቢ';

  @override
  String get audioAccessPermissionTitle => 'ናይ ድምጺ ምብጻሕ ፍቓድ የድሊ';

  @override
  String get audioAccessPermissionContent =>
      'ናይ ሙዚቃ ፋይላትኩም ንኽንጻወተሎም ንኽፈቕዱ ናይ ድምጺ ፋይላት መእተዊኹም ይሃብኩም።';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'ናይ ድምጺ ምብጻሕ ፍቓድ ተኸልኪሉ';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'በጃኹም ናይ ድምጺ ፋይላት ነዚ ኣፕ እዚ ኣብቲ ናይ መሳርሒ ቅጥዒታት ናይ ሙዚቃ ፋይላትኩም ክንጻወት ንኽፍቀደሎም ክትፍቀደሎም ትኽእል።';

  @override
  String get menuScreenTitle => 'ዝርዝር መግቢ';

  @override
  String get musicMenuScreenTitle => 'ሙዚቃ';

  @override
  String get nowPlayingScreenTitle => 'ሕጂ ምጽዋት';

  @override
  String get shuffleSongsMenuTitle => 'Shuffle ደርፍታት';

  @override
  String get shuffleSettingTitle => 'ሽፍለ .';

  @override
  String get settingsScreenTitle => 'ቅጥዕታት';

  @override
  String get aboutScreenTitle => 'ብዝዕባ';

  @override
  String get coverFlowScreenTitle => 'ዋሕዚ ሽፋን';

  @override
  String get artistsScreenTitle => 'ስነጥበባውያን';

  @override
  String get albumsScreenTitle => 'ኣልበማት';

  @override
  String get songsScreenTitle => 'ደርፍታት';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ደርፍታት',
      one: '1 ደርፊ',
      zero: 'ደርፍታት የለን',
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
      other: '$countString ኣልበማት',
      one: '1 ኣልበም',
      zero: 'ኣልበም የለን',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'ቅዲታት';

  @override
  String get genreSongsScreenTitle => 'ደርፍታት ጀንር';

  @override
  String get deviceColorSettingTitle => 'ናይ መሳርሒ ሕብሪ';

  @override
  String get touchScreenSettingTitle => 'ተንከስ ስክሪን ተኸፊቱ';

  @override
  String get repeatModeSettingTitle => 'ደገመ';

  @override
  String get repeatModeOne => 'ሓደ';

  @override
  String get repeatModeAll => 'ኩሎም';

  @override
  String get vibrateSettingTitle => 'ምንቅጥቃጥ .';

  @override
  String get clickWheelSettingTitle => 'ናይ መንኰርኰር ድምጽታት ጠውቕ';

  @override
  String get splitScreenSettingTitle => 'ስፕሊት ስክሪን ሞድ';

  @override
  String get touchSoundsDialogTitle => 'ድምጽታት ምትንካፍ .';

  @override
  String get touchSoundsDialogContent =>
      'በጃኻ ካብ System Settings ዝተወስደ ድምጺ ምትንኻፍ ኣንቂሕካ ድምጽታት click wheel ክትሰምዕ';

  @override
  String get immersiveModeSettingTitle => 'ምጥሓል ሞድ';

  @override
  String get showAppTutorialSettingTitle => 'ትምህርቲ ምርኢት';

  @override
  String get changeDirectorySettingTitle => 'ማህደር ምቕያር';

  @override
  String get donateSettingTitle => 'ምልጋስ';

  @override
  String get donateSettingDescription =>
      'ነዛ ኣፕ እንተፈቲኹምዋ፡ በጃኻ ምልጋስ ኣብ ግምት ኣእትዋ።';

  @override
  String get versionAboutScreenTitle => 'ሕታም';

  @override
  String get madeWithLoveTitle => 'ብ ❤️ ብ 100 ዝተሰርሐት ብ';

  @override
  String get noMusicFilesFound => 'ሙዚቃ የለን';

  @override
  String get noArtistsFound => 'ስነጥበባውያን የለን';

  @override
  String get noAlbumsFound => 'ኣልበም የለን';

  @override
  String get unknownSong => 'ዘይፍለጥ ደርፊ';

  @override
  String get unknownArtist => 'ዘይፍለጥ ስነጥበባዊ';

  @override
  String get unknownAlbum => 'ዘይተፈልጠ ኣልበም';

  @override
  String get unknownGenre => 'ዘይፍለጥ ቅዲ';

  @override
  String get buttonConfirmText => 'እሺ';

  @override
  String get tileValueOn => 'አብ ልዕሊ';

  @override
  String get tileValueOff => 'ምጥፋእ';

  @override
  String get commonOfText => 'ካብ';

  @override
  String get pageNotFoundText => 'እቲ ዝተዋህበ ገጽ ኣይተረኽበን ።';

  @override
  String get commonErrorText => 'ስሕተት';

  @override
  String get retryButtonText => 'ዳግማይ ምፍታን';

  @override
  String get filePickerDialogTitle => 'ንሙዚቃ ስካን ንምግባር ዝሕግዝ ማህደር ምረጽ';

  @override
  String get searchScreenTitle => 'ምድላይ';

  @override
  String get searchEmptyText => 'ውጽኢት ምድላይ የለን';

  @override
  String get searchResultsText => 'ውጽኢት ምድላይ:';

  @override
  String get resultsForText => 'ውጽኢት ን:';

  @override
  String get disableBatteryOptimizationTitle => 'ናይ ባትሪ ምምሕያሽ ምግባር';

  @override
  String get disableBatteryOptimizationContent =>
      'በጃኻ ነዚ ኣፕ ኣብ መሳርሒ ቅጥዕታት ናይ ባትሪ ምምሕያሽ ኣቋርጾ፡ ድሕረ ባይታ ምጽዋት ሙዚቃ ንኽፍቀድ።';

  @override
  String get languageScreenTitle => 'ቋንቋ';

  @override
  String get silverDeviceColor => 'ነሓስ';

  @override
  String get blackDeviceColor => 'ፀሊም';

  @override
  String get resetSettingsTitle => 'ቅጥዕታት ዳግማይ ምትካል';

  @override
  String get browseArtist => 'ስነጥበባዊ ዳህሳስ';

  @override
  String get browseAlbum => 'ኣልበም ዳህስስ';

  @override
  String get cancelText => 'ሰርዝ';

  @override
  String get playlistsScreenTitle => 'ዝርዝር ደርፍታት';

  @override
  String get addToOnTheGoPlaylist => 'ኣብ-እቲ';

  @override
  String get addAlbumToOnTheGoPlaylist => 'ኣልበም ናብ ኦን-ዘ-ጎስ ምውሳኽ';

  @override
  String get removeSongFromThePlaylist => 'ካብ ዝርዝር ደርፍታት ኣውጽእ ።';

  @override
  String get allAlbums => 'ኩሉ ኣልበማት';

  @override
  String get scanningMusicFiles => 'ናይ ሙዚቃ ፋይላት ስካን ምግባር';

  @override
  String get newPlaylist => 'ሓድሽ ዝርዝር ደርፍታት';

  @override
  String get savePlaylist => 'ዝርዝር ደርፍታት ኣድሕን';

  @override
  String get clearPlaylist => 'ንጹር ዝርዝር ደርፍታት';

  @override
  String get rescanMusicFilesSettingTitle => 'ሪስካን ሙዚቃ ፋይላት';

  @override
  String get deviceControlMenuTutorialText =>
      'ኣብቲ ዝርዝር ንምንቅስቓስ ኣጻብዕቲ ኢድካ ኣብ ዙርያ እቲ ናይ ጠውቂ መንኰርኰር ብቐሊሉ ኣንቀሳቕሶ።';

  @override
  String get centerButtonMenuTutorialText =>
      'ነቲ ዝጐደለ ናይ ምልክት ዝርዝር ነገራት ንምምራጽ ነቲ ማእከል መጠወቒ ንጽቀጥ .';

  @override
  String get playPauseMenuTutorialText => 'ነዚ መጠወቒ እዚ ምጽቃጥ ወይ ደርፊ ደው ንምባል';

  @override
  String get nextButtonMenuTutorialText =>
      'ነዚ መጠወቒ እዚ ብምጽቃጥ ናብ ዝቕጽል ደርፊ ንምዝላል .';

  @override
  String get previousButtonMenuTutorialText =>
      'ነዚ መጠወቒ እዚ ብምጽቃጥ ናብታ ዝሓለፈት ደርፊ ክትምለስ ።';

  @override
  String get menuButtonTutorialText =>
      'ናብቲ ዝሓለፈ ዝርዝር ንምምላስ ነዚ ቁልፊ ንጽቀጥ። ብቐጥታ ናብቲ ቀንዲ ዝርዝር ንምኻድ ካብ ዝኾነ ካልእ ስክሪን ጸቒጥካ ክትሕዞ ትኽእል ኢኻ።';

  @override
  String get deviceScreenMenuTutorialText =>
      'እዚ ናይ ዲስፕለይ ስክሪን እዩ። Touch Screen and Split Screen mode ብነባሪ ዝኽሰት ኮይኑ ኣብቲ ቅጥዕታት ብዝያዳ ክውነን ይኽእል።';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'ድምጺ ንምትዕርራይ ኣጻብዕትኻ ኣብ ዙርያ እቲ ናይ ጠውቂ መንኰርኰር ኣንቀሳቕሶ .';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'ነቲ ናይ ማእከል መጠወቒ ብምጽቃጥ ብመንገዲ Seek Bar, Scrubber Bar and Shuffle Slider ብሽክለታ ዑደት ግበር። ተወሳኺ ኣማራጺታት ንምርካብ ነቲ ናይ ማእከል መጠወቒ ጸቒጥካ ምሓዝ።';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'ነዚ መጠወቒ ጸቒጥካ ሒዝካ ሒዝካ ንቕጽላት እታ ደርፊ';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'ነዚ መጠወቒ እዚ ጸቒጥካ ሒዝካ ሒዝካ 2019።';

  @override
  String get deviceControlSearchTutorialText =>
      'ንኣጻብዕቲ ኢድካ ኣብ ዙርያ እቲ ናይ ጠውቂ መንኰርኰር ብቐሊሉ ኣንቀሳቕሶ እሞ ንሓደ ፊደላት ንምጉላሕ .';

  @override
  String get centerButtonSearchTutorialText =>
      'ነቲ ዝጐልሐ ፊደላት ንምምራጽ ነቲ ናይ ማእከል መጠወቒ ምጽቃጥ .';

  @override
  String get nextButtonSearchTutorialText => 'ነዚ መጠወቒ እዚ ብምጽቃጥ ቦታ ንምውሳኽ .';

  @override
  String get previousButtonSearchTutorialText =>
      'ነዚ ቁልፊ ብምጽቃጥ ናይ መወዳእታ ፊደል ንምድምሳስ .';

  @override
  String get menuButtonSearchTutorialText =>
      'ነዚ መጠወቒ እዚ ብምጽቃጥ ነቲ ቁልፊ ሰሌዳ ምዕጻውን ምስ ውጽኢት ምድላይ ንምትእስሳርን .';
}
