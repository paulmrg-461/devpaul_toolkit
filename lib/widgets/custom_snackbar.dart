import 'package:flutter/material.dart';

class CustomSnackBar extends SnackBar {
  CustomSnackBar(
      {Key? key,
      required String message,
      String btnLabel = 'Ok',
      VoidCallback? callback,
      Duration duration = const Duration(seconds: 2)})
      : super(
            key: key,
            content: Text(message),
            duration: duration,
            action: SnackBarAction(
                label: btnLabel,
                onPressed: () {
                  if (callback != null) callback();
                }));
}
