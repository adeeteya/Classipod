// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Sinhala Sinhalese (`si`).
class AppLocalizationsSi extends AppLocalizations {
  AppLocalizationsSi([String locale = 'si']) : super(locale);

  @override
  String get appTitle => 'Classpod';

  @override
  String get menuButtonText => 'මෙනුව';

  @override
  String get audioAccessPermissionTitle => 'ශ්රව්ය ප්රවේශවීමේ අවසරය අවශ්යයි';

  @override
  String get audioAccessPermissionContent =>
      'කරුණාකර ඔබේ සංගීත ලිපිගොනු වාදනය කිරීමට ඉඩ දීම සඳහා කරුණාකර ශ්රව්ය ලිපිගොනු ප්රවේශය ලබා දෙන්න.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'ශ්රව්ය ප්රවේශවීමේ අවසරය ප්රතික්ෂේප විය';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'කරුණාකර ඔබේ සංගීත ලිපිගොනු වාදනය කිරීමට ඉඩ දීම සඳහා කරුණාකර උපාංග සැකසුම් තුළ මෙම යෙදුම සඳහා ශ්රව්ය ලිපිගොනු සඳහා ප්රවේශය ලබා දෙන්න.';

  @override
  String get menuScreenTitle => 'මෙනුව';

  @override
  String get musicMenuScreenTitle => 'සංගීතය';

  @override
  String get nowPlayingScreenTitle => 'දැන් සෙල්ලම් කරනවා';

  @override
  String get shuffleSongsMenuTitle => 'ගීත මාරු කරන්න';

  @override
  String get shuffleSettingTitle => 'මාරු කරන්න';

  @override
  String get settingsScreenTitle => 'සැකසුම්';

  @override
  String get aboutScreenTitle => 'ගැන';

  @override
  String get coverFlowScreenTitle => 'ආවරණ ප්රවාහය';

  @override
  String get artistsScreenTitle => 'කලාකරුවන්';

  @override
  String get albumsScreenTitle => 'ඇල්බම';

  @override
  String get songsScreenTitle => 'ගීත';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ගීත',
      one: '1 ගීතය',
      zero: 'ගීත නැත',
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
      other: '$countString ඇල්බම',
      one: '1 ඇල්බමය',
      zero: 'ඇල්බම නැත',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'ප්රභේද';

  @override
  String get genreSongsScreenTitle => 'ප්රභේද ගීත';

  @override
  String get deviceColorSettingTitle => 'උපාංග වර්ණය';

  @override
  String get touchScreenSettingTitle => 'ස්පර්ශ තිරය සක්රීය කර ඇත';

  @override
  String get repeatModeSettingTitle => 'නැවත නැවත කරන්න';

  @override
  String get repeatModeOne => 'එකක්';

  @override
  String get repeatModeAll => 'සියල්ල';

  @override
  String get vibrateSettingTitle => 'කම්පනය';

  @override
  String get clickWheelSettingTitle => 'රෝද ශබ්ද ක්ලික් කරන්න';

  @override
  String get splitScreenSettingTitle => 'ස්පයිට් තිර ප්රකාරය';

  @override
  String get touchSoundsDialogTitle => 'ස්පර්ශ ශබ්ද';

  @override
  String get touchSoundsDialogContent =>
      'කරුණාකර ක්ලික් රෝද ශබ්ද ඇසීමට කරුණාකර පද්ධති සැකසුම් වලින් ස්පර්ශ ශබ්ද සක්රීය කරන්න';

  @override
  String get immersiveModeSettingTitle => 'ගිලී ගිය මාදිලිය';

  @override
  String get showAppTutorialSettingTitle => 'නිබන්ධනය පෙන්වන්න';

  @override
  String get changeDirectorySettingTitle => 'නාමාවලිය වෙනස් කරන්න';

  @override
  String get donateSettingTitle => 'පරිත්යාග කරන්න';

  @override
  String get donateSettingDescription =>
      'ඔබ මෙම යෙදුමට කැමති නම්, කරුණාකර පරිත්යාග කරන්න.';

  @override
  String get versionAboutScreenTitle => 'අනුවාදය';

  @override
  String get madeWithLoveTitle => '❤️ සමඟ සාදන ලදී';

  @override
  String get noMusicFilesFound => 'සංගීතයක් නැත';

  @override
  String get noArtistsFound => 'කලාකරුවන් නැත';

  @override
  String get noAlbumsFound => 'ඇල්බමයක් නැත';

  @override
  String get unknownSong => 'නොදන්නා ගීතය';

  @override
  String get unknownArtist => 'නොදන්නා කලාකරුවා';

  @override
  String get unknownAlbum => 'නොදන්නා ඇල්බමය';

  @override
  String get unknownGenre => 'නොදන්නා ප්රභේදයක්';

  @override
  String get buttonConfirmText => 'හරි';

  @override
  String get tileValueOn => 'මත';

  @override
  String get tileValueOff => 'අක්රිය කරන්න';

  @override
  String get commonOfText => 'හි';

  @override
  String get pageNotFoundText => 'දී ඇති පිටුව හමු නොවීය';

  @override
  String get commonErrorText => 'දෝෂයකි';

  @override
  String get retryButtonText => 'නැවත උත්සාහ කරන්න';

  @override
  String get filePickerDialogTitle =>
      'සංගීතය සඳහා ස්කෑන් කිරීමට නාමාවලියක් තෝරන්න';

  @override
  String get searchScreenTitle => 'සෙවීම';

  @override
  String get searchEmptyText => 'සෙවුම් ප්රති .ල නොමැත';

  @override
  String get searchResultsText => 'සෙවුම් ප්රති results ල:';

