// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Uzbek (`uz`).
class AppLocalizationsUz extends AppLocalizations {
  AppLocalizationsUz([String locale = 'uz']) : super(locale);

  @override
  String get appTitle => 'Klassipod';

  @override
  String get menuButtonText => 'Menyu';

  @override
  String get audioAccessPermissionTitle =>
      'Ovozga kirish uchun ruxsatnoma talab qilinadi';

  @override
  String get audioAccessPermissionContent =>
      'Iltimos, musiqiy fayllaringizni o\'ynashga ruxsat berish uchun audio fayllar kiradi.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'Audio kirish uchun ruxsat rad etildi';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'Iltimos, audio fayllarni ushbu ilova uchun musiqa fayllaringizni o\'ynashga imkon berish uchun ushbu ilova uchun AUDIO fayllari uchun ruxsat bering.';

  @override
  String get menuScreenTitle => 'Menyu';

  @override
  String get musicMenuScreenTitle => 'Musiqa';

  @override
  String get nowPlayingScreenTitle => 'Endi o\'ynash';

  @override
  String get shuffleSongsMenuTitle => 'Shuffle qo\'shiqlari';

  @override
  String get shuffleSettingTitle => 'Silkitmoq';

  @override
  String get settingsScreenTitle => 'Sozlash';

  @override
  String get aboutScreenTitle => 'Haqida';

  @override
  String get coverFlowScreenTitle => 'Qopqoq oqimi';

  @override
  String get artistsScreenTitle => 'San\'atkorlar';

  @override
  String get albumsScreenTitle => 'Albomlar';

  @override
  String get songsScreenTitle => 'Qo\'shiqlar';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Qo\'shiqlar',
      one: '1 Qo\'shiq',
      zero: 'Qo\'shiqlar yo\'q',
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
      one: '1 Albom',
      zero: 'Albomlar yo\'q',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Janrlar';

  @override
  String get genreSongsScreenTitle => 'Janr qo\'shiqlari';

  @override
  String get deviceColorSettingTitle => 'Qurilma rangi';

  @override
  String get touchScreenSettingTitle => 'Sensorli ekran yoqilgan';

  @override
  String get repeatModeSettingTitle => 'Takrorlamoq';

  @override
  String get repeatModeOne => 'Biri';

  @override
  String get repeatModeAll => 'Hamma';

  @override
  String get vibrateSettingTitle => 'Tebranmoq';

  @override
  String get clickWheelSettingTitle => 'G\'ildirak tovushlarini bosing';

  @override
  String get splitScreenSettingTitle => 'Sprit Ekran rejimida';

  @override
  String get touchSoundsDialogTitle => 'Tovush tovushlar';

  @override
  String get touchSoundsDialogContent =>
      'Iltimos, CLICK RUPRIGE tovushlarini eshitish uchun tizim sozlamalaridan teginish-ni yoqing';

  @override
  String get immersiveModeSettingTitle => 'Immer rejimi';

  @override
  String get showAppTutorialSettingTitle => 'Yorliqni ko\'rsatish';

  @override
  String get changeDirectorySettingTitle => 'Katalogni o\'zgartirish';

  @override
  String get donateSettingTitle => 'Xayr-ehson qilmoq';

  @override
  String get donateSettingDescription =>
      'Agar sizga ushbu ilova yoqsa, iltimos, xayr-ehson qiling.';

  @override
  String get versionAboutScreenTitle => 'Versiya';

  @override
  String get madeWithLoveTitle => 'Bilan qilingan ❤️ bilan qilingan';

  @override
  String get noMusicFilesFound => 'Hech qanday musiqa yo\'q';

  @override
  String get noArtistsFound => 'Rassomlar yo\'q';

  @override
  String get noAlbumsFound => 'Albom yo\'q';

  @override
  String get unknownSong => 'Noma\'lum qo\'shiq';

  @override
  String get unknownArtist => 'Noma\'lum rassom';

  @override
  String get unknownAlbum => 'Noma\'lum albom';

  @override
  String get unknownGenre => 'Noma\'lum janr';

  @override
  String get buttonConfirmText => 'KELISHDIKMI';

  @override
  String get tileValueOn => 'Yoqilgan';

  @override
  String get tileValueOff => 'O\'chirilgan';

  @override
  String get commonOfText => 'dan';

  @override
  String get pageNotFoundText => 'Ushbu sahifada topilmadi';

  @override
  String get commonErrorText => 'Xato';

  @override
  String get retryButtonText => 'Qaytadan urinib ko\'rmoq';

  @override
  String get filePickerDialogTitle =>
      'Musiqani tekshirish uchun katalogni tanlang';

