import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ace.dart';
import 'app_localizations_ach.dart';
import 'app_localizations_af.dart';
import 'app_localizations_ak.dart';
import 'app_localizations_alz.dart';
import 'app_localizations_am.dart';
import 'app_localizations_ar.dart';
import 'app_localizations_as.dart';
import 'app_localizations_awa.dart';
import 'app_localizations_ay.dart';
import 'app_localizations_az.dart';
import 'app_localizations_bal.dart';
import 'app_localizations_ban.dart';
import 'app_localizations_bbc.dart';
import 'app_localizations_bci.dart';
import 'app_localizations_be.dart';
import 'app_localizations_bem.dart';
import 'app_localizations_ber.dart';
import 'app_localizations_bew.dart';
import 'app_localizations_bg.dart';
import 'app_localizations_bho.dart';
import 'app_localizations_bik.dart';
import 'app_localizations_bm.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_bs.dart';
import 'app_localizations_bts.dart';
import 'app_localizations_btx.dart';
import 'app_localizations_bua.dart';
import 'app_localizations_ca.dart';
import 'app_localizations_ceb.dart';
import 'app_localizations_cgg.dart';
import 'app_localizations_chk.dart';
import 'app_localizations_ckb.dart';
import 'app_localizations_cnh.dart';
import 'app_localizations_co.dart';
import 'app_localizations_crh.dart';
import 'app_localizations_crs.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_cy.dart';
import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_din.dart';
import 'app_localizations_doi.dart';
import 'app_localizations_dv.dart';
import 'app_localizations_dyu.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_eo.dart';
import 'app_localizations_es.dart';
import 'app_localizations_et.dart';
import 'app_localizations_eu.dart';
import 'app_localizations_fa.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fil.dart';
import 'app_localizations_fon.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_fur.dart';
import 'app_localizations_fy.dart';
import 'app_localizations_ga.dart';
import 'app_localizations_gaa.dart';
import 'app_localizations_gd.dart';
import 'app_localizations_gl.dart';
import 'app_localizations_gn.dart';
import 'app_localizations_gom.dart';
import 'app_localizations_gu.dart';
import 'app_localizations_ha.dart';
import 'app_localizations_haw.dart';
import 'app_localizations_he.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_hil.dart';
import 'app_localizations_hmn.dart';
import 'app_localizations_hr.dart';
import 'app_localizations_hrx.dart';
import 'app_localizations_ht.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_hy.dart';
import 'app_localizations_iba.dart';
import 'app_localizations_id.dart';
import 'app_localizations_ig.dart';
import 'app_localizations_ilo.dart';
import 'app_localizations_is.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_jam.dart';
import 'app_localizations_jv.dart';
import 'app_localizations_ka.dart';
import 'app_localizations_kac.dart';
import 'app_localizations_kek.dart';
import 'app_localizations_kha.dart';
import 'app_localizations_kk.dart';
import 'app_localizations_km.dart';
import 'app_localizations_kn.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_kri.dart';
import 'app_localizations_ktu.dart';
import 'app_localizations_ku.dart';
import 'app_localizations_ky.dart';
import 'app_localizations_la.dart';
import 'app_localizations_lb.dart';
import 'app_localizations_lg.dart';
import 'app_localizations_lij.dart';
import 'app_localizations_lmo.dart';
import 'app_localizations_ln.dart';
import 'app_localizations_lo.dart';
import 'app_localizations_lt.dart';
import 'app_localizations_ltg.dart';
import 'app_localizations_luo.dart';
import 'app_localizations_lv.dart';
import 'app_localizations_mai.dart';
import 'app_localizations_mak.dart';
import 'app_localizations_mam.dart';
import 'app_localizations_mfe.dart';
import 'app_localizations_mg.dart';
import 'app_localizations_mhr.dart';
import 'app_localizations_mi.dart';
import 'app_localizations_min.dart';
import 'app_localizations_mk.dart';
import 'app_localizations_ml.dart';
import 'app_localizations_mn.dart';
import 'app_localizations_mni.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_ms.dart';
import 'app_localizations_mt.dart';
import 'app_localizations_mwr.dart';
import 'app_localizations_my.dart';
import 'app_localizations_ne.dart';
import 'app_localizations_new.dart';
import 'app_localizations_nhe.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_no.dart';
import 'app_localizations_nso.dart';
import 'app_localizations_nus.dart';
import 'app_localizations_ny.dart';
import 'app_localizations_om.dart';
import 'app_localizations_or.dart';
import 'app_localizations_pa.dart';
import 'app_localizations_pag.dart';
import 'app_localizations_pam.dart';
import 'app_localizations_pap.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_ps.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_qu.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_rom.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_rw.dart';
import 'app_localizations_sa.dart';
import 'app_localizations_sah.dart';
import 'app_localizations_sat.dart';
import 'app_localizations_scn.dart';
import 'app_localizations_sd.dart';
import 'app_localizations_shn.dart';
import 'app_localizations_si.dart';
import 'app_localizations_sk.dart';
import 'app_localizations_sl.dart';
import 'app_localizations_sm.dart';
import 'app_localizations_sn.dart';
import 'app_localizations_so.dart';
import 'app_localizations_sq.dart';
import 'app_localizations_sr.dart';
import 'app_localizations_st.dart';
import 'app_localizations_su.dart';
import 'app_localizations_sus.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_sw.dart';
import 'app_localizations_szl.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_te.dart';
import 'app_localizations_tet.dart';
import 'app_localizations_tg.dart';
import 'app_localizations_th.dart';
import 'app_localizations_ti.dart';
import 'app_localizations_tiv.dart';
import 'app_localizations_tk.dart';
import 'app_localizations_tl.dart';
import 'app_localizations_tpi.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_ts.dart';
import 'app_localizations_tt.dart';
import 'app_localizations_tum.dart';
import 'app_localizations_udm.dart';
import 'app_localizations_ug.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_uz.dart';
import 'app_localizations_vec.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_war.dart';
import 'app_localizations_xh.dart';
import 'app_localizations_yi.dart';
import 'app_localizations_yo.dart';
import 'app_localizations_yua.dart';
import 'app_localizations_yue.dart';
import 'app_localizations_zap.dart';
import 'app_localizations_zh.dart';
import 'app_localizations_zu.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ace'),
    Locale('ach'),
    Locale('af'),
    Locale('ak'),
    Locale('alz'),
    Locale('am'),
    Locale('ar'),
    Locale('as'),
    Locale('awa'),
    Locale('ay'),
    Locale('az'),
    Locale('bal'),
    Locale('ban'),
    Locale('bbc'),
    Locale('bci'),
    Locale('be'),
    Locale('bem'),
    Locale('ber'),
    Locale('bew'),
    Locale('bg'),
    Locale('bho'),
    Locale('bik'),
    Locale('bm'),
    Locale('bn'),
    Locale('bs'),
    Locale('bts'),
    Locale('btx'),
    Locale('bua'),
    Locale('ca'),
    Locale('ceb'),
    Locale('cgg'),
    Locale('chk'),
    Locale('ckb'),
    Locale('cnh'),
    Locale('co'),
    Locale('crh'),
    Locale('crs'),
    Locale('cs'),
    Locale('cy'),
    Locale('da'),
    Locale('de'),
    Locale('din'),
    Locale('doi'),
    Locale('dv'),
    Locale('dyu'),
    Locale('el'),
    Locale('en'),
    Locale('eo'),
    Locale('es'),
    Locale('et'),
    Locale('eu'),
    Locale('fa'),
    Locale('fi'),
    Locale('fil'),
    Locale('fon'),
    Locale('fr'),
    Locale('fur'),
    Locale('fy'),
    Locale('ga'),
    Locale('gaa'),
    Locale('gd'),
    Locale('gl'),
    Locale('gn'),
    Locale('gom'),
    Locale('gu'),
    Locale('ha'),
    Locale('haw'),
    Locale('he'),
    Locale('hi'),
    Locale('hil'),
    Locale('hmn'),
    Locale('hr'),
    Locale('hrx'),
    Locale('ht'),
    Locale('hu'),
    Locale('hy'),
    Locale('iba'),
    Locale('id'),
    Locale('ig'),
    Locale('ilo'),
    Locale('is'),
    Locale('it'),
    Locale('ja'),
    Locale('jam'),
    Locale('jv'),
    Locale('ka'),
    Locale('kac'),
    Locale('kek'),
    Locale('kha'),
    Locale('kk'),
    Locale('km'),
    Locale('kn'),
    Locale('ko'),
    Locale('kri'),
    Locale('ktu'),
    Locale('ku'),
    Locale('ky'),
    Locale('la'),
    Locale('lb'),
    Locale('lg'),
    Locale('lij'),
    Locale('lmo'),
    Locale('ln'),
    Locale('lo'),
    Locale('lt'),
    Locale('ltg'),
    Locale('luo'),
    Locale('lv'),
    Locale('mai'),
    Locale('mak'),
    Locale('mam'),
    Locale('mfe'),
    Locale('mg'),
    Locale('mhr'),
    Locale('mi'),
    Locale('min'),
    Locale('mk'),
    Locale('ml'),
    Locale('mn'),
    Locale('mni'),
    Locale('mr'),
    Locale('ms'),
    Locale('mt'),
    Locale('mwr'),
    Locale('my'),
    Locale('ne'),
    Locale('new'),
    Locale('nhe'),
    Locale('nl'),
    Locale('no'),
    Locale('nso'),
    Locale('nus'),
    Locale('ny'),
    Locale('om'),
    Locale('or'),
    Locale('pa'),
    Locale('pag'),
    Locale('pam'),
    Locale('pap'),
    Locale('pl'),
    Locale('ps'),
    Locale('pt'),
    Locale('qu'),
    Locale('ro'),
    Locale('rom'),
    Locale('ru'),
    Locale('rw'),
    Locale('sa'),
    Locale('sah'),
    Locale('sat'),
    Locale('scn'),
    Locale('sd'),
    Locale('shn'),
    Locale('si'),
    Locale('sk'),
    Locale('sl'),
    Locale('sm'),
    Locale('sn'),
    Locale('so'),
    Locale('sq'),
    Locale('sr'),
    Locale('st'),
    Locale('su'),
    Locale('sus'),
    Locale('sv'),
    Locale('sw'),
    Locale('szl'),
    Locale('ta'),
    Locale('te'),
    Locale('tet'),
    Locale('tg'),
    Locale('th'),
    Locale('ti'),
    Locale('tiv'),
    Locale('tk'),
    Locale('tl'),
    Locale('tpi'),
    Locale('tr'),
    Locale('ts'),
    Locale('tt'),
    Locale('tum'),
    Locale('udm'),
    Locale('ug'),
    Locale('uk'),
    Locale('ur'),
    Locale('uz'),
    Locale('vec'),
    Locale('vi'),
    Locale('war'),
    Locale('xh'),
    Locale('yi'),
    Locale('yo'),
    Locale('yua'),
    Locale('yue'),
    Locale('zap'),
    Locale('zh'),
    Locale('zu')
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'ClassiPod'**
  String get appTitle;

  /// The text of the menu button
  ///
  /// In en, this message translates to:
  /// **'MENU'**
  String get menuButtonText;

  /// The title of the audio access permission dialog
  ///
  /// In en, this message translates to:
  /// **'Audio Access Permission Required'**
  String get audioAccessPermissionTitle;

  /// The content of the audio files access permission dialog
  ///
  /// In en, this message translates to:
  /// **'Please grant audio files access to allow us to play your music files.'**
  String get audioAccessPermissionContent;

  /// The title of the audio access permission permanently denied dialog
  ///
  /// In en, this message translates to:
  /// **'Audio Access Permission Denied'**
  String get audioAccessPermissionPermanentlyDeniedTitle;

  /// The content of the audio files access permission permanently denied dialog
  ///
  /// In en, this message translates to:
  /// **'Please grant audio files access for this app in the device settings to allow us to play your music files.'**
  String get audioAccessPermissionPermanentlyDeniedContent;

  /// The title of the menu screen
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get menuScreenTitle;

  /// The title of the music menu screen
  ///
  /// In en, this message translates to:
  /// **'Music'**
  String get musicMenuScreenTitle;

  /// The title of the now playing screen
  ///
  /// In en, this message translates to:
  /// **'Now Playing'**
  String get nowPlayingScreenTitle;

  /// The title of shuffle songs feature
  ///
  /// In en, this message translates to:
  /// **'Shuffle Songs'**
  String get shuffleSongsMenuTitle;

  /// The title of the shuffle setting
  ///
  /// In en, this message translates to:
  /// **'Shuffle'**
  String get shuffleSettingTitle;

  /// The title of the settings screen
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsScreenTitle;

  /// The title of the about screen
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutScreenTitle;

  /// The title of the cover flow screen
  ///
  /// In en, this message translates to:
  /// **'Cover Flow'**
  String get coverFlowScreenTitle;

  /// The title of the artists screen
  ///
  /// In en, this message translates to:
  /// **'Artists'**
  String get artistsScreenTitle;

  /// The title of the albums screen
  ///
  /// In en, this message translates to:
  /// **'Albums'**
  String get albumsScreenTitle;

  /// The title of the songs screen
  ///
  /// In en, this message translates to:
  /// **'Songs'**
  String get songsScreenTitle;

  /// A message to show number of songs
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No Songs} =1{1 Song} other{{count} Songs}}'**
  String nSongs(num count);

  /// A message to show number of albums
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No Albums} =1{1 Album} other{{count} Albums}}'**
  String nAlbums(num count);

  /// The title of the genres screen
  ///
  /// In en, this message translates to:
  /// **'Genres'**
  String get genresScreenTitle;

  /// The title of the genre songs screen
  ///
  /// In en, this message translates to:
  /// **'Genre Songs'**
  String get genreSongsScreenTitle;

  /// The title of the device color setting
  ///
  /// In en, this message translates to:
  /// **'Device Color'**
  String get deviceColorSettingTitle;

  /// The title of the touch screen setting
  ///
  /// In en, this message translates to:
  /// **'Touch Screen Enabled'**
  String get touchScreenSettingTitle;

  /// The title of the repeat mode setting
  ///
  /// In en, this message translates to:
  /// **'Repeat'**
  String get repeatModeSettingTitle;

  /// The text of the repeat mode for looping one song
  ///
  /// In en, this message translates to:
  /// **'One'**
  String get repeatModeOne;

  /// The text of the repeat mode for looping all the songs
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get repeatModeAll;

  /// The title of the vibrate setting
  ///
  /// In en, this message translates to:
  /// **'Vibrate'**
  String get vibrateSettingTitle;

  /// The title of the click wheel sound setting
  ///
  /// In en, this message translates to:
  /// **'Click Wheel Sounds'**
  String get clickWheelSettingTitle;

  /// The title of the split screen mode setting
  ///
  /// In en, this message translates to:
  /// **'Split Screen Mode'**
  String get splitScreenSettingTitle;

  /// The title of the touch sounds dialog
  ///
  /// In en, this message translates to:
  /// **'Touch Sounds'**
  String get touchSoundsDialogTitle;

  /// The contents of the touch sounds dialog
  ///
  /// In en, this message translates to:
  /// **'Please Enable Touch Sounds from System Settings to hear the click wheel sounds'**
  String get touchSoundsDialogContent;

  /// The title of the immersive mode setting
  ///
  /// In en, this message translates to:
  /// **'Immersive Mode'**
  String get immersiveModeSettingTitle;

  /// The title of the show app tutorial setting
  ///
  /// In en, this message translates to:
  /// **'Show Tutorial'**
  String get showAppTutorialSettingTitle;

  /// The title of the change directory setting
  ///
  /// In en, this message translates to:
  /// **'Change Directory'**
  String get changeDirectorySettingTitle;

  /// The title of the donate setting
  ///
  /// In en, this message translates to:
  /// **'Donate'**
  String get donateSettingTitle;

  /// The description of the donate setting
  ///
  /// In en, this message translates to:
  /// **'If you like this app, please consider donating.'**
  String get donateSettingDescription;

  /// The title of the version tile in the about screen
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get versionAboutScreenTitle;

  /// The title of the made with love section in the about screen
  ///
  /// In en, this message translates to:
  /// **'Made with ❤️ by'**
  String get madeWithLoveTitle;

  /// The message displayed when no music files are found
  ///
  /// In en, this message translates to:
  /// **'No Music'**
  String get noMusicFilesFound;

  /// The message displayed when no artists are found
  ///
  /// In en, this message translates to:
  /// **'No Artists'**
  String get noArtistsFound;

  /// The message displayed when no albums are found
  ///
  /// In en, this message translates to:
  /// **'No Albums'**
  String get noAlbumsFound;

  /// When the name of a song is unknown
  ///
  /// In en, this message translates to:
  /// **'Unknown Song'**
  String get unknownSong;

  /// When the artist of a song is unknown
  ///
  /// In en, this message translates to:
  /// **'Unknown Artist'**
  String get unknownArtist;

  /// When the album of a song is unknown
  ///
  /// In en, this message translates to:
  /// **'Unknown Album'**
  String get unknownAlbum;

  /// When the genre of a song is unknown
  ///
  /// In en, this message translates to:
  /// **'Unknown Genre'**
  String get unknownGenre;

  /// The text of the confirm button
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get buttonConfirmText;

  /// The value of the tile when it is on
  ///
  /// In en, this message translates to:
  /// **'On'**
  String get tileValueOn;

  /// The value of the tile when it is off
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get tileValueOff;

  /// The text 'of'
  ///
  /// In en, this message translates to:
  /// **'of'**
  String get commonOfText;

  /// The message displayed when the page is not found
  ///
  /// In en, this message translates to:
  /// **'The given page was not found'**
  String get pageNotFoundText;

  /// The text 'Error'
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get commonErrorText;

  /// The text of the retry button
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retryButtonText;

  /// The title of the file picker dialog
  ///
  /// In en, this message translates to:
  /// **'Select a Directory to Scan for Music'**
  String get filePickerDialogTitle;

  /// The title of the search screen
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchScreenTitle;

  /// The message displayed when no search results are found
  ///
  /// In en, this message translates to:
  /// **'No Search Results'**
  String get searchEmptyText;

  /// The text 'Search Results: ' for the title of the search screen
  ///
  /// In en, this message translates to:
  /// **'Search Results: '**
  String get searchResultsText;

  /// The text 'Results for: ' for the found searches
  ///
  /// In en, this message translates to:
  /// **'Results for: '**
  String get resultsForText;

  /// The title of the disable battery optimization dialog
  ///
  /// In en, this message translates to:
  /// **'Disable Battery Optimization'**
  String get disableBatteryOptimizationTitle;

  /// The content of the disable battery optimization dialog
  ///
  /// In en, this message translates to:
  /// **'Please disable battery optimization for this app in the device settings to allow background playback of music.'**
  String get disableBatteryOptimizationContent;

  /// The title of the language screen
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageScreenTitle;

  /// The name of the silver device color
  ///
  /// In en, this message translates to:
  /// **'Silver'**
  String get silverDeviceColor;

  /// The name of the black device color
  ///
  /// In en, this message translates to:
  /// **'Black'**
  String get blackDeviceColor;

  /// The title of the reset settings dialog
  ///
  /// In en, this message translates to:
  /// **'Reset Settings'**
  String get resetSettingsTitle;

  /// The text of the browse artist option
  ///
  /// In en, this message translates to:
  /// **'Browse Artist'**
  String get browseArtist;

  /// The text of the browse album option
  ///
  /// In en, this message translates to:
  /// **'Browse Album'**
  String get browseAlbum;

  /// The text of the cancel list tile
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelText;

  /// The title of the playlists screen
  ///
  /// In en, this message translates to:
  /// **'Playlists'**
  String get playlistsScreenTitle;

  /// The text of the add to on-the-go playlist option
  ///
  /// In en, this message translates to:
  /// **'Add to On-The-Go'**
  String get addToOnTheGoPlaylist;

  /// The text of the add album to on-the-go playlist option
  ///
  /// In en, this message translates to:
  /// **'Add Album to On-The-Go'**
  String get addAlbumToOnTheGoPlaylist;

  /// The text of the remove song from the playlist option
  ///
  /// In en, this message translates to:
  /// **'Remove from the Playlist'**
  String get removeSongFromThePlaylist;

  /// The text of the all albums playlist
  ///
  /// In en, this message translates to:
  /// **'All Albums'**
  String get allAlbums;

  /// The text of the scanning music in splash screen
  ///
  /// In en, this message translates to:
  /// **'Scanning Music Files'**
  String get scanningMusicFiles;

  /// The text of the new playlist list tile
  ///
  /// In en, this message translates to:
  /// **'New Playlist'**
  String get newPlaylist;

  /// The text of the save playlist list tile
  ///
  /// In en, this message translates to:
  /// **'Save Playlist'**
  String get savePlaylist;

  /// The text of the clear playlist list tile
  ///
  /// In en, this message translates to:
  /// **'Clear Playlist'**
  String get clearPlaylist;

  /// The text of the rescan music files settings tile
  ///
  /// In en, this message translates to:
  /// **'Rescan Music Files'**
  String get rescanMusicFilesSettingTitle;

  /// The tutorial text for the device controls when user opens menu for the first time
  ///
  /// In en, this message translates to:
  /// **'Move your thumb lightly around the Click Wheel to navigate the menu'**
  String get deviceControlMenuTutorialText;

  /// The tutorial text for the center button when user opens menu for the first time
  ///
  /// In en, this message translates to:
  /// **'Press the center button to select the highlighted menu item'**
  String get centerButtonMenuTutorialText;

  /// The tutorial text for the play pause button when user opens menu for the first time
  ///
  /// In en, this message translates to:
  /// **'Press this button to play or pause a song'**
  String get playPauseMenuTutorialText;

  /// The tutorial text for the next button when user opens menu for the first time
  ///
  /// In en, this message translates to:
  /// **'Press this button to skip to the next song'**
  String get nextButtonMenuTutorialText;

  /// The tutorial text for the previous button when user opens menu for the first time
  ///
  /// In en, this message translates to:
  /// **'Press this button to rewind or go back to the previous song'**
  String get previousButtonMenuTutorialText;

  /// The tutorial text for the menu button when user opens menu for the first time
  ///
  /// In en, this message translates to:
  /// **'Press this button to go back to the previous menu. You could press and hold it from any other screen to directly go to the main menu.'**
  String get menuButtonTutorialText;

  /// The tutorial text for the device screen when user opens menu for the first time
  ///
  /// In en, this message translates to:
  /// **'This is the display screen. Touch Screen and Split Screen Mode are enabled by default and can be configured further in the settings.'**
  String get deviceScreenMenuTutorialText;

  /// The tutorial text for the device controls when user is in now playing screen for the first time
  ///
  /// In en, this message translates to:
  /// **'Move your thumb around the Click Wheel to adjust the volume'**
  String get deviceControlNowPlayingTutorialText;

  /// The tutorial text for the center button when user is in now playing screen for the first time
  ///
  /// In en, this message translates to:
  /// **'Press the Center button to cycle through seek bar, scrubber bar and shuffle slider. Press and hold the Center button to access additional options.'**
  String get centerButtonNowPlayingTutorialText;

  /// The tutorial text for the next button when user is in now playing screen for the first time
  ///
  /// In en, this message translates to:
  /// **'Press and hold this button to fast forward the song'**
  String get nextButtonNowPlayingTutorialText;

  /// The tutorial text for the previous button when user is in now playing screen for the first time
  ///
  /// In en, this message translates to:
  /// **'Press and hold this button to rewind the song'**
  String get previousButtonNowPlayingTutorialText;

  /// The tutorial text for the device controls when user is in search screen for the first time
  ///
  /// In en, this message translates to:
  /// **'Move your thumb lightly around the Click Wheel to highlight a alphabet'**
  String get deviceControlSearchTutorialText;

  /// The tutorial text for the center button when user is in search screen for the first time
  ///
  /// In en, this message translates to:
  /// **'Press the center button to select the highlighted alphabet'**
  String get centerButtonSearchTutorialText;

  /// The tutorial text for the next button when user is in search screen for the first time
  ///
  /// In en, this message translates to:
  /// **'Press this button to add a space'**
  String get nextButtonSearchTutorialText;

  /// The tutorial text for the previous button when user is in search screen for the first time
  ///
  /// In en, this message translates to:
  /// **'Press this button to delete the last character'**
  String get previousButtonSearchTutorialText;

  /// The tutorial text for the menu button when user is in search screen for the first time
  ///
  /// In en, this message translates to:
  /// **'Press this button to close the keyboard and interact with the search results'**
  String get menuButtonSearchTutorialText;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'ace',
        'ach',
        'af',
        'ak',
        'alz',
        'am',
        'ar',
        'as',
        'awa',
        'ay',
        'az',
        'bal',
        'ban',
        'bbc',
        'bci',
        'be',
        'bem',
        'ber',
        'bew',
        'bg',
        'bho',
        'bik',
        'bm',
        'bn',
        'bs',
        'bts',
        'btx',
        'bua',
        'ca',
        'ceb',
        'cgg',
        'chk',
        'ckb',
        'cnh',
        'co',
        'crh',
        'crs',
        'cs',
        'cy',
        'da',
        'de',
        'din',
        'doi',
        'dv',
        'dyu',
        'el',
        'en',
        'eo',
        'es',
        'et',
        'eu',
        'fa',
        'fi',
        'fil',
        'fon',
        'fr',
        'fur',
        'fy',
        'ga',
        'gaa',
        'gd',
        'gl',
        'gn',
        'gom',
        'gu',
        'ha',
        'haw',
        'he',
        'hi',
        'hil',
        'hmn',
        'hr',
        'hrx',
        'ht',
        'hu',
        'hy',
        'iba',
        'id',
        'ig',
        'ilo',
        'is',
        'it',
        'ja',
        'jam',
        'jv',
        'ka',
        'kac',
        'kek',
        'kha',
        'kk',
        'km',
        'kn',
        'ko',
        'kri',
        'ktu',
        'ku',
        'ky',
        'la',
        'lb',
        'lg',
        'lij',
        'lmo',
        'ln',
        'lo',
        'lt',
        'ltg',
        'luo',
        'lv',
        'mai',
        'mak',
        'mam',
        'mfe',
        'mg',
        'mhr',
        'mi',
        'min',
        'mk',
        'ml',
        'mn',
        'mni',
        'mr',
        'ms',
        'mt',
        'mwr',
        'my',
        'ne',
        'new',
        'nhe',
        'nl',
        'no',
        'nso',
        'nus',
        'ny',
        'om',
        'or',
        'pa',
        'pag',
        'pam',
        'pap',
        'pl',
        'ps',
        'pt',
        'qu',
        'ro',
        'rom',
        'ru',
        'rw',
        'sa',
        'sah',
        'sat',
        'scn',
        'sd',
        'shn',
        'si',
        'sk',
        'sl',
        'sm',
        'sn',
        'so',
        'sq',
        'sr',
        'st',
        'su',
        'sus',
        'sv',
        'sw',
        'szl',
        'ta',
        'te',
        'tet',
        'tg',
        'th',
        'ti',
        'tiv',
        'tk',
        'tl',
        'tpi',
        'tr',
        'ts',
        'tt',
        'tum',
        'udm',
        'ug',
        'uk',
        'ur',
        'uz',
        'vec',
        'vi',
        'war',
        'xh',
        'yi',
        'yo',
        'yua',
        'yue',
        'zap',
        'zh',
        'zu'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ace':
      return AppLocalizationsAce();
    case 'ach':
      return AppLocalizationsAch();
    case 'af':
      return AppLocalizationsAf();
    case 'ak':
      return AppLocalizationsAk();
    case 'alz':
      return AppLocalizationsAlz();
    case 'am':
      return AppLocalizationsAm();
    case 'ar':
      return AppLocalizationsAr();
    case 'as':
      return AppLocalizationsAs();
    case 'awa':
      return AppLocalizationsAwa();
    case 'ay':
      return AppLocalizationsAy();
    case 'az':
      return AppLocalizationsAz();
    case 'bal':
      return AppLocalizationsBal();
    case 'ban':
      return AppLocalizationsBan();
    case 'bbc':
      return AppLocalizationsBbc();
    case 'bci':
      return AppLocalizationsBci();
    case 'be':
      return AppLocalizationsBe();
    case 'bem':
      return AppLocalizationsBem();
    case 'ber':
      return AppLocalizationsBer();
    case 'bew':
      return AppLocalizationsBew();
    case 'bg':
      return AppLocalizationsBg();
    case 'bho':
      return AppLocalizationsBho();
    case 'bik':
      return AppLocalizationsBik();
    case 'bm':
      return AppLocalizationsBm();
    case 'bn':
      return AppLocalizationsBn();
    case 'bs':
      return AppLocalizationsBs();
    case 'bts':
      return AppLocalizationsBts();
    case 'btx':
      return AppLocalizationsBtx();
    case 'bua':
      return AppLocalizationsBua();
    case 'ca':
      return AppLocalizationsCa();
    case 'ceb':
      return AppLocalizationsCeb();
    case 'cgg':
      return AppLocalizationsCgg();
    case 'chk':
      return AppLocalizationsChk();
    case 'ckb':
      return AppLocalizationsCkb();
    case 'cnh':
      return AppLocalizationsCnh();
    case 'co':
      return AppLocalizationsCo();
    case 'crh':
      return AppLocalizationsCrh();
    case 'crs':
      return AppLocalizationsCrs();
    case 'cs':
      return AppLocalizationsCs();
    case 'cy':
      return AppLocalizationsCy();
    case 'da':
      return AppLocalizationsDa();
    case 'de':
      return AppLocalizationsDe();
    case 'din':
      return AppLocalizationsDin();
    case 'doi':
      return AppLocalizationsDoi();
    case 'dv':
      return AppLocalizationsDv();
    case 'dyu':
      return AppLocalizationsDyu();
    case 'el':
      return AppLocalizationsEl();
    case 'en':
      return AppLocalizationsEn();
    case 'eo':
      return AppLocalizationsEo();
    case 'es':
      return AppLocalizationsEs();
    case 'et':
      return AppLocalizationsEt();
    case 'eu':
      return AppLocalizationsEu();
    case 'fa':
      return AppLocalizationsFa();
    case 'fi':
      return AppLocalizationsFi();
    case 'fil':
      return AppLocalizationsFil();
    case 'fon':
      return AppLocalizationsFon();
    case 'fr':
      return AppLocalizationsFr();
    case 'fur':
      return AppLocalizationsFur();
    case 'fy':
      return AppLocalizationsFy();
    case 'ga':
      return AppLocalizationsGa();
    case 'gaa':
      return AppLocalizationsGaa();
    case 'gd':
      return AppLocalizationsGd();
    case 'gl':
      return AppLocalizationsGl();
    case 'gn':
      return AppLocalizationsGn();
    case 'gom':
      return AppLocalizationsGom();
    case 'gu':
      return AppLocalizationsGu();
    case 'ha':
      return AppLocalizationsHa();
    case 'haw':
      return AppLocalizationsHaw();
    case 'he':
      return AppLocalizationsHe();
    case 'hi':
      return AppLocalizationsHi();
    case 'hil':
      return AppLocalizationsHil();
    case 'hmn':
      return AppLocalizationsHmn();
    case 'hr':
      return AppLocalizationsHr();
    case 'hrx':
      return AppLocalizationsHrx();
    case 'ht':
      return AppLocalizationsHt();
    case 'hu':
      return AppLocalizationsHu();
    case 'hy':
      return AppLocalizationsHy();
    case 'iba':
      return AppLocalizationsIba();
    case 'id':
      return AppLocalizationsId();
    case 'ig':
      return AppLocalizationsIg();
    case 'ilo':
      return AppLocalizationsIlo();
    case 'is':
      return AppLocalizationsIs();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'jam':
      return AppLocalizationsJam();
    case 'jv':
      return AppLocalizationsJv();
    case 'ka':
      return AppLocalizationsKa();
    case 'kac':
      return AppLocalizationsKac();
    case 'kek':
      return AppLocalizationsKek();
    case 'kha':
      return AppLocalizationsKha();
    case 'kk':
      return AppLocalizationsKk();
    case 'km':
      return AppLocalizationsKm();
    case 'kn':
      return AppLocalizationsKn();
    case 'ko':
      return AppLocalizationsKo();
    case 'kri':
      return AppLocalizationsKri();
    case 'ktu':
      return AppLocalizationsKtu();
    case 'ku':
      return AppLocalizationsKu();
    case 'ky':
      return AppLocalizationsKy();
    case 'la':
      return AppLocalizationsLa();
    case 'lb':
      return AppLocalizationsLb();
    case 'lg':
      return AppLocalizationsLg();
    case 'lij':
      return AppLocalizationsLij();
    case 'lmo':
      return AppLocalizationsLmo();
    case 'ln':
      return AppLocalizationsLn();
    case 'lo':
      return AppLocalizationsLo();
    case 'lt':
      return AppLocalizationsLt();
    case 'ltg':
      return AppLocalizationsLtg();
    case 'luo':
      return AppLocalizationsLuo();
    case 'lv':
      return AppLocalizationsLv();
    case 'mai':
      return AppLocalizationsMai();
    case 'mak':
      return AppLocalizationsMak();
    case 'mam':
      return AppLocalizationsMam();
    case 'mfe':
      return AppLocalizationsMfe();
    case 'mg':
      return AppLocalizationsMg();
    case 'mhr':
      return AppLocalizationsMhr();
    case 'mi':
      return AppLocalizationsMi();
    case 'min':
      return AppLocalizationsMin();
    case 'mk':
      return AppLocalizationsMk();
    case 'ml':
      return AppLocalizationsMl();
    case 'mn':
      return AppLocalizationsMn();
    case 'mni':
      return AppLocalizationsMni();
    case 'mr':
      return AppLocalizationsMr();
    case 'ms':
      return AppLocalizationsMs();
    case 'mt':
      return AppLocalizationsMt();
    case 'mwr':
      return AppLocalizationsMwr();
    case 'my':
      return AppLocalizationsMy();
    case 'ne':
      return AppLocalizationsNe();
    case 'new':
      return AppLocalizationsNew();
    case 'nhe':
      return AppLocalizationsNhe();
    case 'nl':
      return AppLocalizationsNl();
    case 'no':
      return AppLocalizationsNo();
    case 'nso':
      return AppLocalizationsNso();
    case 'nus':
      return AppLocalizationsNus();
    case 'ny':
      return AppLocalizationsNy();
    case 'om':
      return AppLocalizationsOm();
    case 'or':
      return AppLocalizationsOr();
    case 'pa':
      return AppLocalizationsPa();
    case 'pag':
      return AppLocalizationsPag();
    case 'pam':
      return AppLocalizationsPam();
    case 'pap':
      return AppLocalizationsPap();
    case 'pl':
      return AppLocalizationsPl();
    case 'ps':
      return AppLocalizationsPs();
    case 'pt':
      return AppLocalizationsPt();
    case 'qu':
      return AppLocalizationsQu();
    case 'ro':
      return AppLocalizationsRo();
    case 'rom':
      return AppLocalizationsRom();
    case 'ru':
      return AppLocalizationsRu();
    case 'rw':
      return AppLocalizationsRw();
    case 'sa':
      return AppLocalizationsSa();
    case 'sah':
      return AppLocalizationsSah();
    case 'sat':
      return AppLocalizationsSat();
    case 'scn':
      return AppLocalizationsScn();
    case 'sd':
      return AppLocalizationsSd();
    case 'shn':
      return AppLocalizationsShn();
    case 'si':
      return AppLocalizationsSi();
    case 'sk':
      return AppLocalizationsSk();
    case 'sl':
      return AppLocalizationsSl();
    case 'sm':
      return AppLocalizationsSm();
    case 'sn':
      return AppLocalizationsSn();
    case 'so':
      return AppLocalizationsSo();
    case 'sq':
      return AppLocalizationsSq();
    case 'sr':
      return AppLocalizationsSr();
    case 'st':
      return AppLocalizationsSt();
    case 'su':
      return AppLocalizationsSu();
    case 'sus':
      return AppLocalizationsSus();
    case 'sv':
      return AppLocalizationsSv();
    case 'sw':
      return AppLocalizationsSw();
    case 'szl':
      return AppLocalizationsSzl();
    case 'ta':
      return AppLocalizationsTa();
    case 'te':
      return AppLocalizationsTe();
    case 'tet':
      return AppLocalizationsTet();
    case 'tg':
      return AppLocalizationsTg();
    case 'th':
      return AppLocalizationsTh();
    case 'ti':
      return AppLocalizationsTi();
    case 'tiv':
      return AppLocalizationsTiv();
    case 'tk':
      return AppLocalizationsTk();
    case 'tl':
      return AppLocalizationsTl();
    case 'tpi':
      return AppLocalizationsTpi();
    case 'tr':
      return AppLocalizationsTr();
    case 'ts':
      return AppLocalizationsTs();
    case 'tt':
      return AppLocalizationsTt();
    case 'tum':
      return AppLocalizationsTum();
    case 'udm':
      return AppLocalizationsUdm();
    case 'ug':
      return AppLocalizationsUg();
    case 'uk':
      return AppLocalizationsUk();
    case 'ur':
      return AppLocalizationsUr();
    case 'uz':
      return AppLocalizationsUz();
    case 'vec':
      return AppLocalizationsVec();
    case 'vi':
      return AppLocalizationsVi();
    case 'war':
      return AppLocalizationsWar();
    case 'xh':
      return AppLocalizationsXh();
    case 'yi':
      return AppLocalizationsYi();
    case 'yo':
      return AppLocalizationsYo();
    case 'yua':
      return AppLocalizationsYua();
    case 'yue':
      return AppLocalizationsYue();
    case 'zap':
      return AppLocalizationsZap();
    case 'zh':
      return AppLocalizationsZh();
    case 'zu':
      return AppLocalizationsZu();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