  @override
  String get resultsForText => 'සඳහා ප්රති Results ල:';

  @override
  String get disableBatteryOptimizationTitle =>
      'බැටරි ප්රශස්තිකරණය අක්රීය කරන්න';

  @override
  String get disableBatteryOptimizationContent =>
      'සංගීත සැකසුම් තුළ ඇති මෙම යෙදුම සඳහා බැටරි ප්රශස්තිකරණය අක්රීය කරන්න සංගීතයේ පසුබිම් නැවත ධාවනය කිරීමට ඉඩ දීම.';

  @override
  String get languageScreenTitle => 'භාෂාව';

  @override
  String get silverDeviceColor => 'රිදී';

  @override
  String get blackDeviceColor => 'කළු';

  @override
  String get resetSettingsTitle => 'සැකසුම් යළි පිහිටුවන්න';

  @override
  String get browseArtist => 'කලාකරුවා පිරික්සන්න';

  @override
  String get browseAlbum => 'ඇල්බමය ගවේෂණය කරන්න';

  @override
  String get cancelText => 'අවලංගු කරන්න';

  @override
  String get playlistsScreenTitle => 'ධාවන ලැයිස්තු';

  @override
  String get addToOnTheGoPlaylist => 'ඉදිරියට යන්න';

  @override
  String get addAlbumToOnTheGoPlaylist => 'යන්න ඇල්බමය එක් කරන්න';

  @override
  String get removeSongFromThePlaylist => 'ධාවන ලැයිස්තුවෙන් ඉවත් කරන්න';

  @override
  String get allAlbums => 'සියලුම ඇල්බම';

  @override
  String get scanningMusicFiles => 'සංගීත ලිපිගොනු පරිලෝකනය කිරීම';

  @override
  String get newPlaylist => 'නව ධාවන ලැයිස්තුව';

  @override
  String get savePlaylist => 'ධාවන ලැයිස්තුව සුරැකන්න';

  @override
  String get clearPlaylist => 'නිවැරදි ධාවන ලැයිස්තුව';

  @override
  String get rescanMusicFilesSettingTitle => 'Respen සංගීත ලිපිගොනු';

  @override
  String get deviceControlMenuTutorialText =>
      'මෙනුව සැරිසැරීම සඳහා ඔබේ මාපටැඟිල්ල ක්ලික් රවුම වටා සැහැල්ලුවෙන් ගෙන යන්න';

  @override
  String get centerButtonMenuTutorialText =>
      'උද්දීපනය කළ මෙනු අයිතමය තේරීමට මධ්යස්ථාන බොත්තම ඔබන්න';

  @override
  String get playPauseMenuTutorialText =>
      'ගීතයක් සෙල්ලම් කිරීමට හෝ විරාමයක් කිරීමට මෙම බොත්තම ඔබන්න';

  @override
  String get nextButtonMenuTutorialText => 'ඊළඟ ගීතයට යන්න මෙම බොත්තම ඔබන්න';

  @override
  String get previousButtonMenuTutorialText =>
      'පෙර ගීතයට පෙරළීමට හෝ ආපසු යාමට මෙම බොත්තම ඔබන්න';

  @override
  String get menuButtonTutorialText =>
      'පෙර මෙනුව වෙත ආපසු යාමට මෙම බොත්තම ඔබන්න. ප්රධාන මෙනුවට කෙලින්ම යා යුතු වෙනත් ඕනෑම තිරයකින් ඔබට වෙනත් තිරයකින් එය තද කර තබා ගත හැකිය.';

  @override
  String get deviceScreenMenuTutorialText =>
      'මෙය දර්ශන තිරයයි. ස්පර්ශ තිරය සහ බෙදීම් තිර ප්රකාරය පෙරනිමියෙන් සක්රීය කර ඇති අතර සැකසීම් තුළ තවදුරටත් වින්යාසගත කළ හැකිය.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'පරිමාව සකස් කිරීම සඳහා ඔබේ මාපටැඟිල්ල ක්ලික් රවුම වටා ගෙන යන්න';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'බාර්එක, ස්ක්රබර් බාර් සහ ෂෆල් ස්ලයිඩරය සෙවීම තුළින් මැද චක්රයට ඔබන්න. අතිරේක විකල්ප වෙත ප්රවේශ වීම සඳහා මධ්යස්ථාන බොත්තම ඔබාගෙන සිටින්න.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'ගීතය වේගයෙන් ඉදිරියට ගෙන යාමට මෙම බොත්තම ඔබන්න';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'ගීතය පෙරළීමට මෙම බොත්තම ඔබන්න';

  @override
  String get deviceControlSearchTutorialText =>
      'හෝඩියක් ඉස්මතු කිරීම සඳහා ඔබේ මාපටැඟිල්ල ක්ලික් කරන්න ක්ලික් කරන්න';

  @override
  String get centerButtonSearchTutorialText =>
      'උද්දීපනය කළ හෝඩිය තෝරා ගැනීමට මධ්යස්ථාන බොත්තම ඔබන්න';

  @override
  String get nextButtonSearchTutorialText => 'ඉඩක් එක් කිරීමට මෙම බොත්තම ඔබන්න';

  @override
  String get previousButtonSearchTutorialText =>
      'අවසාන අක්ෂරය මකා දැමීමට මෙම බොත්තම ඔබන්න';

  @override
  String get menuButtonSearchTutorialText =>
      'යතුරුපුවරුව වැසීමට සහ සෙවුම් ප්රති .ල සමඟ අන්තර් ක්රියා කිරීමට මෙම බොත්තම ඔබන්න';

  @override
  String get allSongs => 'සියලුම ගීත';
}
