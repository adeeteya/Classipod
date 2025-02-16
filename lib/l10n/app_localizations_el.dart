// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get appTitle => 'Ταξινομείο';

  @override
  String get menuButtonText => 'ΜΕΝΟΥ';

  @override
  String get audioAccessPermissionTitle => 'Απαιτείται άδεια πρόσβασης ήχου που απαιτείται';

  @override
  String get audioAccessPermissionContent => 'Παρακαλούμε να παραχωρήσετε πρόσβαση αρχείων ήχου για να μας επιτρέψετε να παίξουμε τα αρχεία μουσικής σας.';

  @override
  String get audioAccessPermissionPermanentlyDeniedTitle => 'Η άδεια πρόσβασης ήχου απορρίφθηκε';

  @override
  String get audioAccessPermissionPermanentlyDeniedContent => 'Παρακαλούμε να παραχωρήσετε πρόσβαση αρχείων ήχου για αυτήν την εφαρμογή στις ρυθμίσεις της συσκευής για να μας επιτρέψετε να παίξουμε τα αρχεία μουσικής σας.';

  @override
  String get menuScreenTitle => 'Μενού';

  @override
  String get musicMenuScreenTitle => 'Μουσική';

  @override
  String get nowPlayingScreenTitle => 'Παίζοντας τώρα';

  @override
  String get shuffleSongsMenuTitle => 'Τραγούδια shuffle';

  @override
  String get shuffleSettingTitle => 'Ανάμιξη';

  @override
  String get settingsScreenTitle => 'Ρυθμίσεις';

  @override
  String get aboutScreenTitle => 'Για';

  @override
  String get coverFlowScreenTitle => 'Ροή καλύμματος';

  @override
  String get artistsScreenTitle => 'Καλλιτέχνες';

  @override
  String get albumsScreenTitle => 'Άλμπουμ';

  @override
  String get songsScreenTitle => 'Τραγούδια';

  @override
  String nSongs(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString τραγούδια',
      one: '1 Τραγούδι',
      zero: 'Χωρίς τραγούδια',
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
      other: '$countString άλμπουμ',
      one: '1 άλμπουμ',
      zero: 'Χωρίς άλμπουμ',
    );
    return '$_temp0';
  }

  @override
  String get genresScreenTitle => 'Είδος';

  @override
  String get genreSongsScreenTitle => 'Τραγούδια του είδους';

  @override
  String get deviceColorSettingTitle => 'Έγχρωμη συσκευή';

  @override
  String get touchScreenSettingTitle => 'Ενεργοποιημένη οθόνη αφής';

  @override
  String get repeatModeSettingTitle => 'Επαναλαμβάνω';

  @override
  String get repeatModeOne => 'Ενας';

  @override
  String get repeatModeAll => 'Ολοι';

  @override
  String get vibrateSettingTitle => 'Δονούμαι';

  @override
  String get clickWheelSettingTitle => 'Κάντε κλικ στην επιλογή Ήχους τροχού';

  @override
  String get splitScreenSettingTitle => 'Λειτουργία διαχωρισμού οθόνης';

  @override
  String get touchSoundsDialogTitle => 'Αγγίξτε τους ήχους';

  @override
  String get touchSoundsDialogContent => 'Ενεργοποιήστε τους ήχους αφής από τις ρυθμίσεις του συστήματος για να ακούσετε τους ήχους τροχού κλικ';

  @override
  String get immersiveModeSettingTitle => 'Βυθιστική λειτουργία';

  @override
  String get showAppTutorialSettingTitle => 'Εκδήλωση σεμινάριο';

  @override
  String get changeDirectorySettingTitle => 'Μεταβαλλόμενος κατάλογος';

  @override
  String get donateSettingTitle => 'Προσφέρω';

  @override
  String get donateSettingDescription => 'Εάν σας αρέσει αυτή η εφαρμογή, σκεφτείτε να δωρίσετε.';

  @override
  String get versionAboutScreenTitle => 'Εκδοχή';

  @override
  String get madeWithLoveTitle => 'Φτιαγμένο με ❤️ από';

  @override
  String get noMusicFilesFound => 'Χωρίς μουσική';

  @override
  String get noArtistsFound => 'Χωρίς καλλιτέχνες';

  @override
  String get noAlbumsFound => 'Χωρίς άλμπουμ';

  @override
  String get unknownSong => 'Άγνωστο τραγούδι';

  @override
  String get unknownArtist => 'Άγνωστος καλλιτέχνης';

  @override
  String get unknownAlbum => 'Άγνωστο άλμπουμ';

  @override
  String get unknownGenre => 'Άγνωστο είδος';

  @override
  String get buttonConfirmText => 'ΕΝΤΑΞΕΙ';

  @override
  String get tileValueOn => 'Επί';

  @override
  String get tileValueOff => 'Μακριά από';

  @override
  String get commonOfText => 'του';

  @override
  String get pageNotFoundText => 'Η δεδομένη σελίδα δεν βρέθηκε';

  @override
  String get commonErrorText => 'Σφάλμα';

  @override
  String get retryButtonText => 'Δοκιμάζω πάλι';

  @override
  String get filePickerDialogTitle => 'Επιλέξτε έναν κατάλογο για σάρωση για μουσική';

  @override
  String get searchScreenTitle => 'Ερευνα';

  @override
  String get searchEmptyText => 'Χωρίς αποτελέσματα αναζήτησης';

  @override
  String get searchResultsText => 'Αποτελέσματα αναζήτησης:';

  @override
  String get resultsForText => 'Αποτελέσματα για:';

  @override
  String get disableBatteryOptimizationTitle => 'Απενεργοποιήστε τη βελτιστοποίηση της μπαταρίας';

  @override
  String get disableBatteryOptimizationContent => 'Απενεργοποιήστε τη βελτιστοποίηση της μπαταρίας για αυτήν την εφαρμογή στις ρυθμίσεις της συσκευής για να επιτρέψετε την αναπαραγωγή φόντου της μουσικής.';

  @override
  String get languageScreenTitle => 'Γλώσσα';

  @override
  String get silverDeviceColor => 'Ασήμι';

  @override
  String get blackDeviceColor => 'Μαύρος';

  @override
  String get resetSettingsTitle => 'Ρυθμίσεις επαναφοράς';

  @override
  String get browseArtist => 'Περιηγηθείτε καλλιτέχνης';

  @override
  String get browseAlbum => 'Αναζήτηση άλμπουμ';

  @override
  String get cancelText => 'Ματαίωση';

  @override
  String get playlistsScreenTitle => 'Λίστες αναπαραγωγής';

  @override
  String get addToOnTheGoPlaylist => 'Προσθήκη στο on-the-go';

  @override
  String get addAlbumToOnTheGoPlaylist => 'Προσθήκη άλμπουμ στο on-the-go';

  @override
  String get removeSongFromThePlaylist => 'Αφαιρέστε από τη λίστα αναπαραγωγής';

  @override
  String get allAlbums => 'Όλα τα άλμπουμ';

  @override
  String get scanningMusicFiles => 'Αρχεία μουσικής σάρωσης';

  @override
  String get newPlaylist => 'Νέα λίστα αναπαραγωγής';

  @override
  String get savePlaylist => 'Αποθήκευση λίστα αναπαραγωγής';

  @override
  String get clearPlaylist => 'Καθαρή λίστα αναπαραγωγής';

  @override
  String get rescanMusicFilesSettingTitle => 'Αρχεία μουσικής rescan';

  @override
  String get deviceControlMenuTutorialText => 'Μετακινήστε τον αντίχειρά σας ελαφρώς γύρω από τον τροχό κλικ για να περιηγηθείτε στο μενού';

  @override
  String get centerButtonMenuTutorialText => 'Πατήστε το κουμπί ΚΕΝΤΡΟ για να επιλέξετε το επισημασμένο στοιχείο μενού';

  @override
  String get playPauseMenuTutorialText => 'Πατήστε αυτό το κουμπί για να αναπαράγετε ή να σταματήσετε ένα τραγούδι';

  @override
  String get nextButtonMenuTutorialText => 'Πατήστε αυτό το κουμπί για να παραλείψετε στο επόμενο τραγούδι';

  @override
  String get previousButtonMenuTutorialText => 'Πατήστε αυτό το κουμπί για να επιστρέψετε ή να επιστρέψετε στο προηγούμενο τραγούδι';

  @override
  String get menuButtonTutorialText => 'Πατήστε αυτό το κουμπί για να επιστρέψετε στο προηγούμενο μενού. Θα μπορούσατε να πατήσετε και να το κρατήσετε από οποιαδήποτε άλλη οθόνη για να μεταβείτε απευθείας στο κύριο μενού.';

  @override
  String get deviceScreenMenuTutorialText => 'Αυτή είναι η οθόνη. Η οθόνη αφής και η λειτουργία διαχωρισμού οθόνης είναι ενεργοποιημένες από προεπιλογή και μπορούν να ρυθμιστούν περαιτέρω στις ρυθμίσεις.';

  @override
  String get deviceControlNowPlayingTutorialText => 'Μετακινήστε τον αντίχειρά σας γύρω από τον τροχό κλικ για να ρυθμίσετε την ένταση';

  @override
  String get centerButtonNowPlayingTutorialText => 'Πατήστε το κεντρικό κουμπί για να κάνετε ποδηλασία μέσα από το Seek Bar, το Scrubber Bar και το Slider Shuffle. Πατήστε και κρατήστε πατημένο το κεντρικό κουμπί για να αποκτήσετε πρόσβαση σε πρόσθετες επιλογές.';

  @override
  String get nextButtonNowPlayingTutorialText => 'Πατήστε και κρατήστε πατημένο αυτό το κουμπί για να προωθήσετε γρήγορα το τραγούδι';

  @override
  String get previousButtonNowPlayingTutorialText => 'Πατήστε και κρατήστε πατημένο αυτό το κουμπί για να επιστρέψετε το τραγούδι';

  @override
  String get deviceControlSearchTutorialText => 'Μετακινήστε τον αντίχειρά σας ελαφρώς γύρω από τον τροχό κλικ για να επισημάνετε ένα αλφάβητο';

  @override
  String get centerButtonSearchTutorialText => 'Πατήστε το κουμπί ΚΕΝΤΡΟ για να επιλέξετε το επισημασμένο αλφάβητο';

  @override
  String get nextButtonSearchTutorialText => 'Πατήστε αυτό το κουμπί για να προσθέσετε ένα χώρο';

  @override
  String get previousButtonSearchTutorialText => 'Πατήστε αυτό το κουμπί για να διαγράψετε τον τελευταίο χαρακτήρα';

  @override
  String get menuButtonSearchTutorialText => 'Πατήστε αυτό το κουμπί για να κλείσετε το πληκτρολόγιο και να αλληλεπιδράσετε με τα αποτελέσματα αναζήτησης';
}
