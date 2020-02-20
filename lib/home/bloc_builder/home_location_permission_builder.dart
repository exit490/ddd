import 'package:flutter_app/home/bloc_builder/home_location_builder.dart';
import 'package:flutter_app/permission/location_permission_bloc.dart';
import 'package:flutter_app/permission/location_permission_event.dart';
import 'package:flutter_app/permission/location_permission_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view/home_body.dart';

class HomeLocationPermissionBuilder
    extends BlocBuilder<LocationPermissionBloc, LocationPermissionState> {
  HomeLocationPermissionBuilder.handlerState()
      : super(builder: (context, locationPermissionState) {
          return _handle(context, locationPermissionState);
        });

  static _handle(context, locationPermissionState) {
    if (locationPermissionState is InitialLocationPermissionState) {
      _checkLocationPermission(context);
      return HomeBody();
    }

    if (locationPermissionState is DisabledLocationPermissionState) {
      _requestLocationPermission(context);
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

  static _requestLocationPermission(context) {
    BlocProvider.of<LocationPermissionBloc>(context)
        .add(RequestLocationPermissionEvent());
  }

  static _checkLocationPermission(context) {
    BlocProvider.of<LocationPermissionBloc>(context)
        .add(CheckLocationPermissionEvent());
  }
}
