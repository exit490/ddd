import 'package:flutter/material.dart';

class DisabledLocationPermissionDialog extends AlertDialog {
  DisabledLocationPermissionDialog(
    BuildContext context,
  ) : super(
          title: Text('hello'),
          actions: whatActions(context),
        );

  static whatActions(context) {
    return <Widget>[
      yesButton(context),
    ];
  }

  static yesButton(context) {
    return FlatButton(
      child: Text('YES'),
      onPressed: () {
        Navigator.of(context).pop();
        // PermissionHandler().openAppSettings();
      },
    );
  }
}
