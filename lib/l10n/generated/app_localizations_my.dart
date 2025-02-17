// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Burmese (`my`).
class AppLocalizationsMy extends AppLocalizations {
  AppLocalizationsMy([String locale = 'my']) : super(locale);

  @override
  String get appTitle => 'စာသင်ခန်း';

  @override
  String get menuButtonText => 'အစားအသောက်စာရင်း';

  @override
  String get audioAccessPermissionTitle =>
      'အသံ Access ကိုခွင့်ပြုချက်လိုအပ်သည်';

  @override
  String get audioAccessPermissionContent =>
      'ကျေးဇူးပြု. သင်၏တေးဂီတဖိုင်များကိုကစားရန်ခွင့်ပြုရန်အသံဖိုင်များကိုဝင်ရောက်ခွင့်ပေးပါ။';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'အသံ Access ကိုခွင့်ပြုချက်ငြင်းပယ်';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'ကျေးဇူးပြု. သင်၏တေးဂီတဖိုင်များကိုဖွင့်ရန်ခွင့်ပြုရန် device settings တွင်ဤအက်ပလီကေးရှင်းအတွက်အသံဖိုင်များကို 0 င်ရောက်ခွင့်ပြုပါ။';

  @override
  String get menuScreenTitle => 'အစားအသောက်စာရင်း';

  @override
  String get musicMenuScreenTitle => 'ဂီတ';

  @override
  String get nowPlayingScreenTitle => 'ယခုကစား';

  @override
  String get shuffleSongsMenuTitle => 'Shuffle သီချင်းများ';

  @override
  String get shuffleSettingTitle => 'ရောနှော';

  @override
  String get settingsScreenTitle => 'ဆက်တင်များ';

  @override
  String get aboutScreenTitle => 'အကေြာင်း';

  @override
  String get coverFlowScreenTitle => 'Cover Flow';

  @override
  String get artistsScreenTitle => 'အနုပညာရှင်';

  @override
  String get albumsScreenTitle => 'အယ်ယာရာများ';

  @override
  String get songsScreenTitle => 'သီချင်း';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString သီချင်း',
      one: '1 သီချင်း',
      zero: 'သီချင်းများမရှိပါ။',
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
      other: '$countString အယ်လ်ဘမ်များ',
      one: '1 အခွေ',
      zero: 'အယ်လ်ဘမ်များမရှိပါ။',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'အမျိုးအစားစစ်မျိုးရိုး';

  @override
  String get genreSongsScreenTitle => 'အမျိုးအစားသီချင်းများ';

  @override
  String get deviceColorSettingTitle => 'ကိရိယာအရောင်';

  @override
  String get touchScreenSettingTitle => 'touch မျက်နှာပြင် enabled';

  @override
  String get repeatModeSettingTitle => 'ပြန်ဆို';

  @override
  String get repeatModeOne => 'တစ်';

  @override
  String get repeatModeAll => 'အားလုံး';

  @override
  String get vibrateSettingTitle => 'ခါ';

  @override
  String get clickWheelSettingTitle => 'ဘီးအသံကိုနှိပ်ပါ';

  @override
  String get splitScreenSettingTitle => 'Split Screen Mode ကို';

  @override
  String get touchSoundsDialogTitle => 'touch အသံ';

  @override
  String get touchSoundsDialogContent =>
      'ကျေးဇူးပြု. System Settings မှ System Settings မှ touch seetings မှ touch sounds ကိုဖွင့်ပါ';

  @override
  String get immersiveModeSettingTitle => 'ingsersive mode ကို';

  @override
  String get showAppTutorialSettingTitle => 'ပြပွဲသင်ခန်းစာ';

  @override
  String get changeDirectorySettingTitle => 'လမ်းညွှန်ကိုပြောင်းပါ';

  @override
  String get donateSettingTitle => 'ပေးကမ်း';

