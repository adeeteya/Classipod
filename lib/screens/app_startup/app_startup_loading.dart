import 'package:flutter/cupertino.dart';
import 'package:vector_graphics/vector_graphics.dart';

class AppStartupLoading extends StatelessWidget {
  const AppStartupLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: VectorGraphic(
            loader: AssetBytesLoader("assets/icons/apple_logo.svg"),
          ),
        ),
      ),
    );
  }
}
