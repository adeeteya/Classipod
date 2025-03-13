import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/constants/constants.dart';
import 'package:flutter/cupertino.dart';

class SearchBarController {
  final String initialSearchText;
  _SearchBarState? _state;

  SearchBarController({this.initialSearchText = ''});

  void moveToNextAlphabet() => _state?._moveToNextAlphabet();

  void moveBackToPreviousAlphabet() => _state?._moveBackToPreviousAlphabet();

  void selectAlphabet() => _state?._selectAlphabet();

  void addSpace() => _state?._addSpace();

  void removeCharacter() => _state?._removeCharacter();
}

class SearchBar extends StatefulWidget {
  final SearchBarController searchBarController;
  final ValueChanged<String> onSearchTextChanged;

  const SearchBar({
    super.key,
    required this.searchBarController,
    required this.onSearchTextChanged,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late final TextEditingController _searchController;
  late final ScrollController _scrollController;
  final String alphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  int _currentSelectedIndex = 0;

  @override
  void initState() {
    widget.searchBarController._state = this;
    _searchController = TextEditingController(
      text: widget.searchBarController.initialSearchText,
    );
    _searchController.addListener(_onTextChanged);
    _scrollController = ScrollController();
    super.initState();
  }

  void _onTextChanged() {
    widget.onSearchTextChanged(_searchController.text);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onTextChanged);
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _moveToNextAlphabet() {
    setState(() {
      if (_currentSelectedIndex < alphabets.length - 1) {
        _currentSelectedIndex++;

        final double currentSelectedDisplayItemsWidth =
            (_currentSelectedIndex + 1) * Constants.searchAlphabetSize;

        final double currentScrollWidth =
            Constants.searchAlphabetContainerWidth + _scrollController.offset;

        if (currentSelectedDisplayItemsWidth > currentScrollWidth) {
          _scrollController.jumpTo(
            _scrollController.offset + Constants.searchAlphabetSize,
          );
        }
      }
    });
  }

  void _moveBackToPreviousAlphabet() {
    setState(() {
      if (_currentSelectedIndex > 0) {
        _currentSelectedIndex--;

        if (_currentSelectedIndex * Constants.searchAlphabetSize <
            _scrollController.offset) {
          _scrollController.jumpTo(
            _currentSelectedIndex * Constants.searchAlphabetSize,
          );
        }
      }
    });
  }

  void _selectAlphabet() {
    _searchController.text += alphabets[_currentSelectedIndex].toLowerCase();
  }

  void _addSpace() {
    _searchController.text += ' ';
  }

  void _removeCharacter() {
    _searchController.text = _searchController.text.substring(
      0,
      _searchController.text.length - 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: 54,
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                CupertinoColors.darkBackgroundGray.withValues(alpha: 0.5),
                CupertinoColors.black,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Row(
              children: [
                Expanded(
                  child: CupertinoTextField(
                    padding: const EdgeInsets.all(4),
                    cursorColor: CupertinoColors.black,
                    controller: _searchController,
                    style: const TextStyle(
                      color: CupertinoColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  height: Constants.searchAlphabetSize,
                  width: Constants.searchAlphabetContainerWidth,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: CupertinoColors.black,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: ListView.builder(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: alphabets.length,
                      prototypeItem: const SizedBox(
                        width: Constants.searchAlphabetSize,
                        height: Constants.searchAlphabetSize,
                      ),
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: Constants.searchAlphabetSize,
                          height: Constants.searchAlphabetSize,
                          child: ColoredBox(
                            color:
                                (_currentSelectedIndex == index)
                                    ? AppPalette.selectedTileGradientColor1
                                    : CupertinoColors.black,
                            child: Center(
                              child: Text(
                                alphabets[index],
                                style: const TextStyle(
                                  fontSize: Constants.searchAlphabetSize,
                                  color: CupertinoColors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
