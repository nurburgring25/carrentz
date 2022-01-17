import 'package:carrentz/dialog/spinner-dialog.dart';
import 'package:carrentz/model/spinner-item.dart';
import "package:flutter/material.dart";

class Dialogs {
  static message(BuildContext buildContext, String title, String message, VoidCallback voidCallback) {
    return showDialog<void>(
        context: buildContext,
        builder: (BuildContext buildContext) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                child: Text('Mengerti'),
                onPressed: () {
                  Navigator.of(buildContext).pop();

                  voidCallback.call();
                },
              )
            ],
          );
        }
    );
  }

  static void spinner(
      context,
      String title,
      ValueSetter<SpinnerItem> callback,
      List<SpinnerItem> items,
      ) {
    showDialog(
        context: context,
        builder: (BuildContext buildContext) {
          return SpinnerDialog(
            title: title,
            callback: callback,
            items: items
          );
        }
    );
  }
}