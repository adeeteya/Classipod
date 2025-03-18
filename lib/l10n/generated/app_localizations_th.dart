// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appTitle => 'ชั้นเรียน';

  @override
  String get menuButtonText => 'เมนู';

  @override
  String get audioAccessPermissionTitle => 'ต้องได้รับอนุญาตการเข้าถึงเสียง';

  @override
  String get audioAccessPermissionContent =>
      'โปรดให้การเข้าถึงไฟล์เสียงเพื่อให้เราเล่นไฟล์เพลงของคุณ';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle =>
      'การอนุญาตการเข้าถึงเสียงถูกปฏิเสธ';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent =>
      'โปรดให้การเข้าถึงไฟล์เสียงสำหรับแอพนี้ในการตั้งค่าอุปกรณ์เพื่อให้เราเล่นไฟล์เพลงของคุณ';

  @override
  String get menuScreenTitle => 'เมนู';

  @override
  String get musicMenuScreenTitle => 'ดนตรี';

  @override
  String get nowPlayingScreenTitle => 'ตอนนี้เล่น';

  @override
  String get shuffleSongsMenuTitle => 'เพลงสับเปลี่ยน';

  @override
  String get shuffleSettingTitle => 'การสับเปลี่ยน';

  @override
  String get settingsScreenTitle => 'การตั้งค่า';

  @override
  String get aboutScreenTitle => 'เกี่ยวกับ';

  @override
  String get coverFlowScreenTitle => 'ไหลเวียน';

  @override
  String get artistsScreenTitle => 'ศิลปิน';

  @override
  String get albumsScreenTitle => 'อัลบั้ม';

  @override
  String get songsScreenTitle => 'เพลง';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString เพลง',
      one: '1 เพลง',
      zero: 'ไม่มีเพลง',
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
      other: '$countString อัลบั้ม',
      one: '1 อัลบั้ม',
      zero: 'ไม่มีอัลบั้ม',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'ประเภท';

  @override
  String get genreSongsScreenTitle => 'เพลงประเภท';

  @override
  String get deviceColorSettingTitle => 'สีอุปกรณ์';

  @override
  String get touchScreenSettingTitle => 'เปิดใช้งานหน้าจอสัมผัส';

  @override
  String get repeatModeSettingTitle => 'ทำซ้ำ';

  @override
  String get repeatModeOne => 'หนึ่ง';

  @override
  String get repeatModeAll => 'ทั้งหมด';

  @override
  String get vibrateSettingTitle => 'สั่น';

  @override
  String get clickWheelSettingTitle => 'เสียงล้อคลิก';

  @override
  String get splitScreenSettingTitle => 'โหมดหน้าจอแยก';

  @override
  String get touchSoundsDialogTitle => 'สัมผัสเสียง';

  @override
  String get touchSoundsDialogContent =>
      'โปรดเปิดใช้งานเสียงสัมผัสจากการตั้งค่าระบบเพื่อฟังเสียงล้อคลิก';

  @override
  String get immersiveModeSettingTitle => 'โหมดดื่มด่ำ';

  @override
  String get showAppTutorialSettingTitle => 'แสดงบทช่วยสอน';

  @override
  String get changeDirectorySettingTitle => 'เปลี่ยนไดเรกทอรี';

  @override
  String get donateSettingTitle => 'บริจาค';

  @override
  String get donateSettingDescription => 'หากคุณชอบแอพนี้โปรดพิจารณาบริจาค';

  @override
  String get versionAboutScreenTitle => 'รุ่น';

  @override
  String get madeWithLoveTitle => 'ทำด้วย❤โดย';

  @override
  String get noMusicFilesFound => 'ไม่มีเพลง';

  @override
  String get noArtistsFound => 'ไม่มีศิลปิน';

  @override
  String get noAlbumsFound => 'ไม่มีอัลบั้ม';

  @override
  String get unknownSong => 'เพลงที่ไม่รู้จัก';

  @override
  String get unknownArtist => 'ศิลปินที่ไม่รู้จัก';

  @override
  String get unknownAlbum => 'อัลบั้มที่ไม่รู้จัก';

  @override
  String get unknownGenre => 'ประเภทที่ไม่รู้จัก';

  @override
  String get buttonConfirmText => 'ตกลง';

  @override
  String get tileValueOn => 'บน';

  @override
  String get tileValueOff => 'ปิด';

  @override
  String get commonOfText => 'ของ';

  @override
  String get pageNotFoundText => 'ไม่พบหน้าเว็บที่กำหนด';

  @override
  String get commonErrorText => 'ข้อผิดพลาด';

  @override
  String get retryButtonText => 'ลองอีกครั้ง';

  @override
  String get filePickerDialogTitle => 'เลือกไดเรกทอรีเพื่อสแกนเพลง';

  @override
  String get searchScreenTitle => 'ค้นหา';

  @override
  String get searchEmptyText => 'ไม่มีผลการค้นหา';

  @override
  String get searchResultsText => 'ผลการค้นหา:';

  @override
  String get resultsForText => 'ผลลัพธ์สำหรับ:';

  @override
  String get disableBatteryOptimizationTitle =>
      'ปิดใช้งานการเพิ่มประสิทธิภาพแบตเตอรี่';

  @override
  String get disableBatteryOptimizationContent =>
      'โปรดปิดใช้งานการเพิ่มประสิทธิภาพแบตเตอรี่สำหรับแอพนี้ในการตั้งค่าอุปกรณ์เพื่อให้สามารถเล่นเพลงพื้นหลังได้';

  @override
  String get languageScreenTitle => 'ภาษา';

  @override
  String get silverDeviceColor => 'เงิน';

  @override
  String get blackDeviceColor => 'สีดำ';

  @override
  String get resetSettingsTitle => 'รีเซ็ตการตั้งค่า';

  @override
  String get browseArtist => 'เรียกดูศิลปิน';

  @override
  String get browseAlbum => 'เรียกดูอัลบั้ม';

  @override
  String get cancelText => 'ยกเลิก';

  @override
  String get playlistsScreenTitle => 'เพลย์ลิสต์';

  @override
  String get addToOnTheGoPlaylist => 'เพิ่มไปที่การเดินทาง';

  @override
  String get addAlbumToOnTheGoPlaylist => 'เพิ่มอัลบั้มในการเดินทาง';

  @override
  String get removeSongFromThePlaylist => 'ลบออกจากเพลย์ลิสต์';

  @override
  String get allAlbums => 'อัลบั้มทั้งหมด';

  @override
  String get scanningMusicFiles => 'สแกนไฟล์เพลง';

  @override
  String get newPlaylist => 'เพลย์ลิสต์ใหม่';

  @override
  String get savePlaylist => 'บันทึกเพลย์ลิสต์';

  @override
  String get clearPlaylist => 'เพลย์ลิสต์ที่ชัดเจน';

  @override
  String get rescanMusicFilesSettingTitle => 'ไฟล์เพลง Rescan';

  @override
  String get deviceControlMenuTutorialText =>
      'เลื่อนนิ้วโป้งของคุณเบา ๆ รอบล้อคลิกเพื่อนำทางเมนู';

  @override
  String get centerButtonMenuTutorialText =>
      'กดปุ่มกึ่งกลางเพื่อเลือกรายการเมนูที่ไฮไลต์';

  @override
  String get playPauseMenuTutorialText =>
      'กดปุ่มนี้เพื่อเล่นหรือหยุดเพลงชั่วคราว';

  @override
  String get nextButtonMenuTutorialText => 'กดปุ่มนี้เพื่อข้ามไปยังเพลงถัดไป';

  @override
  String get previousButtonMenuTutorialText =>
      'กดปุ่มนี้เพื่อย้อนกลับหรือกลับไปที่เพลงก่อนหน้า';

  @override
  String get menuButtonTutorialText =>
      'กดปุ่มนี้เพื่อกลับไปที่เมนูก่อนหน้า คุณสามารถกดค้างไว้จากหน้าจออื่น ๆ เพื่อไปที่เมนูหลักโดยตรง';

  @override
  String get deviceScreenMenuTutorialText =>
      'นี่คือหน้าจอแสดงผล หน้าจอสัมผัสและโหมดหน้าจอแยกถูกเปิดใช้งานโดยค่าเริ่มต้นและสามารถกำหนดค่าเพิ่มเติมในการตั้งค่า';

  @override
  String get deviceControlNowPlayingTutorialText =>
      'เลื่อนนิ้วโป้งของคุณไปรอบ ๆ ล้อคลิกเพื่อปรับระดับเสียง';

  @override
  String get centerButtonNowPlayingTutorialText =>
      'กดปุ่มกึ่งกลางเพื่อปั่นจักรยานผ่านแถบแสวงหาบาร์สครับและตัวเลื่อนสลับ กดปุ่มกึ่งกลางค้างไว้เพื่อเข้าถึงตัวเลือกเพิ่มเติม';

  @override
  String get nextButtonNowPlayingTutorialText =>
      'กดปุ่มนี้ค้างไว้เพื่อส่งต่อเพลงอย่างรวดเร็ว';

  @override
  String get previousButtonNowPlayingTutorialText =>
      'กดปุ่มนี้ค้างไว้เพื่อย้อนกลับเพลง';

  @override
  String get deviceControlSearchTutorialText =>
      'เลื่อนนิ้วโป้งของคุณเบา ๆ รอบล้อคลิกเพื่อเน้นตัวอักษร';

  @override
  String get centerButtonSearchTutorialText =>
      'กดปุ่มกึ่งกลางเพื่อเลือกตัวอักษรที่ไฮไลต์';

  @override
  String get nextButtonSearchTutorialText => 'กดปุ่มนี้เพื่อเพิ่มพื้นที่';

  @override
  String get previousButtonSearchTutorialText =>
      'กดปุ่มนี้เพื่อลบอักขระสุดท้าย';

  @override
  String get menuButtonSearchTutorialText =>
      'กดปุ่มนี้เพื่อปิดแป้นพิมพ์และโต้ตอบกับผลการค้นหา';

  @override
  String get allSongs => 'เพลงทั้งหมด';
}
