import 'package:classipod/core/widgets/marquee_text.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

class SelectedMarqueeText extends StatelessWidget {
  const SelectedMarqueeText(
    this.text, {
    super.key,
    required this.isSelected,
    this.style,
    this.textAlign = TextAlign.left,
  });

  final String text;
  final bool isSelected;
  final TextStyle? style;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    if (isSelected) {
      return MarqueeText(
        text,
        key: ValueKey(text),
        style: style,
        textAlign: textAlign,
      );
    }

    return Text(
      text,
      style: style,
      textAlign: textAlign,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
