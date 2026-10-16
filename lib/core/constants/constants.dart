class Constants {
  Constants._();

  // Hive Box Constants
  static const String libraryBoxName = 'library_v1';
  static const String legacyMetadataBoxName = "metadata_box";
  static const String playlistBoxName = "playlist_box";
  static const String excludedDirectoriesBoxName = "excluded_directories_box";

  static const String defaultLanguageLocaleCode = "en";
  static const String androidDefaultMusicFolderPath =
      "/storage/emulated/0/Music";
  static const String defaultNotificationAlbumArtImageUrl =
      "'https://files.radio.co/humorous-skink/staging/default-artwork.png'";

  //If you are seeing this please consider donating to the below link😉
  static const String donationLinkUrl = "https://buymeacoffee.com/adeeteya";

  // Click Wheel Sensitivity Constants (degrees of rotation per scroll step)
  static const double clickWheelVeryLowSensitivityThreshold = 90;
  static const double clickWheelLowSensitivityThreshold = 60;
  static const double clickWheelMediumSensitivityThreshold = 45;
  static const double clickWheelMediumHighSensitivityThreshold = 36;
  static const double clickWheelHighSensitivityThreshold = 22.5;

  // Click Wheel Acceleration Constants
  static const double clickWheelAccelerationMinVelocityDegreesPerSecond = 90;
  static const double clickWheelMaxAngularVelocityDegreesPerSecond = 1080;
  static const double clickWheelAccelerationFactor = 4;
  static const int clickWheelMaxStepsPerPointerEvent = 8;

  static const double screenHeight = 300;
  static const double deviceClickWheelSmallRadiusRatio = 0.45;
  static const double deviceClickWheelMediumRadiusRatio = 0.61;
  static const double deviceClickWheelLargeRadiusRatio = 0.80;
  static const double deviceSelectButtonSmallRadiusRatio = 0.1500;
  static const double deviceSelectButtonMediumRadiusRatio = 0.2175;
  static const double deviceSelectButtonLargeRadiusRatio = 0.3000;

  static const double inputTextAlphabetContainerWidth = 180;
  static const double inputTextAlphabetSize = 15;
}