  @override
  String get searchScreenTitle => 'Qidirish';

  @override
  String get searchEmptyText => 'Qidiruv natijalari yo\'q';

  @override
  String get searchResultsText => 'Qidiruv natijalari:';

  @override
  String get resultsForText => 'Natija:';

  @override
  String get disableBatteryOptimizationTitle =>
      'Batareyani optimallashtirishni o\'chiring';

  @override
  String get disableBatteryOptimizationContent =>
      'Iltimos, musiqa tinglashga ruxsat berish uchun ushbu ilova uchun batareyani optimallashtirishni o\'chiring.';

  @override
  String get languageScreenTitle => 'Til';

  @override
  String get silverDeviceColor => 'Kumush';

  @override
  String get blackDeviceColor => 'Qora';

  @override
  String get resetSettingsTitle => 'Sozlamalarni tiklash';

  @override
  String get browseArtist => 'Ko\'rib chiqishlari';

  @override
  String get browseAlbum => 'Albomni ko\'rib chiqish';

  @override
  String get cancelText => 'Bekor qilmoq';

  @override
  String get playlistsScreenTitle => 'Pleylistlar';

  @override
  String get addToOnTheGoPlaylist => 'On-ga qo\'shing';

  @override
  String get addAlbumToOnTheGoPlaylist => 'ALBUMNI BOSING';

  @override
  String get removeSongFromThePlaylist => 'Pleylistdan olib tashlang';

  @override
  String get allAlbums => 'Barcha albomlar';

  @override
  String get scanningMusicFiles => 'Musiqa fayllarini skanerlash';

  @override
  String get newPlaylist => 'Yangi pleylist';

  @override
  String get savePlaylist => 'Pleylistni saqlang';

  @override
  String get clearPlaylist => 'Pleyli pleylist';

  @override
  String get rescanMusicFilesSettingTitle => 'Refon musiqiy fayllari';

  @override
  String get deviceControlMenuTutorialText =>
      'Menyuni boshqarish uchun CLICK g\'ildiragida bosh barmog\'ingizni engil siljiting';

  @override
  String get centerButtonMenuTutorialText =>
      'Belgilangan menyu elementini tanlash uchun Markaz tugmasini bosing';

  @override
  String get playPauseMenuTutorialText =>
      'Qo\'shiqni o\'ynash yoki pauza qilish uchun ushbu tugmani bosing';

  @override
  String get nextButtonMenuTutorialText =>
      'Keyingi qo\'shiqqa o\'tish uchun ushbu tugmani bosing';

  @override
  String get previousButtonMenuTutorialText =>
      'Oldingi qo\'shiqqa qaytish yoki orqaga qaytish uchun ushbu tugmani bosing';

  @override
  String get menuButtonTutorialText =>
      'Oldingi menyuga qaytish uchun ushbu tugmani bosing. Siz boshqa biron bir ekrandan faqat asosiy menyuga o\'tish uchun ushlab turishingiz mumkin.';

  @override
  String get deviceScreenMenuTutorialText =>
      'Bu displey ekranidir. Sensorli ekran va satr ekran holati sukut bo\'yicha yoqilgan va keyingi sozlamalarda konfiguratsiya qilinishi mumkin.';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'Ovoz balandligini sozlash uchun bosh barmog\'ingizni bosing';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'Barmoq panjarasi, skruber barda va aralash slayderni aylanib o\'tish uchun CARC tugmasini bosing. Qo\'shimcha variantlarga kirish uchun Markaz tugmasini bosing va ushlab turing.';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'Qo\'shiqni oldinga o\'tkazish uchun ushbu tugmani bosing va ushlab turing';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'Qo\'shiqni orqaga qaytarish uchun ushbu tugmani bosing va ushlab turing';

  @override
  String get deviceControlSearchTutorialText =>
      'Alifboni ajratib ko\'rsatish uchun bosh barmog\'ingizni engil siljiting';

  @override
  String get centerButtonSearchTutorialText =>
      'Belgilangan alifboni tanlash uchun Markaz tugmasini bosing';

  @override
  String get nextButtonSearchTutorialText =>
      'Kamerani qo\'shish uchun ushbu tugmani bosing';

  @override
  String get previousButtonSearchTutorialText =>
      'So\'nggi belgini o\'chirish uchun ushbu tugmani bosing';

  @override
  String get menuButtonSearchTutorialText =>
      'Klaviaturani yopish va qidirish natijalari bilan o\'zaro aloqada bo\'lish uchun ushbu tugmani bosing';

  @override
  String get allSongs => 'Hamma qo\'shiqlar';
}
