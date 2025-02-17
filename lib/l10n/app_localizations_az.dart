// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Azerbaijani (`az`).
class AppLocalizationsAz extends AppLocalizations {
  AppLocalizationsAz([String locale = 'az']) : super(locale);

  @override
  String get appTitle => 'Klassikod';

  @override
  String get menuButtonText => 'Menyu';

  @override
  String get audioAccessPermissionTitle => 'Səs giriş icazəsi tələb olunur';

  @override
  String get audioAccessPermissionContent =>
      'Zəhmət olmasa musiqi sənədlərinizi oynamağa imkan verən audio faylları əldə edin.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Səs giriş icazəsi rədd edildi';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Zəhmət olmasa, musiqi sənədlərinizi oynamağa imkan verən cihaz parametrlərində bu tətbiqetmədə audio fayllarına giriş imkanı verin.';

  @override
  String get menuScreenTitle => 'Menyu';

  @override
  String get musicMenuScreenTitle => 'Musiqi';

  @override
  String get nowPlayingScreenTitle => 'İndi oynayır';

  @override
  String get shuffleSongsMenuTitle => 'Shuffle mahnıları';

  @override
  String get shuffleSettingTitle => 'Qarışdırmaq';

  @override
  String get settingsScreenTitle => 'Parametrlər';

  @override
  String get aboutScreenTitle => 'Haqqında';

  @override
  String get coverFlowScreenTitle => 'Covullamaq';

  @override
  String get artistsScreenTitle => 'Sənətkarlar';

  @override
  String get albumsScreenTitle => 'Albom';

  @override
  String get songsScreenTitle => 'Mahnı';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Mahnılar',
      one: '1 mahnı',
      zero: 'Xeyr mahnılar',
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
      other: '$countString Albomlar',
      one: '1 albom',
      zero: 'Albomlar',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Janrlar';

  @override
  String get genreSongsScreenTitle => 'Janr mahnıları';

  @override
  String get deviceColorSettingTitle => 'Cihazın rəngi';

  @override
  String get touchScreenSettingTitle => 'Sensor ekran effektivdir';

  @override
  String get repeatModeSettingTitle => 'Təkrar etmək';

  @override
  String get repeatModeOne => 'Bir';

  @override
  String get repeatModeAll => 'Hamar';

  @override
  String get vibrateSettingTitle => 'Titrəmək';

  @override
  String get clickWheelSettingTitle => 'Təkər səslərini vurun';

  @override
  String get splitScreenSettingTitle => 'Ekran rejimi';

  @override
  String get touchSoundsDialogTitle => 'Toxunmaq';

  @override
  String get touchSoundsDialogContent =>
      'Zəhmət olmasa, tıklaması səslərini eşitmək üçün sistem parametrlərindən toxunma səslərini aktivləşdirin';

  @override
  String get immersiveModeSettingTitle => 'İmmersive rejimi';

  @override
  String get showAppTutorialSettingTitle => 'Dərslik göstərmək';

  @override
  String get changeDirectorySettingTitle => 'Kataloqu dəyişdirin';

  @override
  String get donateSettingTitle => 'Hədiyyə etmək';

  @override
  String get donateSettingDescription =>
      'Bu proqramı sevirsinizsə, xahiş edirəm bağışlanmağı düşünün.';

  @override
  String get versionAboutScreenTitle => 'Versiya';

  @override
  String get madeWithLoveTitle => 'İlə hazırlanmışdır';

  @override
  String get noMusicFilesFound => 'Musiqini yox';

  @override
  String get noArtistsFound => 'Rəssamlar yoxdur';

  @override
  String get noAlbumsFound => 'Albom yoxdur';

  @override
  String get unknownSong => 'Naməlum mahnı';

  @override
  String get unknownArtist => 'Naməlum sənətçi';

  @override
  String get unknownAlbum => 'Naməlum albom';

  @override
  String get unknownGenre => 'Naməlum janr';

  @override
  String get buttonConfirmText => 'Tamam';

  @override
  String get tileValueOn => 'Yan';

  @override
  String get tileValueOff => 'Sönük';

  @override
  String get commonOfText => 'biri';

  @override
  String get pageNotFoundText => 'Verilən səhifə tapılmadı';

  @override
  String get commonErrorText => 'Səhv';

  @override
  String get retryButtonText => 'Yenidən cəhd etmək';

  @override
  String get filePickerDialogTitle =>
      'Musiqi üçün skan etmək üçün bir qovluq seçin';

