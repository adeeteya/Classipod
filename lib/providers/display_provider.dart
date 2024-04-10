import 'dart:async';
import 'package:classipod/models/display_details.dart';
import 'package:classipod/providers/music_provider.dart';
import 'package:classipod/providers/settings_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vibration/vibration.dart';

class DisplayNotifier extends Notifier<DisplayDetails> {
  DisplayNotifier() : super();
  final List<String> musicListDisplayItems = [
    "Cover Flow",
    "Artists",
    "Albums",
    "Songs",
  ];
  DisplayScreenType previousDisplayScreenType = DisplayScreenType.menu;
  int previousSelectedDisplayListItem = 0;
  double previousScrollOffset = 0;
  String selectedArtistName = "";
  int previousCoverFlowPage = 0;
  Duration durationSinceLastScroll = Duration.zero;
  late Timer _longPressTimer;

  @override
  DisplayDetails build() {
    return const DisplayDetails(
      scrollOffset: 0,
      selectedDisplayListItem: 0,
      displayScreenType: DisplayScreenType.menu,
    );
  }

  void restartApp(BuildContext context) {
    ref.read(musicProvider.notifier).setLoading(true);
    ref.read(musicProvider.notifier).getAllAudioFiles();
    navigateToScreen(context, displayScreenType: DisplayScreenType.menu);
  }

  void buttonPressVibrate() {
    if (ref.read(settingsProvider).vibrate) {
      Vibration.vibrate(duration: 2);
    }
  }

  Future<void> clickWheelSound() async {
    if (ref.read(settingsProvider).clickWheelSound) {
      await SystemSound.play(SystemSoundType.click);
    }
  }

  void scrollScreenDown(double screenHeight, double scrollValue) async {
    state = state.copyWith(
        selectedDisplayListItem: state.selectedDisplayListItem + 1);
    if (((state.selectedDisplayListItem + 2) * scrollValue) >
        screenHeight * 0.3865) {
      state = state.copyWith(scrollOffset: state.scrollOffset + scrollValue);
    }
  }

  void scrollScreenUp(double scrollValue) {
    if (state.selectedDisplayListItem != 0) {
      state = state.copyWith(
          selectedDisplayListItem: state.selectedDisplayListItem - 1);
    }
    if (((state.selectedDisplayListItem) * scrollValue) < state.scrollOffset) {
      state = state.copyWith(scrollOffset: state.scrollOffset - scrollValue);
    }
  }

  void onClickWheelScroll(
      DragUpdateDetails dragUpdateDetails, double radius, double height) {
    /// Pan location on the wheel
    bool onTop = dragUpdateDetails.localPosition.dy <= radius;
    bool onLeftSide = dragUpdateDetails.localPosition.dx <= radius;
    bool onRightSide = !onLeftSide;
    bool onBottom = !onTop;

    /// Pan movements
    bool panUp = dragUpdateDetails.delta.dy <= 0.0;
    bool panLeft = dragUpdateDetails.delta.dx <= 0.0;
    bool panRight = !panLeft;
    bool panDown = !panUp;

    /// Absolute change on axis
    double yChange = dragUpdateDetails.delta.dy.abs();
    double xChange = dragUpdateDetails.delta.dx.abs();

    /// Directional change on wheel
    double verticalRotation = (onRightSide && panDown) || (onLeftSide && panUp)
        ? yChange
        : yChange * -1;

    double horizontalRotation =
        (onTop && panRight) || (onBottom && panLeft) ? xChange : xChange * -1;

    // Total computed change
    double rotationalChange = (verticalRotation + horizontalRotation) *
        (dragUpdateDetails.delta.distance * 0.8);

    int millisecondsSinceLastScroll = 0;
    if (durationSinceLastScroll.inMinutes ==
            dragUpdateDetails.sourceTimeStamp?.inMinutes &&
        durationSinceLastScroll.inSeconds ==
            dragUpdateDetails.sourceTimeStamp?.inSeconds) {
      millisecondsSinceLastScroll =
          dragUpdateDetails.sourceTimeStamp!.inMilliseconds -
              durationSinceLastScroll.inMilliseconds;
    } else {
      durationSinceLastScroll =
          dragUpdateDetails.sourceTimeStamp ?? Duration.zero;
    }

    if (rotationalChange > 4 && millisecondsSinceLastScroll > 75) {
      if (state.displayScreenType == DisplayScreenType.nowPlaying) {
        ref.read(musicProvider.notifier).increaseVolume();
      } else {
        seekForwardButton(height);
      }
      durationSinceLastScroll = Duration.zero;
    } else if (rotationalChange < -4 && millisecondsSinceLastScroll > 75) {
      if (state.displayScreenType == DisplayScreenType.nowPlaying) {
        ref.read(musicProvider.notifier).decreaseVolume();
      } else {
        seekBackButton();
      }
      durationSinceLastScroll = Duration.zero;
    }
  }

