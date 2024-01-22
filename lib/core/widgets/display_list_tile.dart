import 'package:flutter/cupertino.dart';
import 'package:retropod/core/constants.dart';

class DisplayListTile extends StatelessWidget {
  final String text;
  final bool isSelected;
  const DisplayListTile(
      {super.key, required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        gradient: (isSelected)
            ? const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [primaryBlueGradientColor1, primaryBlueGradientColor2],
              )
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color:
                  (isSelected) ? CupertinoColors.white : CupertinoColors.black,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (isSelected)
            const Icon(
              CupertinoIcons.right_chevron,
              color: CupertinoColors.white,
            ),
        ],
      ),
    );
  }
}
