import 'package:classipod/core/constants/app_palette.dart';
import 'package:classipod/core/constants/constants.dart';
import 'package:flutter/cupertino.dart';

class InputTextBarController {
  final String initialText;
  _InputTextBarState? _state;

  InputTextBarController({this.initialText = ''});

  void moveToNextAlphabet() => _state?._moveToNextAlphabet();

  void moveBackToPreviousAlphabet() => _state?._moveBackToPreviousAlphabet();

  void selectAlphabet() => _state?._selectAlphabet();

  void addSpace() => _state?._addSpace();

  void removeCharacter() => _state?._removeCharacter();
}

class InputTextBar extends StatefulWidget {
  final InputTextBarController inputTextBarController;
  final ValueChanged<String> onSearchTextChanged;

  const InputTextBar({
    super.key,
    required this.inputTextBarController,
    required this.onSearchTextChanged,
  });

  @override
  State<InputTextBar> createState() => _InputTextBarState();
}

class _InputTextBarState extends State<InputTextBar> {
  late final TextEditingController _inputTextController;
  late final ScrollController _scrollController;
  final String alphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  int _currentSelectedIndex = 0;

  @override
  void initState() {
    widget.inputTextBarController._state = this;
    _inputTextController = TextEditingController(
      text: widget.inputTextBarController.initialText,
    );
    _inputTextController.addListener(_onTextChanged);
    _scrollController = ScrollController();
    super.initState();
  }

  void _onTextChanged() {
    widget.onSearchTextChanged(_inputTextController.text);
  }

  @override
  void dispose() {
    _inputTextController.removeListener(_onTextChanged);
    _inputTextController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _moveToNextAlphabet() {
    setState(() {
      if (_currentSelectedIndex < alphabets.length - 1) {
        _currentSelectedIndex++;

        final double currentSelectedDisplayItemsWidth =
            (_currentSelectedIndex + 1) * Constants.inputTextAlphabetSize;

        final double currentScrollWidth =
            Constants.inputTextAlphabetContainerWidth +
            _scrollController.offset;

        if (currentSelectedDisplayItemsWidth > currentScrollWidth) {
          _scrollController.jumpTo(
            _scrollController.offset + Constants.inputTextAlphabetSize,
          );
        }
      }
    });
  }

  void _moveBackToPreviousAlphabet() {
    setState(() {
      if (_currentSelectedIndex > 0) {
        _currentSelectedIndex--;

        if (_currentSelectedIndex * Constants.inputTextAlphabetSize <
            _scrollController.offset) {
          _scrollController.jumpTo(
            _currentSelectedIndex * Constants.inputTextAlphabetSize,
          );
        }
      }
    });
  }

  void _selectAlphabet() {
    _inputTextController.text += alphabets[_currentSelectedIndex].toLowerCase();
  }

  void _addSpace() {
    _inputTextController.text += ' ';
  }

  void _removeCharacter() {
    _inputTextController.text = _inputTextController.text.substring(
      0,
      _inputTextController.text.length - 1,
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
                    controller: _inputTextController,
                    style: const TextStyle(
                      color: CupertinoColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  height: Constants.inputTextAlphabetSize,
                  width: Constants.inputTextAlphabetContainerWidth,
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
                        width: Constants.inputTextAlphabetSize,
                        height: Constants.inputTextAlphabetSize,
                      ),
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: Constants.inputTextAlphabetSize,
                          height: Constants.inputTextAlphabetSize,
                          child: ColoredBox(
                            color:
                                (_currentSelectedIndex == index)
                                    ? AppPalette.selectedTileGradientColor1
                                    : CupertinoColors.black,
                            child: Center(
                              child: Text(
                                alphabets[index],
                                style: const TextStyle(
                                  fontSize: Constants.inputTextAlphabetSize,
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
