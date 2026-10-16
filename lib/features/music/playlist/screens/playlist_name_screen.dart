import 'package:classipod/core/navigation/routes.dart';
import 'package:classipod/core/utils/playlist_name.dart';
import 'package:classipod/core/widgets/input_text_bar.dart';
import 'package:classipod/features/custom_screen_elements/custom_input_text_screen.dart';
import 'package:classipod/features/music/playlist/models/playlist_name_result.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Asks for the name of a playlist being created.
///
/// Pops with a [PlaylistNameResult]: a submitted name when the user leaves the
/// editor (MENU or Play), and an empty cancelled result when they back out
/// while the text field is still open. The field always starts empty so the
/// user types the name from scratch.
class PlaylistNameScreen extends ConsumerStatefulWidget {
  const PlaylistNameScreen({super.key});

  @override
  ConsumerState createState() => _PlaylistNameScreenState();
}

class _PlaylistNameScreenState extends ConsumerState<PlaylistNameScreen>
    with CustomInputTextScreen {
  @override
  String get routeName => Routes.playlistName.name;

  @override
  List get displayItems => const [];

  /// Leaving the editor is the confirmation gesture: the typed name is
  /// submitted so the playlist is saved without a separate confirm step.
  void _submit() {
    final name = capitalizeFirstLetter(inputText);
    if (name.isEmpty) {
      context.pop(const PlaylistNameResult.cancelled());
    } else {
      context.pop(PlaylistNameResult.submitted(name));
    }
  }

  @override
  void onMenuButtonPressed() {
    if (isInputTextBarActive) {
      setState(() => isInputTextBarActive = false);
    } else {
      _submit();
    }
  }

  @override
  void onSelectAction() => _submit();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          if (isInputTextBarActive)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: InputTextBar(
                inputTextBarController: inputTextBarController,
                onSearchTextChanged: (value) {
                  setState(() {
                    inputText = value;
                  });
                },
              ),
            ),
        ],
      ),
    );
  }
}
