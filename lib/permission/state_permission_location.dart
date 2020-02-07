import 'package:equatable/equatable.dart';

abstract class StateLocationPermission extends Equatable {
  const StateLocationPermission();

  @override
  List<Object> get props => [];
}

/// Permission to access the requested feature is denied by the user.
class DeniedStateLocationPermission extends StateLocationPermission {}

/// Permissions to access the feature is granted by the user but the feature is disabled.
class DisabledStateLocationPermission extends StateLocationPermission {}

/// Permission to access the requested feature is granted by the user.
class GrantedStateLocationPermission extends StateLocationPermission {}

/// The user granted restricted access to the requested feature (only on iOS).
class RestrictedStateLocationPermission extends StateLocationPermission {}

/// Permission to access the requested feature is denied by the user and never show selected (only on Android).
class NeverAskAgainStateLocationPermission extends StateLocationPermission {}

/// Permission is in an unknown state
class UnknownStateLocationPermission extends StateLocationPermission {}
