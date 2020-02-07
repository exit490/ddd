import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_app/permission/event_permission_location.dart';
import 'package:flutter_app/permission/state_permission_location.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';

class BlocLocationPermission
    extends Bloc<EventLocationPermission, StateLocationPermission> {
  final PermissionHandler permissionHandler;

  BlocLocationPermission({@required this.permissionHandler})
      : assert(permissionHandler != null);

  @override
  StateLocationPermission get initialState => UnknownStateLocationPermission();

  @override
  Stream<StateLocationPermission> mapEventToState(
      EventLocationPermission event) async* {
    if (event is EventCheckLocationPermission) {
      yield* checkLocationPermission();
    } else if (event is EventRequestLocationPermission) {
      yield* requestPermission();
    }
  }

  Stream<StateLocationPermission> checkLocationPermission() async* {
    try {
      final status = await permissionHandler.checkPermissionStatus(
        PermissionGroup.location,
      );

      yield* _mapStatusPermissionToState(status);
    } catch (_) {
      yield UnknownStateLocationPermission();
    }
  }

  Stream<StateLocationPermission> requestPermission() async* {
    try {
      Map<PermissionGroup, PermissionStatus> permissions =
          await PermissionHandler()
              .requestPermissions([PermissionGroup.location]);

      final status = permissions[PermissionGroup.location];

      yield* _mapStatusPermissionToState(status);
    } catch (_) {
      yield UnknownStateLocationPermission();
    }
  }

  Stream<StateLocationPermission> _mapStatusPermissionToState(
      PermissionStatus status) async* {
    switch (status) {
      case PermissionStatus.denied:
        yield DisabledStateLocationPermission();
        break;
      case PermissionStatus.granted:
        yield GrantedStateLocationPermission();
        break;
      case PermissionStatus.disabled:
        yield DisabledStateLocationPermission();
        break;
      case PermissionStatus.restricted:
        yield RestrictedStateLocationPermission();
        break;
      case PermissionStatus.neverAskAgain:
        yield NeverAskAgainStateLocationPermission();
        break;
      default:
        yield UnknownStateLocationPermission();
    }
  }
}
