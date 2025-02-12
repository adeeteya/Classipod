import 'dart:io';

import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/constants/assets.dart';
import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/models/metadata.dart';
import 'package:classipod/features/music/album/models/album_model.dart';
import 'package:classipod/features/music/search/model/search_model.dart';
import 'package:flutter/cupertino.dart';

class SearchListTile extends StatelessWidget {
  final SearchResultsModel searchResult;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  const SearchListTile({
    super.key,
    required this.searchResult,
    required this.isSelected,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    late final String title;
    late final String description;
    late final String? imageFilePath;
    if (searchResult.searchResultType == SearchResultType.track) {
      final metadata = searchResult.result as Metadata;
      title = metadata.getTrackName;
      description = metadata.getMainArtistName;
    } else if (searchResult.searchResultType == SearchResultType.artist) {
      title = searchResult.result as String;
      description = context.localization.nAlbums(searchResult.count);
    } else if (searchResult.searchResultType == SearchResultType.album) {
      final albumDetails = searchResult.result as AlbumModel;
      title = albumDetails.albumName;
      description = context.localization.nSongs(searchResult.count);
      imageFilePath = albumDetails.albumArtPath;
    } else {
      title = context.localization.searchScreenTitle;
      if (searchResult.count == 0) {
        description = context.localization.searchEmptyText;
      } else {
        description =
            "${context.localization.resultsForText} ${searchResult.result}";
      }
    }

    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: SizedBox(
        height: 54,
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: isSelected
                ? const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppPalette.selectedTileGradientColor1,
                      AppPalette.selectedTileGradientColor2,
                    ],
                  )
                : null,
          ),
          child: Row(
            children: [
              (searchResult.searchResultType == SearchResultType.artist ||
                      searchResult.searchResultType ==
                          SearchResultType.defaultSearch)
                  ? SizedBox(
                      height: 50,
                      width: 50,
                      child: ColoredBox(
                        color: AppPalette.defaultIconBackgroundColor,
                        child: Center(
                          child: Icon(
                            (searchResult.searchResultType ==
                                    SearchResultType.artist)
                                ? CupertinoIcons.person_alt
                                : CupertinoIcons.search,
                          ),
                        ),
                      ),
                    )
                  : Image(
                      image: (searchResult.searchResultType ==
                                  SearchResultType.album &&
                              imageFilePath != null)
                          ? FileImage(File(imageFilePath))
                          : const AssetImage(Assets.defaultAlbumCoverImage),
                      errorBuilder: (_, __, ___) => Image.asset(
                        Assets.defaultAlbumCoverImage,
                        fit: BoxFit.fitWidth,
                      ),
                      height: 50,
                      width: 50,
                    ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isSelected
                            ? CupertinoColors.white
                            : CupertinoColors.black,
                      ),
                      maxLines: 1,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      description,
                      style: TextStyle(
                        color: isSelected
                            ? CupertinoColors.white
                            : AppPalette.hintTextColor,
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              if (isSelected)
                const Icon(
                  CupertinoIcons.right_chevron,
                  color: CupertinoColors.white,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
