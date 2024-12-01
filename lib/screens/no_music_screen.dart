import 'package:classipod/core/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:vector_graphics/vector_graphics.dart';

class NoMusicScreen extends StatelessWidget {
  const NoMusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            VectorGraphic(
              loader: AssetBytesLoader("assets/icons/music_note.svg"),
              colorFilter: ColorFilter.mode(
                lightDeviceFrameGradientColor2,
                BlendMode.srcIn,
              ),
              width: 125,
              height: 125,
            ),
            SizedBox(height: 20),
            Text(
              "No Music",
              style: TextStyle(
                fontSize: 18,
                color: lightDeviceFrameGradientColor2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
