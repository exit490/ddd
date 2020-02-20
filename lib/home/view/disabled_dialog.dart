import 'package:flutter/material.dart';
import 'package:flutter_app/android_permissions/view/disabled_location_permission_dialog.dart';

Future<void> showDisabledDialog(context) async {
  await Future.delayed(Duration.zero); //workaround to fix a crash O.O
  return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return DisabledLocationPermissionDialog(context);
      });
}
