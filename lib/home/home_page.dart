import 'package:flutter/material.dart';
import 'package:flutter_app/home/home_location_permission_builder.dart';
import 'package:flutter_app/home/home_material_app.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeMaterialApp(
      home: Container(
        child: HomeLocationPermissionBuilder.handlerState(),
      ),
    );
  }
}
