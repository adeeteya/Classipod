// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appTitle => 'கிளாசிபோட்';

  @override
  String get menuButtonText => 'பட்டி';

  @override
  String get audioAccessPermissionTitle => 'ஆடியோ அணுகல் அனுமதி தேவை';

  @override
  String get audioAccessPermissionContent => 'உங்கள் இசைக் கோப்புகளை இயக்க எங்களை அனுமதிக்க ஆடியோ கோப்புகளின் அணுகலை வழங்கவும்.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'ஆடியோ அணுகல் அனுமதி மறுக்கப்பட்டது';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'உங்கள் இசைக் கோப்புகளை இயக்க அனுமதிக்க சாதன அமைப்புகளில் இந்த பயன்பாட்டிற்கான ஆடியோ கோப்புகள் அணுகலை வழங்கவும்.';

  @override
  String get menuScreenTitle => 'பட்டி';

  @override
  String get musicMenuScreenTitle => 'இசை';

  @override
  String get nowPlayingScreenTitle => 'இப்போது விளையாடுகிறது';

  @override
  String get shuffleSongsMenuTitle => 'மாற்றும் பாடல்கள்';

  @override
  String get shuffleSettingTitle => 'கலக்கு';

  @override
  String get settingsScreenTitle => 'அமைப்புகள்';

  @override
  String get aboutScreenTitle => 'பற்றி';

  @override
  String get coverFlowScreenTitle => 'கவர் ஓட்டம்';

  @override
  String get artistsScreenTitle => 'கலைஞர்கள்';

  @override
  String get albumsScreenTitle => 'ஆல்பங்கள்';

  @override
  String get songsScreenTitle => 'பாடல்கள்';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString பாடல்கள்',
      one: '1 பாடல்',
      zero: 'பாடல்கள் இல்லை',
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
      other: '$countString ஆல்பங்கள்',
      one: '1 ஆல்பம்',
      zero: 'ஆல்பங்கள் இல்லை',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'வகைகள்';

  @override
  String get genreSongsScreenTitle => 'வகை பாடல்கள்';

  @override
  String get deviceColorSettingTitle => 'சாதன நிறம்';

  @override
  String get touchScreenSettingTitle => 'தொடுதிரை இயக்கப்பட்டது';

  @override
  String get repeatModeSettingTitle => 'மீண்டும்';

  @override
  String get repeatModeOne => 'ஒன்று';

  @override
  String get repeatModeAll => 'அனைத்தும்';

  @override
  String get vibrateSettingTitle => 'அதிர்வு';

  @override
  String get clickWheelSettingTitle => 'சக்கர ஒலிகளைக் கிளிக் செய்க';

  @override
  String get splitScreenSettingTitle => 'திரை பயன்முறையைப் பிரிக்கவும்';

  @override
  String get touchSoundsDialogTitle => 'தொடு ஒலிகள்';

  @override
  String get touchSoundsDialogContent => 'கிளிக் சக்கரம் ஒலிகளைக் கேட்க கணினி அமைப்புகளிலிருந்து தொடு ஒலிகளை இயக்கவும்';

  @override
  String get immersiveModeSettingTitle => 'அதிவேக முறை';

  @override
  String get showAppTutorialSettingTitle => 'டுடோரியலைக் காட்டு';

  @override
  String get changeDirectorySettingTitle => 'கோப்பகத்தை மாற்றவும்';

  @override
  String get donateSettingTitle => 'நன்கொடை';

  @override
  String get donateSettingDescription => 'இந்த பயன்பாட்டை நீங்கள் விரும்பினால், நன்கொடை அளிப்பதைக் கவனியுங்கள்.';

  @override
  String get versionAboutScreenTitle => 'பதிப்பு';

  @override
  String get madeWithLoveTitle => 'By உடன் தயாரிக்கப்பட்டது';

  @override
  String get noMusicFilesFound => 'இசை இல்லை';

  @override
  String get noArtistsFound => 'கலைஞர்கள் இல்லை';

  @override
  String get noAlbumsFound => 'ஆல்பங்கள் இல்லை';

  @override
  String get unknownSong => 'தெரியாத பாடல்';

  @override
  String get unknownArtist => 'தெரியாத கலைஞர்';

  @override
  String get unknownAlbum => 'தெரியாத ஆல்பம்';

  @override
  String get unknownGenre => 'தெரியாத வகை';

  @override
  String get buttonConfirmText => 'சரி';

  @override
  String get tileValueOn => 'ஆன்';

  @override
  String get tileValueOff => 'ஆஃப்';

  @override
  String get commonOfText => 'of';

  @override
  String get pageNotFoundText => 'கொடுக்கப்பட்ட பக்கம் காணப்படவில்லை';

  @override
  String get commonErrorText => 'பிழை';

  @override
  String get retryButtonText => 'மீண்டும் முயற்சிக்கவும்';

  @override
  String get filePickerDialogTitle => 'இசைக்கு ஸ்கேன் செய்ய ஒரு கோப்பகத்தைத் தேர்ந்தெடுக்கவும்';

  @override
  String get searchScreenTitle => 'தேடல்';

  @override
  String get searchEmptyText => 'தேடல் முடிவுகள் இல்லை';

  @override
  String get searchResultsText => 'தேடல் முடிவுகள்:';

  @override
  String get resultsForText => 'இதற்கான முடிவுகள்:';

  @override
  String get disableBatteryOptimizationTitle => 'பேட்டரி தேர்வுமுறை முடக்கு';

  @override
  String get disableBatteryOptimizationContent => 'இசையின் பின்னணி பின்னணியை அனுமதிக்க சாதன அமைப்புகளில் இந்த பயன்பாட்டிற்கான பேட்டரி தேர்வுமுறை முடக்கு.';

  @override
  String get languageScreenTitle => 'மொழி';

  @override
  String get silverDeviceColor => 'வெள்ளி';

  @override
  String get blackDeviceColor => 'கருப்பு';

  @override
  String get resetSettingsTitle => 'அமைப்புகளை மீட்டமைக்கவும்';

  @override
  String get browseArtist => 'கலைஞரை உலாவுக';

  @override
  String get browseAlbum => 'ஆல்பத்தை உலாவுக';

  @override
  String get cancelText => 'ரத்துசெய்';

  @override
  String get playlistsScreenTitle => 'பிளேலிஸ்ட்கள்';

  @override
  String get addToOnTheGoPlaylist => 'பயணத்தில் சேர்க்கவும்';

  @override
  String get addAlbumToOnTheGoPlaylist => 'பயணத்தில் ஆல்பத்தைச் சேர்க்கவும்';

  @override
  String get removeSongFromThePlaylist => 'பிளேலிஸ்ட்டிலிருந்து அகற்று';

  @override
  String get allAlbums => 'அனைத்து ஆல்பங்களும்';

  @override
  String get scanningMusicFiles => 'இசை கோப்புகளை ஸ்கேன் செய்கிறது';

  @override
  String get newPlaylist => 'புதிய பிளேலிஸ்ட்';

  @override
  String get savePlaylist => 'பிளேலிஸ்ட்டை சேமிக்கவும்';

  @override
  String get clearPlaylist => 'தெளிவான பிளேலிஸ்ட்';

  @override
  String get rescanMusicFilesSettingTitle => 'இசை கோப்புகளை மீட்டமைக்கவும்';

  @override
  String get deviceControlMenuTutorialText => 'மெனுவுக்கு செல்ல கிளிக் சக்கரத்தைச் சுற்றி உங்கள் கட்டைவிரலை லேசாக நகர்த்தவும்';

  @override
  String get centerButtonMenuTutorialText => 'சிறப்பம்சமாக மெனு உருப்படியைத் தேர்ந்தெடுக்க மைய பொத்தானை அழுத்தவும்';

  @override
  String get playPauseMenuTutorialText => 'ஒரு பாடலை இயக்க அல்லது இடைநிறுத்த இந்த பொத்தானை அழுத்தவும்';

  @override
  String get nextButtonMenuTutorialText => 'அடுத்த பாடலுக்கு தவிர்க்க இந்த பொத்தானை அழுத்தவும்';

  @override
  String get previousButtonMenuTutorialText => 'முன்னாடி வைக்க இந்த பொத்தானை அழுத்தவும் அல்லது முந்தைய பாடலுக்குச் செல்லவும்';

  @override
  String get menuButtonTutorialText => 'முந்தைய மெனுவுக்குச் செல்ல இந்த பொத்தானை அழுத்தவும். பிரதான மெனுவுக்கு நேரடியாகச் செல்ல நீங்கள் வேறு எந்தத் திரையிலிருந்தும் அதை அழுத்திப் பிடித்துக் கொள்ளலாம்.';

  @override
  String get deviceScreenMenuTutorialText => 'இது காட்சித் திரை. தொடுதிரை மற்றும் பிளவு திரை பயன்முறை இயல்புநிலையாக இயக்கப்பட்டிருக்கும் மற்றும் அமைப்புகளில் மேலும் கட்டமைக்கப்படலாம்.';

  @override
  String get deviceControlNowPlayingTutorialText => 'அளவை சரிசெய்ய உங்கள் கட்டைவிரலை கிளிக் சக்கரத்தைச் சுற்றி நகர்த்தவும்';

  @override
  String get centerButtonNowPlayingTutorialText => 'சீக்கர் பொத்தானை சுழற்சி செய்ய சீர் பொத்தானை அழுத்தவும், ஸ்க்ரப்பர் பார் மற்றும் ஷஃபிள் ஸ்லைடர் மூலம் சுழற்சி செய்யவும். கூடுதல் விருப்பங்களை அணுக மைய பொத்தானை அழுத்திப் பிடிக்கவும்.';

  @override
  String get nextButtonNowPlayingTutorialText => 'பாடலை வேகமாக அனுப்ப இந்த பொத்தானை அழுத்திப் பிடிக்கவும்';

  @override
  String get previousButtonNowPlayingTutorialText => 'பாடலை முன்னாடி இந்த பொத்தானை அழுத்திப் பிடிக்கவும்';

  @override
  String get deviceControlSearchTutorialText => 'ஒரு எழுத்துக்களை முன்னிலைப்படுத்த கிளிக் சக்கரத்தைச் சுற்றி உங்கள் கட்டைவிரலை லேசாக நகர்த்தவும்';

  @override
  String get centerButtonSearchTutorialText => 'சிறப்பிக்கப்பட்ட எழுத்துக்களைத் தேர்ந்தெடுக்க மைய பொத்தானை அழுத்தவும்';

  @override
  String get nextButtonSearchTutorialText => 'ஒரு இடத்தைச் சேர்க்க இந்த பொத்தானை அழுத்தவும்';

  @override
  String get previousButtonSearchTutorialText => 'கடைசி எழுத்தை நீக்க இந்த பொத்தானை அழுத்தவும்';

  @override
  String get menuButtonSearchTutorialText => 'விசைப்பலகை மூடவும், தேடல் முடிவுகளுடன் தொடர்பு கொள்ளவும் இந்த பொத்தானை அழுத்தவும்';
}
