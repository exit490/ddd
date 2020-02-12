import 'package:flutter/material.dart';
import 'package:flutter_app/home/home_body.dart';
import 'package:flutter_app/home/home_location_builder.dart';
import 'package:flutter_app/home/home_material_app.dart';
import 'package:flutter_app/permission/location_permission_bloc.dart';
import 'package:flutter_app/permission/location_permission_event.dart';
import 'package:flutter_app/permission/location_permission_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeMaterialApp(
      home: main(),
    );
  }

  main() {
    final blocBuilder =
        BlocBuilder<LocationPermissionBloc, LocationPermissionState>(
      builder: (context, locationPermissionState) {
        return _handlerCheckLocationPermissionState(
          context,
          locationPermissionState,
        );
      },
    );

    return Container(
      child: blocBuilder,
    );
  }

  requestLocationPermission(context) {
    BlocProvider.of<LocationPermissionBloc>(context)
        .add(RequestLocationPermissionEvent());
  }

  checkLocationPermission(context) {
    BlocProvider.of<LocationPermissionBloc>(context)
        .add(CheckLocationPermissionEvent());
  }

  _handlerCheckLocationPermissionState(context, locationPermissionState) {
    if (locationPermissionState is InitialLocationPermissionState) {
      checkLocationPermission(context);
      return HomeBody();
    }

    if (locationPermissionState is DisabledLocationPermissionState) {
      requestLocationPermission(context);
      return HomeBody();
    }

    if (locationPermissionState is GrantedLocationPermissionState) {
      return HomeLocationBuilder.handlerState();
    }

    if (locationPermissionState is NeverAskAgainLocationPermissionState) {
      return HomeLocationBuilder.handlerState();
    }

    if (locationPermissionState is RestrictedLocationPermissionState) {
      return HomeBody();
    }
  }
}
