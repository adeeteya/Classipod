import 'package:classipod/core/constants/app_palette.dart';
import 'package:flutter/cupertino.dart';

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
            child:
                (currentRating > index)
                    ? const Icon(
                      CupertinoIcons.star_fill,
                      size: 24,
                      color: AppPalette.selectedTileGradientColor2,
                    )
                    : const SizedBox(
                      height: 24,
                      width: 24,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: DecoratedBox(
                          decoration: ShapeDecoration(
                            color: CupertinoColors.black,
                            shape: CircleBorder(),
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
