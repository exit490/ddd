import 'package:equatable/equatable.dart';
import 'package:permission_handler/permission_handler.dart';

class StateLocationPermission extends Equatable {
  final PermissionStatus permissionStatus;

  const StateLocationPermission({
    this.permissionStatus,
  }) : assert(permissionStatus != null);

  @override
  List<Object> get props => [permissionStatus];
}
