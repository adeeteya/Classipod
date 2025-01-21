import 'package:classipod/core/constants/constants.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/models/metadata.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/services/audio_player_service.dart';
import 'package:classipod/features/custom_screen_widgets/custom_screen.dart';
import 'package:classipod/features/music/album/album_details.dart';
import 'package:classipod/features/music/album/album_details_provider.dart';
import 'package:classipod/features/music/search/search_model.dart';
import 'package:classipod/features/music/search/search_provider.dart';
import 'package:classipod/features/music/search/widgets/search_bar.dart';
import 'package:classipod/features/music/search/widgets/search_list_tile.dart';
import 'package:classipod/features/status_bar/widgets/status_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> with CustomScreen {
  String _searchText = '';
  bool _isSearchBarActive = true;
  final SearchBarController _searchBarController = SearchBarController();

  @override
  double get displayTileHeight => 50;

  @override
  String get routeName => Routes.search.name;

  @override
  List<SearchResultsModel> get displayItems =>
      ref.watch(searchProvider(_searchText));

  @override
  void onMenuButtonPressed() {
    if (_isSearchBarActive) {
      setState(() {
        _isSearchBarActive = false;
      });
    } else {
      context.pop();
    }
  }

  @override
  Future<void> onSelectPressed() async {
    if (_isSearchBarActive) {
      _searchBarController.selectAlphabet();
    } else {
      await _onSearchResultAction(selectedDisplayItem);
    }
  }

  Future<void> _onSearchResultAction(int displayIndex) async {
    setState(() => selectedDisplayItem = displayIndex);
    if (selectedDisplayItem == 0) {
      _onSearchDefaultTileAction();
      return;
    } else {
      final searchResult = displayItems[selectedDisplayItem - 1];
      if (searchResult.searchResultType == SearchResultType.track) {
        final metadata = searchResult.result as Metadata;
        await ref
            .read(audioPlayerServiceProvider.notifier)
            .playSongAtOriginalIndex(metadata.originalSongIndex);
        if (mounted) {
          await context.pushNamed(Routes.nowPlaying.name);
        }
      } else if (searchResult.searchResultType == SearchResultType.artist) {
        final selectedArtistName = searchResult.result as String;
        context.goNamed(
          Routes.artistSongs.name,
          pathParameters: {"artistName": selectedArtistName},
        );
      } else if (searchResult.searchResultType == SearchResultType.album) {
        final albumDetails = searchResult.result as AlbumDetails;
        final albumMetadataList = ref
            .read(albumDetailsProvider.notifier)
            .getAlbumMetadataList(albumDetails.albumName);
        await ref
            .read(audioPlayerServiceProvider.notifier)
            .setAudioSource(albumMetadataList);
        if (mounted) {
          await context.pushNamed(Routes.nowPlaying.name);
        }
      }
    }
  }

  void _onSearchDefaultTileAction() {
    setState(() {
      selectedDisplayItem = 0;
      _isSearchBarActive = !_isSearchBarActive;
    });
  }

  @override
  void scrollForward() {
    if (_isSearchBarActive) {
      _searchBarController.moveToNextAlphabet();
      return;
    }

    final size = MediaQuery.sizeOf(context);
    late final double screenHeight;
    if (size.height < 800) {
      screenHeight = Constants.smallScreenHeightRatio;
    } else {
      screenHeight = Constants.screenHeightRatio;
    }
    if (selectedDisplayItem < displayItems.length) {
      setState(() {
        selectedDisplayItem++;
      });

      if (((selectedDisplayItem + maxScrollDownDisplayItems) *
              displayTileHeight) >
          ((context.screenSize.height * screenHeight) +
              scrollController.offset)) {
        scrollController.jumpTo(scrollController.offset + displayTileHeight);
      }
    }
  }

  @override
  void scrollBackward() {
    if (_isSearchBarActive) {
      _searchBarController.moveBackToPreviousAlphabet();
      return;
    }
    super.scrollBackward();
  }

  @override
  Widget build(BuildContext context) {
    late final String statusBarTitle;
    if (displayItems.isEmpty) {
      statusBarTitle = Routes.search.title(context);
    } else {
      statusBarTitle =
          "${context.localization.searchResultsText} ${displayItems.length}";
    }

    return CupertinoPageScaffold(
      child: Stack(
        children: [
          Column(
            children: [
              StatusBar(
                title: statusBarTitle,
              ),
              Flexible(
                child: CupertinoScrollbar(
                  controller: scrollController,
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: displayItems.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return SearchListTile(
                          searchResult: SearchResultsModel(
                            searchResultType: SearchResultType.defaultSearch,
                            result: _searchText,
                            count: displayItems.length,
                          ),
                          isSelected: selectedDisplayItem == 0,
                          onTap: _onSearchDefaultTileAction,
                        );
                      }
                      return SearchListTile(
                        searchResult: displayItems[index - 1],
                        isSelected: selectedDisplayItem == index,
                        onTap: () async => _onSearchResultAction(index),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          if (_isSearchBarActive)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SearchBar(
                searchBarController: _searchBarController,
                onSearchTextChanged: (value) {
                  setState(() {
                    _searchText = value;
                  });
                },
              ),
            ),
        ],
      ),
    );
  }
}