  @override
  String get donateSettingDescription =>
      'ဤအက်ပလီကေးရှင်းကိုသင်ကြိုက်နှစ်သက်ပါက ကျေးဇူးပြု. လှူဒါန်းရန်စဉ်းစားပါ။';

  @override
  String get versionAboutScreenTitle => 'ထင်မြင်ချက်';

  @override
  String get madeWithLoveTitle => 'by အားဖြင့်နှင့်အတူဖန်ဆင်းတော်မူ၏';

  @override
  String get noMusicFilesFound => 'ဂီတမရှိပါ';

  @override
  String get noArtistsFound => 'အဘယ်သူမျှမအနုပညာရှင်များ';

  @override
  String get noAlbumsFound => 'အဘယ်သူမျှမအယ်လ်ဘမ်များ';

  @override
  String get unknownSong => 'အမည်မသိသီချင်း';

  @override
  String get unknownArtist => 'အမည်မသိအနုပညာရှင်';

  @override
  String get unknownAlbum => 'အမည်မသိအယ်လ်ဘမ်';

  @override
  String get unknownGenre => 'မသိသောအမျိုးအစား';

  @override
  String get buttonConfirmText => 'အိုကေ';

  @override
  String get tileValueOn => 'အပေါ်';

  @override
  String get tileValueOff => 'သွား';

  @override
  String get commonOfText => '၏';

  @override
  String get pageNotFoundText => 'ပေးထားသောစာမျက်နှာကိုရှာမတွေ့ပါ';

  @override
  String get commonErrorText => 'အမှား';

  @override
  String get retryButtonText => 'ကြိုးစား';

  @override
  String get filePickerDialogTitle =>
      'တေးဂီတကိုစကင်ဖတ်စစ်ဆေးရန်လမ်းညွှန်ကိုရွေးချယ်ပါ';

  @override
  String get searchScreenTitle => 'ရှာဖေှခြင်း';

  @override
  String get searchEmptyText => 'ရှာဖွေမှုရလဒ်များမရှိပါ';

  @override
  String get searchResultsText => 'ရှာဖွေမှုရလဒ်များ -';

  @override
  String get resultsForText => 'ရလဒ်များအတွက်';

  @override
  String get disableBatteryOptimizationTitle => 'ဘက်ထရီ optimization ကိုပိတ်ပါ';

  @override
  String get disableBatteryOptimizationContent =>
      'တေးဂီတ၏နောက်ခံပြန်ဖွင့်ခြင်းကိုခွင့်ပြုရန် device settings တွင်ဒီအက်ပလီကေးရှင်းအတွက်ဘက်ထရီ optimization ကိုပိတ်ပါ။';

  @override
  String get languageScreenTitle => 'ဘာသာစကား';

  @override
  String get silverDeviceColor => 'ငှေ';

  @override
  String get blackDeviceColor => 'မဲသော';

  @override
  String get resetSettingsTitle => 'ချိန်ညှိချက်များပြန်လည်သတ်မှတ်';

  @override
  String get browseArtist => 'Browse အနုပညာရှင်';

  @override
  String get browseAlbum => 'အယ်လ်ဘမ် Browse';

  @override
  String get cancelText => 'ပျက်စေ';

  @override
  String get playlistsScreenTitle => 'သီချင်းစာရင်း';

  @override
  String get addToOnTheGoPlaylist => 'On-the-Go သို့ထည့်ပါ';

  @override
  String get addAlbumToOnTheGoPlaylist => 'on-the-go သို့အယ်လ်ဘမ်ထည့်ပါ';

  @override
  String get removeSongFromThePlaylist => 'ဖွင့်စာရင်းမှဖယ်ရှားပါ';

  @override
  String get allAlbums => 'အားလုံးအယ်လ်ဘမ်များ';

  @override
  String get scanningMusicFiles => 'ဂီတဖိုင်များကိုစကင်ဖတ်စစ်ဆေးပါ';

  @override
  String get newPlaylist => 'Playlist အသစ်';

  @override
  String get savePlaylist => 'playlist သိမ်းဆည်းပါ';

