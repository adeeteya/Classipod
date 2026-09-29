import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/theme/ipod_gradients.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

class RatingBar extends StatelessWidget {
  final int currentRating;
  final ValueChanged<int?> onRatingClicked;

  const RatingBar({
    super.key,
    required this.currentRating,
    required this.onRatingClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 8),
          child: GestureDetector(
            onTap: () => onRatingClicked(index + 1),
            child: (currentRating > index)
                ? ShaderMask(
                    shaderCallback: IpodGradients.selection.createShader,
                    blendMode: BlendMode.srcIn,
                    child: const Icon(
                      CupertinoIcons.star_fill,
                      size: 24,
                      color: CupertinoColors.white,
                    ),
                  )
                : SizedBox(
                    height: 24,
                    width: 24,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: DecoratedBox(
                        decoration: ShapeDecoration(
                          color: context.appPrimaryTextColor,
                          shape: const CircleBorder(),
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