  void navigateToScreen(BuildContext context,
      {required DisplayScreenType displayScreenType}) {
    previousDisplayScreenType = state.displayScreenType;
    previousSelectedDisplayListItem = state.selectedDisplayListItem;
    previousScrollOffset = state.scrollOffset;

    switch (displayScreenType) {
      case DisplayScreenType.menu:
        state = state.copyWith(
          scrollOffset: 0,
          selectedDisplayListItem: 0,
          displayScreenType: DisplayScreenType.menu,
        );
        context.go("/menu");
        break;
      case DisplayScreenType.musicMenu:
        state = state.copyWith(
          scrollOffset: 0,
          selectedDisplayListItem: 0,
          displayScreenType: DisplayScreenType.musicMenu,
        );
        context.go("/menu/music");
        break;
      case DisplayScreenType.coverFlow:
        state = state.copyWith(displayScreenType: DisplayScreenType.coverFlow);
        context.go("/menu/music/cover-flow");
        break;
      case DisplayScreenType.artistsSelection:
        state = state.copyWith(
          scrollOffset: 0,
          selectedDisplayListItem: 0,
          displayScreenType: DisplayScreenType.artistsSelection,
        );
        context.go("/menu/music/artists");
        break;
      case DisplayScreenType.artistSongs:
        state = state.copyWith(
          scrollOffset: 0,
          selectedDisplayListItem: 0,
          displayScreenType: DisplayScreenType.artistSongs,
        );
        context.go("/menu/music/artists/$selectedArtistName");
        break;
      case DisplayScreenType.coverFlowAlbumSelection:
        state = state.copyWith(
          scrollOffset: 0,
          selectedDisplayListItem: 0,
          displayScreenType: DisplayScreenType.coverFlowAlbumSelection,
        );
        break;
      case DisplayScreenType.albums:
        state = state.copyWith(
          scrollOffset: 0,
          selectedDisplayListItem: 0,
          displayScreenType: DisplayScreenType.albums,
        );
        context.go("/menu/music/albums");
        break;
      case DisplayScreenType.songs:
        state = state.copyWith(
          scrollOffset: 0,
          selectedDisplayListItem: 0,
          displayScreenType: DisplayScreenType.songs,
        );
        context.go("/menu/music/songs");
        break;
      case DisplayScreenType.settings:
        state = state.copyWith(
          scrollOffset: 0,
          selectedDisplayListItem: 1,
          displayScreenType: DisplayScreenType.settings,
        );
        context.go("/menu/settings");
        break;
      case DisplayScreenType.nowPlaying:
        state = state.copyWith(
          scrollOffset: 0,
          selectedDisplayListItem: 0,
          displayScreenType: DisplayScreenType.nowPlaying,
        );
        context.go("/menu/now-playing");
        break;
      case DisplayScreenType.about:
        state = state.copyWith(
          scrollOffset: 0,
          selectedDisplayListItem: 0,
          displayScreenType: DisplayScreenType.about,
        );
        context.go("/menu/settings/about");
        break;
    }
  }