  @override
  String get searchScreenTitle => 'Axtarış';

  @override
  String get searchEmptyText => 'Axtarış nəticələri yoxdur';

  @override
  String get searchResultsText => 'Axtarış nəticələri:';

  @override
  String get resultsForText => 'Nəticələr:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Batareyanın optimallaşdırılmasını deaktiv edin';

  @override
  String get disableBatteryOptimizationContent =>
      'Zəhmət olmasa, musiqinin arxa səslənməsinə icazə vermək üçün cihaz parametrlərində bu tətbiq üçün batareyanın optimallaşdırılmasını deaktiv edin.';

  @override
  String get languageScreenTitle => 'Dil';

  @override
  String get silverDeviceColor => 'Gümüş';

  @override
  String get blackDeviceColor => 'Qara';

  @override
  String get resetSettingsTitle => 'Parametrləri yenidən qurun';

  @override
  String get browseArtist => 'Rəssamı gözdən keçirmək';

  @override
  String get browseAlbum => 'Albomu nəzərdən keçirin';

  @override
  String get cancelText => 'Ləğv etmək';

  @override
  String get playlistsScreenTitle => 'Siyahı siyahıları';

  @override
  String get addToOnTheGoPlaylist => 'Yolda əlavə edin';

  @override
  String get addAlbumToOnTheGoPlaylist => 'ALBUMU YOXDUR';

  @override
  String get removeSongFromThePlaylist => 'Pleylistdən çıxarın';

  @override
  String get allAlbums => 'Bütün albomlar';

  @override
  String get scanningMusicFiles => 'Musiqi fayllarını skan etmək';

  @override
  String get newPlaylist => 'Yeni siyahı';

  @override
  String get savePlaylist => 'Pleylisti saxla';

  @override
  String get clearPlaylist => 'Aydın siyahı siyahısı';

  @override
  String get rescanMusicFilesSettingTitle => 'Rescan musiqi faylları';

  @override
  String get deviceControlMenuTutorialText =>
      'Menyunu gəzmək üçün baş barmağınızı klik təkəri ətrafında gəzin';

  @override
  String get centerButtonMenuTutorialText =>
      'Yüklənmiş menyu elementini seçmək üçün Mərkəz düyməsini basın';

  @override
  String get playPauseMenuTutorialText =>
      'Bir mahnı oynamaq və ya fasilə etmək üçün bu düyməni basın';

  @override
  String get nextButtonMenuTutorialText =>
      'Növbəti mahnıya keçmək üçün bu düyməni basın';

  @override
  String get previousButtonMenuTutorialText =>
      'Əvvəlki mahnıya qayıtmaq və ya geri dönmək üçün bu düyməni basın';

  @override
  String get menuButtonTutorialText =>
      'Əvvəlki menyuya qayıtmaq üçün bu düyməni basın. Əsas menyuya birbaşa getmək üçün hər hansı digər ekrandan basıb saxlaya bilərsiniz.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Bu ekran ekranıdır. Sensor ekran və split ekran rejimi standart olaraq aktivdir və parametrlərdə daha da konfiqurasiya edilə bilər.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Səs səviyyəsini tənzimləmək üçün baş barmağınızı klik təkərinə köçürün';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Çubuğu, ovucu çubuğu və qarışıq kaydırıcıyı keçmək üçün mərkəz düyməsini basın. Əlavə seçimlərə daxil olmaq üçün mərkəz düyməsini basıb saxlayın.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Mahnını sürətlə irəli sürmək üçün bu düyməni basıb saxlayın';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Mahnını geri qaytarmaq üçün bu düyməni basıb saxlayın';

  @override
  String get deviceControlSearchTutorialText =>
      'Bir əlifbanı vurğulamaq üçün baş barmağınızı klik təkəri ətrafında gəzin';

  @override
  String get centerButtonSearchTutorialText =>
      'Yüklənmiş əlifbanı seçmək üçün mərkəz düyməsini basın';

  @override
  String get nextButtonSearchTutorialText =>
      'Bir boşluq əlavə etmək üçün bu düyməni basın';

  @override
  String get previousButtonSearchTutorialText =>
      'Son simvolu silmək üçün bu düyməni basın';

  @override
  String get menuButtonSearchTutorialText =>
      'Klaviaturanı bağlamaq və axtarış nəticələri ilə qarşılıqlı əlaqə yaratmaq üçün bu düyməni basın';
}
