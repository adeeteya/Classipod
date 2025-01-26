import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/navigation/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class PageNotFoundScreen extends StatelessWidget {
  const PageNotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(context.localization.pageNotFoundText),
            CupertinoButton(
              onPressed: () => context.goNamed(Routes.splash.name),
              child: Text(context.localization.retryButtonText),
            ),
          ],
        ),
      ),
    );
  }
}
