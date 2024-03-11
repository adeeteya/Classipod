import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:retropod/models/display_details.dart';
import 'package:retropod/providers/music_provider.dart';
import 'package:retropod/providers/settings_provider.dart';
import 'package:vibration/vibration.dart';

class DisplayNotifier extends Notifier<DisplayDetails> {
  DisplayNotifier() : super();
  final List<String> musicListDisplayItems = [
    "Cover Flow",
    "Artists",
    "Albums",
    "Songs",
  ];
  int previousSelectedDisplayListItem = 0;
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
    state = state.copyWith(
      selectedDisplayListItem: 0,
      displayScreenType: DisplayScreenType.menu,
    );
    context.go("/menu");
  }

  void buttonPressVibrate() {
    if (ref.read(settingsProvider).vibrate) {
      Vibration.vibrate(duration: 3);
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
        (dragUpdateDetails.delta.distance * 0.1);

    if (rotationalChange > 8) {
      if (state.displayScreenType == DisplayScreenType.nowPlaying) {
        ref.read(musicProvider.notifier).seekForward();
      } else {
        seekForwardButton(height);
      }
    } else if (rotationalChange < -8) {
      if (state.displayScreenType == DisplayScreenType.nowPlaying) {
        ref.read(musicProvider.notifier).seekBackward();
      } else {
        seekBackButton();
      }
    }
  }

  void menuButton(BuildContext context) {
    buttonPressVibrate();
    //If Menu Button Clicked on the Cover Flow or Albums or Songs Screen
    if (state.displayScreenType == DisplayScreenType.coverFlow ||
        state.displayScreenType == DisplayScreenType.albums ||
        state.displayScreenType == DisplayScreenType.artistsSelection ||
        state.displayScreenType == DisplayScreenType.songs) {
      state = state.copyWith(
        selectedDisplayListItem: previousSelectedDisplayListItem,
        displayScreenType: DisplayScreenType.musicMenu,
      );
      context.go("/menu/music");
    }
    //If Menu Button Clicked on the Artist Songs Screen
    else if (state.displayScreenType == DisplayScreenType.artistSongs) {
      context.go("/menu/music/artists");
      state = state.copyWith(
        selectedDisplayListItem: 0,
        displayScreenType: DisplayScreenType.artistsSelection,
      );
    }
    //If Menu Button Clicked on Any Other Screen
    else {
      if (previousSelectedDisplayListItem > 3) {
        previousSelectedDisplayListItem = 0;
      }
      state = state.copyWith(
        selectedDisplayListItem: previousSelectedDisplayListItem,
        displayScreenType: DisplayScreenType.menu,
      );
      previousSelectedDisplayListItem = 0;
      context.go("/menu");
    }
  }

  void selectButton(BuildContext context) {
    buttonPressVibrate();
    //if the display is in Menu screen
    if (state.displayScreenType == DisplayScreenType.menu) {
      if (state.selectedDisplayListItem == 0) {
        previousSelectedDisplayListItem = 0;
        state = state.copyWith(displayScreenType: DisplayScreenType.musicMenu);
        context.go("/menu/music");
      } else if (state.selectedDisplayListItem == 1) {
        //Now Playing Button Clicked
        previousSelectedDisplayListItem = 1;
        state = state.copyWith(displayScreenType: DisplayScreenType.nowPlaying);
        context.go("/menu/now-playing");
      } else if (state.selectedDisplayListItem == 2) {
        //Shuffle Songs Button Clicked
        ref.read(musicProvider.notifier).shuffleAllSongs();
      } else if (state.selectedDisplayListItem == 3) {
        //Settings Button Clicked
        previousSelectedDisplayListItem = 3;
        state = state.copyWith(
          selectedDisplayListItem: 0,
          displayScreenType: DisplayScreenType.settings,
        );
        context.go("/menu/settings");
      }
    }

    //if the display is in Music Menu screen
    else if (state.displayScreenType == DisplayScreenType.musicMenu) {
      if (state.selectedDisplayListItem == 0) {
        previousSelectedDisplayListItem = 0;
        state = state.copyWith(displayScreenType: DisplayScreenType.coverFlow);
        context.go("/menu/music/cover-flow/");
      } else if (state.selectedDisplayListItem == 1) {
        previousSelectedDisplayListItem = 1;
        state = state.copyWith(
            selectedDisplayListItem: 0,
            displayScreenType: DisplayScreenType.artistsSelection);
        context.go("/menu/music/artists/");
      } else if (state.selectedDisplayListItem == 2) {
        previousSelectedDisplayListItem = 2;
        state = state.copyWith(
            selectedDisplayListItem: 0,
            displayScreenType: DisplayScreenType.albums);
        context.go("/menu/music/albums/");
      } else if (state.selectedDisplayListItem == 3) {
        previousSelectedDisplayListItem = 3;
        state = state.copyWith(
          selectedDisplayListItem: 0,
          displayScreenType: DisplayScreenType.songs,
        );
        context.go("/menu/music/songs/");
      }
    }

    //if the display is in Artists Selection screen
    else if (state.displayScreenType == DisplayScreenType.artistsSelection) {
      context.go(
          "/menu/music/artists/${ref.read(musicProvider.notifier).artistNames.elementAt(state.selectedDisplayListItem)}");
      state = state.copyWith(
          selectedDisplayListItem: 0,
          displayScreenType: DisplayScreenType.artistSongs);
    }

    //if the display is in Artist Songs Screen
    else if (state.displayScreenType == DisplayScreenType.artistSongs) {
      ref.read(musicProvider.notifier).playAtIndex(ref
          .read(musicProvider.notifier)
          .artistSongsIndexes[state.selectedDisplayListItem]);
      previousSelectedDisplayListItem = 1;
      state = state.copyWith(displayScreenType: DisplayScreenType.nowPlaying);
      context.go("/menu/now-playing");
    }

    //if the display is in Albums Screen
    else if (state.displayScreenType == DisplayScreenType.albums) {
      ref.read(musicProvider.notifier).playAlbum(ref
          .read(musicProvider.notifier)
          .albumNames
          .elementAt(state.selectedDisplayListItem));
      previousSelectedDisplayListItem = 1;
      state = state.copyWith(displayScreenType: DisplayScreenType.nowPlaying);
      context.go("/menu/now-playing");
    }

    //if the display is in Songs Screen
    else if (state.displayScreenType == DisplayScreenType.songs) {
      ref
          .read(musicProvider.notifier)
          .playAtIndex(state.selectedDisplayListItem);
      previousSelectedDisplayListItem = 1;
      state = state.copyWith(displayScreenType: DisplayScreenType.nowPlaying);
      context.go("/menu/now-playing");
    }

    //if the display is in Now Playing or the Cover Flow Screen
    else if (state.displayScreenType == DisplayScreenType.nowPlaying ||
        state.displayScreenType == DisplayScreenType.coverFlow) {
      ref.read(musicProvider.notifier).togglePlayback();
    }

    //if the display is in Settings Screen
    else if (state.displayScreenType == DisplayScreenType.settings) {
      if (state.selectedDisplayListItem == 0) {
        //Dark Mode Toggle Button Clicked
        ref.read(settingsProvider.notifier).toggleTheme();
      } else if (state.selectedDisplayListItem == 1) {
        //Repeat Toggle Button Clicked
        ref.read(settingsProvider.notifier).toggleRepeat();
      } else if (state.selectedDisplayListItem == 2) {
        //Repeat Toggle Button Clicked
        ref.read(settingsProvider.notifier).toggleVibrate();
      } else if (state.selectedDisplayListItem == 3) {
        //Repeat Toggle Button Clicked
        ref.read(settingsProvider.notifier).getMusicFolderPath(context);
      }
    }
  }

  Future<void> seekForwardButton(double screenHeight) async {
    buttonPressVibrate();
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
          ref.read(musicProvider.notifier).artistNames.length - 1) {
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

    //If Forward Seek Button is Clicked in Now Playing or Cover Flow Screen
    else if (state.displayScreenType == DisplayScreenType.nowPlaying ||
        state.displayScreenType == DisplayScreenType.coverFlow) {
      await ref.read(musicProvider.notifier).nextSong();
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
    //When Clicked In Now Playing or Cover Flow Screen
    if (state.displayScreenType == DisplayScreenType.nowPlaying ||
        state.displayScreenType == DisplayScreenType.coverFlow) {
      await ref.read(musicProvider.notifier).previousSong();
      return;
    }

    //When Clicked In Songs Screen
    if (state.displayScreenType == DisplayScreenType.songs) {
      scrollScreenUp(40);
    }
    //When Clicked In Artist Songs Screen
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
      _longPressTimer = Timer.periodic(const Duration(milliseconds: 50), (_) {
        ref.read(musicProvider.notifier).seekForward();
      });
      return;
    }
  }

  void longPressEnd(LongPressEndDetails _) {
    if (_longPressTimer.isActive) {
      _longPressTimer.cancel();
    }
  }
}

final displayProvider =
    NotifierProvider<DisplayNotifier, DisplayDetails>(() => DisplayNotifier());