  void menuButton(BuildContext context) {
    buttonPressVibrate();
    clickWheelSound();
    switch (state.displayScreenType) {
      case DisplayScreenType.menu:
        return;
      case DisplayScreenType.musicMenu:
        state = state.copyWith(
          scrollOffset: 0,
          selectedDisplayListItem: 0,
          displayScreenType: DisplayScreenType.menu,
        );
        context.go("/menu");
        break;
      case DisplayScreenType.nowPlaying:
        //If Previous Screen was the Songs Screen
        if (previousDisplayScreenType == DisplayScreenType.songs) {
          state = state.copyWith(
            scrollOffset: previousScrollOffset,
            selectedDisplayListItem: previousSelectedDisplayListItem,
            displayScreenType: DisplayScreenType.songs,
          );
          context.go("/menu/music/songs");
        }
        //If Previous Screen was the Albums Screen
        else if (previousDisplayScreenType == DisplayScreenType.albums) {
          state = state.copyWith(
            scrollOffset: previousScrollOffset,
            selectedDisplayListItem: previousSelectedDisplayListItem,
            displayScreenType: DisplayScreenType.albums,
          );
          context.go("/menu/music/albums");
        }
        //If Previous Screen was the Artists Songs Screen
        else if (previousDisplayScreenType == DisplayScreenType.artistSongs) {
          state = state.copyWith(
            scrollOffset: previousScrollOffset,
            selectedDisplayListItem: previousSelectedDisplayListItem,
            displayScreenType: DisplayScreenType.artistSongs,
          );
          context.go("/menu/music/artists/$selectedArtistName");
        }
        //If Previous Screen was the Cover Flow Album Selection  Screen
        else if (previousDisplayScreenType ==
            DisplayScreenType.coverFlowAlbumSelection) {
          context.go("/menu/music/cover-flow");
          Future.delayed(const Duration(milliseconds: 50), () {
            state = state.copyWith(
              scrollOffset: 0,
              selectedDisplayListItem: previousCoverFlowPage,
              displayScreenType: DisplayScreenType.coverFlow,
            );
          });
        }
        //If Previous Screen was the Any Other Screen (Mostly Menu)
        else {
          state = state.copyWith(
            scrollOffset: 0,
            selectedDisplayListItem: 1,
            displayScreenType: DisplayScreenType.menu,
          );
          context.go("/menu");
        }
        break;
      case DisplayScreenType.settings:
        state = state.copyWith(
          scrollOffset: 0,
          selectedDisplayListItem: 3,
          displayScreenType: DisplayScreenType.menu,
        );
        context.go("/menu");
        break;
      case DisplayScreenType.coverFlow:
        state = state.copyWith(
          scrollOffset: 0,
          selectedDisplayListItem: 0,
          displayScreenType: DisplayScreenType.musicMenu,
        );
        context.go("/menu/music");
        break;
      case DisplayScreenType.artistsSelection:
        state = state.copyWith(
          scrollOffset: 0,
          selectedDisplayListItem: 1,
          displayScreenType: DisplayScreenType.musicMenu,
        );
        context.go("/menu/music");
        break;
      case DisplayScreenType.albums:
        state = state.copyWith(
          scrollOffset: 0,
          selectedDisplayListItem: 2,
          displayScreenType: DisplayScreenType.musicMenu,
        );
        context.go("/menu/music");
        break;
      case DisplayScreenType.songs:
        state = state.copyWith(
          scrollOffset: 0,
          selectedDisplayListItem: 3,
          displayScreenType: DisplayScreenType.musicMenu,
        );
        context.go("/menu/music");
        break;
      case DisplayScreenType.artistSongs:
        previousSelectedDisplayListItem = ref
            .read(musicProvider.notifier)
            .artistNames
            .toList()
            .indexOf(selectedArtistName);
        previousScrollOffset = previousSelectedDisplayListItem * 30;
        if (previousSelectedDisplayListItem == -1) {
          previousSelectedDisplayListItem = 0;
          previousScrollOffset = 0;
        }
        context.go("/menu/music/artists");
        state = state.copyWith(
          scrollOffset: previousScrollOffset,
          selectedDisplayListItem: previousSelectedDisplayListItem,
          displayScreenType: DisplayScreenType.artistsSelection,
        );
        break;
      case DisplayScreenType.coverFlowAlbumSelection:
        context.go("/menu/music/cover-flow");
        state = state.copyWith(
          scrollOffset: previousScrollOffset,
          selectedDisplayListItem: previousSelectedDisplayListItem,
          displayScreenType: DisplayScreenType.coverFlow,
        );
        break;
      case DisplayScreenType.about:
        context.go("/menu/settings");
        state = state.copyWith(
          scrollOffset: 0,
          selectedDisplayListItem: previousSelectedDisplayListItem,
          displayScreenType: DisplayScreenType.settings,
        );
        break;
    }
  }