  @override
  String get clearPlaylist => 'ရှင်းလင်းသောဖွင့်စာရင်း';

  @override
  String get rescanMusicFilesSettingTitle => 'Press ကန်လ်ဂီတဖိုင်များ';

  @override
  String get deviceControlMenuTutorialText =>
      'မီနူးကိုသွားလာရန်သင်၏ thumb ကိုပေါ့ပေါ့တန်တန်ပါ';

  @override
  String get centerButtonMenuTutorialText =>
      'မီးမောင်းထိုးပြ menu ကိုရွေးရန်စင်တာခလုတ်ကိုနှိပ်ပါ';

  @override
  String get playPauseMenuTutorialText =>
      'သီချင်းတစ်ပုဒ်ကိုကစားရန်သို့မဟုတ်ခေတ္တရပ်တန့်ရန်ဤခလုတ်ကိုနှိပ်ပါ';

  @override
  String get nextButtonMenuTutorialText =>
      'နောက်သီချင်း skip to skip to ဒီခလုတ်ကိုနှိပ်ပါ';

  @override
  String get previousButtonMenuTutorialText =>
      'ယခင်သီချင်းသို့ပြန်သွားရန်သို့မဟုတ်သွားရန်ဤခလုတ်ကိုနှိပ်ပါ';

  @override
  String get menuButtonTutorialText =>
      'ယခင်မီနူးသို့ပြန်သွားရန်ဤခလုတ်ကိုနှိပ်ပါ။ Main Menu သို့တိုက်ရိုက်သွားရန်အခြားမည်သည့်မျက်နှာပြင်မှမဆို၎င်းကို နှိပ်. ကိုင်နိုင်သည်။';

  @override
  String get deviceScreenMenuTutorialText =>
      'ဒါက display screen ပါ။ Touch screen နှင့် split screen mode ကိုပုံမှန်အားဖြင့်ဖွင့်ထားပြီးချိန်ညှိချက်များတွင် ထပ်မံ. configure လုပ်နိုင်သည်။';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'အသံအတိုးအကျယ်ကိုထိန်းညှိရန်သင်၏လက်မကိုနှိပ်ပါ';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'SCRUBBER BAR နှင့် Shuffle Slider မှတဆင့် Cyce သို့ Cyce ခလုတ်ကိုနှိပ်ပါ။ နောက်ထပ်ရွေးချယ်စရာများကိုရယူရန်ဗဟိုခလုတ်ကို နှိပ်. ဖိထားပါ။';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'သီချင်းကိုမြန်မြန်ဆန်ဆန်အတွက်ဤခလုတ်ကို နှိပ်. ဖိထားပါ';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'သီချင်းကိုပြန်လှည့်ရန်ဤခလုတ်ကို နှိပ်. ဖိထားပါ';

  @override
  String get deviceControlSearchTutorialText =>
      'အက်ခရာကိုမီးမောင်းထိုးပြရန်သင်၏ thumb ကိုပေါ့ပေါ့တန်တန်ကြည့်ပါ';

  @override
  String get centerButtonSearchTutorialText =>
      'မီးမောင်းထိုးထားသောအက်ခရာကိုရွေးချယ်ရန် Center ခလုတ်ကိုနှိပ်ပါ';

  @override
  String get nextButtonSearchTutorialText => 'အာကာသထည့်ရန်ဤခလုတ်ကိုနှိပ်ပါ';

  @override
  String get previousButtonSearchTutorialText =>
      'နောက်ဆုံးဇာတ်ကောင်ကိုဖျက်ရန်ဤခလုတ်ကိုနှိပ်ပါ';

  @override
  String get menuButtonSearchTutorialText =>
      'ကီးဘုတ်ကိုပိတ်ရန်နှင့်ရှာဖွေမှုရလဒ်များနှင့်အပြန်အလှန်ဆက်သွယ်ရန်ဤခလုတ်ကိုနှိပ်ပါ';
}
