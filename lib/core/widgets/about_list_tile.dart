import 'package:flutter/cupertino.dart';

class AboutListTile extends StatelessWidget {
  final String titleText;
  final String valueText;
  const AboutListTile(
      {super.key, required this.titleText, required this.valueText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titleText,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: CupertinoColors.black,
            ),
          ),
          Text(
            valueText,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: CupertinoColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
