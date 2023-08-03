import 'package:devpaul_toolkit/config/themes/custom_light_theme.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog {
  Future<void> showCustomDialog(
      {required BuildContext context,
      required String title,
      required String content,
      required String actionText,
      String? cancelText,
      VoidCallback? callback}) async {
    return showDialog(
        context: context,
        builder: (context) => _alertDialog(
            context: context,
            title: title,
            content: content,
            actionText: actionText,
            cancelText: cancelText,
            callback: callback));
  }

  AlertDialog _alertDialog(
      {required BuildContext context,
      required String title,
      required String content,
      required String actionText,
      String? cancelText,
      VoidCallback? callback}) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        if (cancelText != null)
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                cancelText,
                style: const TextStyle(color: CustomLightTheme.primaryColor),
              )),
        TextButton(
            onPressed: callback ?? () => Navigator.pop(context),
            child: Text(
              actionText,
              style: const TextStyle(color: CustomLightTheme.primaryColor),
            )),
      ],
    );
  }
}