  void selectButton(BuildContext context) {
    buttonPressVibrate();
    clickWheelSound();

    //If the display is in Menu screen
    if (state.displayScreenType == DisplayScreenType.menu) {
      //Music Button Clicked
      if (state.selectedDisplayListItem == 0) {
        navigateToScreen(context,
            displayScreenType: DisplayScreenType.musicMenu);
      }
      //Now Playing Button Clicked
      else if (state.selectedDisplayListItem == 1) {
        navigateToScreen(context,
            displayScreenType: DisplayScreenType.nowPlaying);
      }
      //Shuffle Songs Button Clicked
      else if (state.selectedDisplayListItem == 2) {
        ref.read(musicProvider.notifier).shuffleAllSongs();
      }
      //Settings Button Clicked
      else if (state.selectedDisplayListItem == 3) {
        navigateToScreen(context,
            displayScreenType: DisplayScreenType.settings);
      }
    }

    //If the display is in Music Menu screen
    else if (state.displayScreenType == DisplayScreenType.musicMenu) {
      //If the Cover Flow Button is Clicked
      if (state.selectedDisplayListItem == 0) {
        navigateToScreen(context,
            displayScreenType: DisplayScreenType.coverFlow);
      }
      //If the Artists Button is Clicked
      else if (state.selectedDisplayListItem == 1) {
        navigateToScreen(context,
            displayScreenType: DisplayScreenType.artistsSelection);
      }
      //If the Albums Button is Clicked
      else if (state.selectedDisplayListItem == 2) {
        navigateToScreen(context, displayScreenType: DisplayScreenType.albums);
      }
      //If the Songs Button is Clicked
      else if (state.selectedDisplayListItem == 3) {
        navigateToScreen(context, displayScreenType: DisplayScreenType.songs);
      }
    }

    //If the display is in Artists Selection screen
    else if (state.displayScreenType == DisplayScreenType.artistsSelection) {
      selectedArtistName = ref
          .read(musicProvider.notifier)
          .artistNames
          .elementAt(state.selectedDisplayListItem);
      navigateToScreen(
        context,
        displayScreenType: DisplayScreenType.artistSongs,
      );
    }

    //If the display is in Artist Songs Screen
    else if (state.displayScreenType == DisplayScreenType.artistSongs) {
      ref.read(musicProvider.notifier).playAtIndex(ref
          .read(musicProvider.notifier)
          .artistSongsIndexes[state.selectedDisplayListItem]);
      navigateToScreen(context,
          displayScreenType: DisplayScreenType.nowPlaying);
    }

    //If the display is in Albums Screen
    else if (state.displayScreenType == DisplayScreenType.albums) {
      ref.read(musicProvider.notifier).playAlbum(ref
          .read(musicProvider.notifier)
          .albumNames
          .elementAt(state.selectedDisplayListItem));
      navigateToScreen(context,
          displayScreenType: DisplayScreenType.nowPlaying);
    }

    //If the display is in Songs Screen
    else if (state.displayScreenType == DisplayScreenType.songs) {
      ref
          .read(musicProvider.notifier)
          .playAtIndex(state.selectedDisplayListItem);
      navigateToScreen(context,
          displayScreenType: DisplayScreenType.nowPlaying);
    }

    //If the display is in Now Playing Screen
    else if (state.displayScreenType == DisplayScreenType.nowPlaying) {
      ref.read(musicProvider.notifier).togglePlayback();
    }

    //If the display is in Cover Flow Screen
    else if (state.displayScreenType == DisplayScreenType.coverFlow) {
      previousCoverFlowPage = state.selectedDisplayListItem;
      ref.read(musicProvider.notifier).getCoverFlowAlbumDetails(ref
          .read(musicProvider.notifier)
          .albumNames
          .elementAt(state.selectedDisplayListItem));
      navigateToScreen(context,
          displayScreenType: DisplayScreenType.coverFlowAlbumSelection);
    }

    //If the display is in Cover Flow Song Selection Screen
    else if (state.displayScreenType ==
        DisplayScreenType.coverFlowAlbumSelection) {
      ref.read(musicProvider.notifier).playAtIndex(ref
          .read(musicProvider.notifier)
          .coverFlowAlbumDetails
          .elementAt(state.selectedDisplayListItem)
          .songIndex);
      navigateToScreen(context,
          displayScreenType: DisplayScreenType.nowPlaying);
    }

    //If the display is in Settings Screen
    else if (state.displayScreenType == DisplayScreenType.settings) {
      //If the About Button is Clicked
      if (state.selectedDisplayListItem == 0) {
        navigateToScreen(context, displayScreenType: DisplayScreenType.about);
      }
      //If the Dark Mode Toggle Button is Clicked
      else if (state.selectedDisplayListItem == 1) {
        ref.read(settingsProvider.notifier).toggleTheme();
      }
      //If the Repeat Toggle Button is Clicked
      else if (state.selectedDisplayListItem == 2) {
        ref.read(settingsProvider.notifier).toggleRepeat();
      }
      //If the Vibrate Toggle Button is Clicked
      else if (state.selectedDisplayListItem == 3) {
        ref.read(settingsProvider.notifier).toggleVibrate();
      }
      //If the Click Wheel Sound Toggle Button is Clicked
      else if (state.selectedDisplayListItem == 4) {
        ref.read(settingsProvider.notifier).toggleClickWheelSound(context);
      }
      //If the Immersive Mode Toggle Button is Clicked
      else if (state.selectedDisplayListItem == 5) {
        ref.read(settingsProvider.notifier).toggleImmersiveMode();
      }
      //If the Change Directory Button is Clicked
      else if (state.selectedDisplayListItem == 6) {
        ref.read(settingsProvider.notifier).getMusicFolderPath(context);
      }
      //If the Donate Button is Clicked
      else if (state.selectedDisplayListItem == 7) {
        launchUrl(Uri.parse("https://www.paypal.me/adeeteya"),
            mode: LaunchMode.externalApplication);
      }
    }
  }

