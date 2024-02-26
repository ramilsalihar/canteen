import 'dart:io';

import 'package:canteen/presentation/widgets/buttons/app_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin DialogHelper {
  Future<T?> showMessageDialog<T>({
    required BuildContext context,
    required String message,
    required String content,
    Key? key,
    List<Widget>? actions,
  }) {
    final theme = Theme.of(context);
    return showDialog(
      context: context,
      builder: (dCtx) {
        if (Platform.isIOS) {
          return CupertinoAlertDialog(
            key: key,
            content: Text(message),
            actions: actions ??
                [
                  AppButton(
                    onPressed: Navigator.of(dCtx).pop,
                    title: "OK",
                  )
                ],
          );
        } else {
          return AlertDialog(
            key: key,
            alignment: Alignment.center,
            title: Text(message),
            titleTextStyle: theme.textTheme.displayMedium,
            content: Text(content),
            contentTextStyle: theme.textTheme.headlineSmall,
            actionsAlignment: MainAxisAlignment.center,
            actions: actions ??
                [
                  AppButton(
                    onPressed: Navigator.of(dCtx).pop,
                    title: "OK",
                  )
                ],
          );
        }
      },
    );
  }
}
