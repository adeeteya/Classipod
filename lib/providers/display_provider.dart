import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:retropod/models/display_details.dart';
import 'package:retropod/providers/music_provider.dart';
import 'package:retropod/providers/settings_provider.dart';

class DisplayNotifier extends Notifier<DisplayDetails> {
  DisplayNotifier() : super();
  final List<String> musicListDisplayItems = [
    "Cover Flow",
    "Artists",
    "Albums",
    "Songs",
  ];

  @override
  DisplayDetails build() {
    return const DisplayDetails(
      scrollOffset: 0,
      selectedDisplayListItem: 0,
      displayScreenType: DisplayScreenType.menu,
    );
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
      } else if (state.displayScreenType == DisplayScreenType.settings) {
        //Do Nothing for now because not enough elements
      } else {
        seekForwardButton(height);
      }
    } else if (rotationalChange < -8) {
      if (state.displayScreenType == DisplayScreenType.nowPlaying) {
        ref.read(musicProvider.notifier).seekBackward();
      } else if (state.displayScreenType == DisplayScreenType.settings) {
        //Do Nothing for now because not enough elements
      } else {
        seekBackButton();
      }
    }
  }

  void navigateToMenu(BuildContext context) {
    if (state.displayScreenType == DisplayScreenType.coverFlow ||
        state.displayScreenType == DisplayScreenType.artistsSelection ||
        state.displayScreenType == DisplayScreenType.albums ||
        state.displayScreenType == DisplayScreenType.songs) {
      state = state.copyWith(
        selectedDisplayListItem: 0,
        displayScreenType: DisplayScreenType.musicMenu,
      );
      context.go("/menu/music");
    } else if (state.displayScreenType == DisplayScreenType.artistSongs) {
      state = state.copyWith(
        selectedDisplayListItem: 0,
        displayScreenType: DisplayScreenType.artistsSelection,
      );
      context.go("/menu/music/artists");
    } else {
      state = state.copyWith(
        selectedDisplayListItem: 0,
        displayScreenType: DisplayScreenType.menu,
      );
      context.go("/menu");
    }
  }

  void selectButton(BuildContext context) {
    //if the display is in Menu screen
    if (state.displayScreenType == DisplayScreenType.menu) {
      if (state.selectedDisplayListItem == 0) {
        state = state.copyWith(displayScreenType: DisplayScreenType.musicMenu);
        context.go("/menu/music");
      } else if (state.selectedDisplayListItem == 1) {
        //Now Playing Button Clicked
        state = state.copyWith(displayScreenType: DisplayScreenType.nowPlaying);
        context.go("/menu/now-playing");
      } else if (state.selectedDisplayListItem == 2) {
        //Shuffle Songs Button Clicked
        ref.read(musicProvider.notifier).shuffleAllSongs();
      } else if (state.selectedDisplayListItem == 3) {
        //Settings Button Clicked
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
        state = state.copyWith(displayScreenType: DisplayScreenType.coverFlow);
        context.go("/menu/music/cover-flow/");
      } else if (state.selectedDisplayListItem == 1) {
        state = state.copyWith(
            selectedDisplayListItem: 0,
            displayScreenType: DisplayScreenType.artistsSelection);
        context.go("/menu/music/artists/");
      } else if (state.selectedDisplayListItem == 2) {
        state = state.copyWith(
            selectedDisplayListItem: 0,
            displayScreenType: DisplayScreenType.albums);
        context.go("/menu/music/albums/");
      } else if (state.selectedDisplayListItem == 3) {
        ref.read(musicProvider.notifier);
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
      state = state.copyWith(displayScreenType: DisplayScreenType.nowPlaying);
      context.go("/menu/now-playing");
    }

    //if the display is in Albums Screen
    else if (state.displayScreenType == DisplayScreenType.albums) {
      ref.read(musicProvider.notifier).playAlbum(ref
          .read(musicProvider.notifier)
          .albumNames
          .elementAt(state.selectedDisplayListItem));
      state = state.copyWith(displayScreenType: DisplayScreenType.nowPlaying);
      context.go("/menu/now-playing");
    }

    //if the display is in Songs Screen
    else if (state.displayScreenType == DisplayScreenType.songs) {
      ref
          .read(musicProvider.notifier)
          .playAtIndex(state.selectedDisplayListItem);
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
      }
    }
  }

  Future<void> seekForwardButton(double screenHeight) async {
    //If Forward Seek Button is Clicked in the Music Menu Screen
    if (state.displayScreenType == DisplayScreenType.musicMenu) {
      if (state.selectedDisplayListItem != musicListDisplayItems.length - 1) {
        state = state.copyWith(
            selectedDisplayListItem: state.selectedDisplayListItem + 1);

        if (((state.selectedDisplayListItem + 2) * 30) >
            screenHeight * 0.3865) {
          state = state.copyWith(scrollOffset: state.scrollOffset + 30);
        }
      }
    }

    //If Forward Seek Button is Clicked in Artist Selection Screen
    else if (state.displayScreenType == DisplayScreenType.artistsSelection) {
      if (state.selectedDisplayListItem !=
          ref.read(musicProvider.notifier).artistNames.length - 1) {
        state = state.copyWith(
            selectedDisplayListItem: state.selectedDisplayListItem + 1);
        if (((state.selectedDisplayListItem + 2) * 30) >
            screenHeight * 0.3865) {
          state = state.copyWith(scrollOffset: state.scrollOffset + 30);
        }
      }
    }

    //If Forward Seek Button is Clicked in Artist Songs Screen
    else if (state.displayScreenType == DisplayScreenType.artistSongs) {
      if (state.selectedDisplayListItem !=
          ref.read(musicProvider.notifier).artistSongsIndexes.length - 1) {
        state = state.copyWith(
            selectedDisplayListItem: state.selectedDisplayListItem + 1);
        if (((state.selectedDisplayListItem + 2) * 50) >
            screenHeight * 0.3865) {
          state = state.copyWith(scrollOffset: state.scrollOffset + 50);
        }
      }
    }

    //If Forward Seek Button is Clicked in Albums Screen
    else if (state.displayScreenType == DisplayScreenType.albums) {
      if (state.selectedDisplayListItem !=
          ref.read(musicProvider.notifier).artistNames.length - 1) {
        state = state.copyWith(
            selectedDisplayListItem: state.selectedDisplayListItem + 1);
        if (((state.selectedDisplayListItem + 2) * 50) >
            screenHeight * 0.3865) {
          state = state.copyWith(scrollOffset: state.scrollOffset + 50);
        }
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
        state = state.copyWith(
            selectedDisplayListItem: state.selectedDisplayListItem + 1);
        if (((state.selectedDisplayListItem + 2) * 40) >
            screenHeight * 0.3865) {
          state = state.copyWith(scrollOffset: state.scrollOffset + 40);
        }
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
        state.selectedDisplayListItem != 1) {
      state = state.copyWith(
          selectedDisplayListItem: state.selectedDisplayListItem + 1);
    }
  }

  Future<void> seekBackButton() async {
    if (state.displayScreenType == DisplayScreenType.nowPlaying ||
        state.displayScreenType == DisplayScreenType.coverFlow) {
      await ref.read(musicProvider.notifier).previousSong();
      return;
    }
    if (state.displayScreenType == DisplayScreenType.songs) {
      if (state.selectedDisplayListItem != 0) {
        state = state.copyWith(
            selectedDisplayListItem: state.selectedDisplayListItem - 1);
      }
      if (((state.selectedDisplayListItem) * 40) < state.scrollOffset) {
        state = state.copyWith(scrollOffset: state.scrollOffset - 40);
      }
    } else if (state.displayScreenType == DisplayScreenType.artistSongs ||
        state.displayScreenType == DisplayScreenType.albums) {
      if (state.selectedDisplayListItem != 0) {
        state = state.copyWith(
            selectedDisplayListItem: state.selectedDisplayListItem - 1);
      }
      if (((state.selectedDisplayListItem) * 50) < state.scrollOffset) {
        state = state.copyWith(scrollOffset: state.scrollOffset - 50);
      }
    } else {
      if (state.selectedDisplayListItem != 0) {
        state = state.copyWith(
            selectedDisplayListItem: state.selectedDisplayListItem - 1);
      }
      if (((state.selectedDisplayListItem) * 30) < state.scrollOffset) {
        state = state.copyWith(scrollOffset: state.scrollOffset - 30);
      }
    }
  }
}

final displayProvider =
    NotifierProvider<DisplayNotifier, DisplayDetails>(() => DisplayNotifier());
