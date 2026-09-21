import 'package:cupertino_ui/cupertino_ui.dart';

class LyricsView extends StatelessWidget {
  final String lyrics;
  final ScrollController scrollController;

  const LyricsView({
    super.key,
    required this.lyrics,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CupertinoScrollbar(
        controller: scrollController,
        child: SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.only(right: 10),
          child: Text(
            lyrics,
            style: const TextStyle(
              fontSize: 16,
              height: 1.4,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