  Future<void> seekForwardButton(double screenHeight) async {
    buttonPressVibrate();
    clickWheelSound();
    //If Forward Seek Button is Clicked in the Music Menu Screen
    if (state.displayScreenType == DisplayScreenType.musicMenu) {
      if (state.selectedDisplayListItem != musicListDisplayItems.length - 1) {
        scrollScreenDown(screenHeight, 30);
      }
    }

    //If Forward Seek Button is Clicked in Artist Selection Screen
    else if (state.displayScreenType == DisplayScreenType.artistsSelection) {
      if (state.selectedDisplayListItem !=
          ref.read(musicProvider.notifier).artistNames.length - 1) {
        scrollScreenDown(screenHeight, 30);
      }
    }

    //If Forward Seek Button is Clicked in Artist Songs Screen
    else if (state.displayScreenType == DisplayScreenType.artistSongs) {
      if (state.selectedDisplayListItem !=
          ref.read(musicProvider.notifier).artistSongsIndexes.length - 1) {
        scrollScreenDown(screenHeight, 50);
      }
    }

    //If Forward Seek Button is Clicked in Albums Screen
    else if (state.displayScreenType == DisplayScreenType.albums) {
      if (state.selectedDisplayListItem !=
          ref.read(musicProvider.notifier).albumNames.length - 1) {
        scrollScreenDown(screenHeight, 50);
      }
    }

    //If Forward Seek Button is Clicked in Songs Screen
    else if (state.displayScreenType == DisplayScreenType.songs) {
      if (state.selectedDisplayListItem !=
          ref
                  .read(musicProvider.notifier)
                  .completeMusicFileMetaDataList
                  .length -
              1) {
        scrollScreenDown(screenHeight, 40);
      }
    }

    //If Forward Seek Button is Clicked in Now Playing Screen
    else if (state.displayScreenType == DisplayScreenType.nowPlaying) {
      await ref.read(musicProvider.notifier).nextSong();
    }

    //If Forward Seek Button is Clicked in Cover Flow Screen
    else if (state.displayScreenType == DisplayScreenType.coverFlow) {
      if (state.selectedDisplayListItem !=
          ref.read(musicProvider.notifier).albumNames.length - 1) {
        state = state.copyWith(
            selectedDisplayListItem: state.selectedDisplayListItem + 1);
      }
    }

    //If Forward Seek Button is Clicked in Cover Flow Album Screen
    else if (state.displayScreenType ==
        DisplayScreenType.coverFlowAlbumSelection) {
      if (state.selectedDisplayListItem !=
          ref.read(musicProvider.notifier).coverFlowAlbumDetails.length - 1) {
        scrollScreenDown(screenHeight, 30);
      }
    }

    //If Forward Seek Button is Clicked in the Menu Screen
    else if (state.displayScreenType == DisplayScreenType.menu &&
        state.selectedDisplayListItem != 3) {
      state = state.copyWith(
          selectedDisplayListItem: state.selectedDisplayListItem + 1);
    }

    //If Forward Seek Button is Clicked in the Settings Screen
    else if (state.displayScreenType == DisplayScreenType.settings &&
        state.selectedDisplayListItem !=
            ref.read(settingsProvider.notifier).settingsListTiles.length - 1) {
      state = state.copyWith(
          selectedDisplayListItem: state.selectedDisplayListItem + 1);
    }
  }

