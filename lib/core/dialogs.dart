import 'package:classipod/core/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class Dialogs {
  static Future showInfoDialog({
    required BuildContext context,
    required String title,
    required String content,
    String? buttonConfirmText,
  }) async {
    return showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => context.pop(),
            child: Text(
              buttonConfirmText ?? context.localization.buttonConfirmText,
            ),
          ),
        ],
      ),
    );
  }
}
