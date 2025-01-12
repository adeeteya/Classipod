import 'package:classipod/core/extensions.dart';
import 'package:flutter/cupertino.dart';

class AppStartupError extends StatelessWidget {
  final Object error;
  final VoidCallback onRetry;
  const AppStartupError({
    super.key,
    required this.error,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: Column(
            children: [
              Text('${context.localization.commonErrorText} $error'),
              CupertinoButton(
                onPressed: onRetry,
                child: Text(context.localization.retryButtonText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
