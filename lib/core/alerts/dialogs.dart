import 'package:classipod/core/extensions/build_context_extensions.dart';
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

  /// Returns true when the user picked the confirm action.
  static Future<bool> showConfirmationDialog({
    required BuildContext context,
    required String title,
    required String content,
    String? buttonConfirmText,
    String? buttonCancelText,
  }) async {
    final bool? isConfirmed = await showCupertinoDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          CupertinoDialogAction(
            onPressed: () => context.pop(false),
            child: Text(
              buttonCancelText ?? context.localization.cancelText,
            ),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => context.pop(true),
            child: Text(
              buttonConfirmText ?? context.localization.buttonConfirmText,
            ),
          ),
        ],
      ),
    );
    return isConfirmed ?? false;
  }
}
