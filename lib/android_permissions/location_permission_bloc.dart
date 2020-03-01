import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_app/android_permissions/location_permission_event.dart';
import 'package:flutter_app/android_permissions/location_permission_state.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationPermissionBloc
    extends Bloc<LocationPermissionEvent, LocationPermissionState> {
  final PermissionHandler permissionHandler;

  LocationPermissionBloc({
    @required this.permissionHandler,
  }) : assert(permissionHandler != null);

  @override
  LocationPermissionState get initialState => InitialLocationPermissionState();

  @override
  Stream<LocationPermissionState> mapEventToState(
      LocationPermissionEvent event) async* {
    if (event is CheckLocationPermissionEvent) {
      yield* checkLocationPermission();
    } else if (event is RequestLocationPermissionEvent) {
      yield* requestPermission();
    }
  }

  Stream<LocationPermissionState> checkLocationPermission() async* {
    try {
      final status = await permissionHandler.checkPermissionStatus(
        PermissionGroup.location,
      );

      yield* _mapStatusPermissionToState(status);
    } catch (_) {
      yield UnknownLocationPermissionState();
    }
  }

  Stream<LocationPermissionState> requestPermission() async* {
    try {
      Map<PermissionGroup, PermissionStatus> permissions =
          await PermissionHandler().requestPermissions([
        PermissionGroup.location,
      ]);

      final status = permissions[PermissionGroup.location];

      yield* _mapStatusPermissionToState(status);
    } catch (_) {
      yield UnknownLocationPermissionState();
    }
  }

  Stream<LocationPermissionState> _mapStatusPermissionToState(
      PermissionStatus status) async* {
    switch (status) {
      case PermissionStatus.denied:
        yield DisabledLocationPermissionState();
        break;
      case PermissionStatus.granted:
        yield GrantedLocationPermissionState();
        break;
      case PermissionStatus.disabled:
        yield DisabledLocationPermissionState();
        break;
      case PermissionStatus.restricted:
        yield RestrictedLocationPermissionState();
        break;
      case PermissionStatus.neverAskAgain:
        yield NeverAskAgainLocationPermissionState();
        break;
      default:
        yield UnknownLocationPermissionState();
    }
  }
}