  Future<void> seekBackButton() async {
    buttonPressVibrate();
    clickWheelSound();
    //When Clicked on the Now Playing Screen
    if (state.displayScreenType == DisplayScreenType.nowPlaying) {
      await ref.read(musicProvider.notifier).previousSong();
      return;
    }

    //If Backward Seek Button is Clicked in Cover Flow Screen
    else if (state.displayScreenType == DisplayScreenType.coverFlow) {
      if (state.selectedDisplayListItem != 0) {
        state = state.copyWith(
            selectedDisplayListItem: state.selectedDisplayListItem - 1);
      }
    }

    //If Backward Seek Button is Clicked in Cover Flow Album Selection Screen
    else if (state.displayScreenType ==
        DisplayScreenType.coverFlowAlbumSelection) {
      scrollScreenUp(30);
    }

    //When Clicked In Songs Screen
    else if (state.displayScreenType == DisplayScreenType.songs) {
      scrollScreenUp(40);
    }
    //When Clicked In Artist Songs or Albums Screen
    else if (state.displayScreenType == DisplayScreenType.artistSongs ||
        state.displayScreenType == DisplayScreenType.albums) {
      scrollScreenUp(50);
    }

    //When Clicked In Any Other Screen
    else {
      scrollScreenUp(30);
    }
  }

  void seekBackButtonLongPress() {
    //When Clicked In Now Playing or Cover Flow Screen
    if (state.displayScreenType == DisplayScreenType.nowPlaying) {
      buttonPressVibrate();
      clickWheelSound();
      _longPressTimer = Timer.periodic(const Duration(milliseconds: 50), (_) {
        ref.read(musicProvider.notifier).seekBackward();
      });
      return;
    }
  }

  void seekForwardButtonLongPress() {
    //When Clicked In Now Playing or Cover Flow Screen
    if (state.displayScreenType == DisplayScreenType.nowPlaying) {
      buttonPressVibrate();
      clickWheelSound();
      _longPressTimer = Timer.periodic(const Duration(milliseconds: 50), (_) {
        ref.read(musicProvider.notifier).seekForward();
      });
      return;
    }
  }

  void longPressEnd(LongPressEndDetails _) {
    if (state.displayScreenType == DisplayScreenType.nowPlaying &&
        _longPressTimer.isActive) {
      _longPressTimer.cancel();
    }
  }
}

final displayProvider =
    NotifierProvider<DisplayNotifier, DisplayDetails>(() => DisplayNotifier());
