import 'package:flutter/cupertino.dart';

class AppStartupLoading extends StatelessWidget {
  const AppStartupLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(child: CupertinoActivityIndicator(radius: 32)),
      ),
    );
  }
}
