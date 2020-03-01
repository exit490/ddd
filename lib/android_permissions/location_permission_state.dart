import 'package:equatable/equatable.dart';

abstract class LocationPermissionState extends Equatable {
  const LocationPermissionState();

  @override
  List<Object> get props => [];
}

class InitialLocationPermissionState extends LocationPermissionState {}

/// Permission to access the requested feature is denied by the user.
class DeniedLocationPermissionState extends LocationPermissionState {}

/// Permissions to access the feature is granted by the user but the feature is disabled.
class DisabledLocationPermissionState extends LocationPermissionState {}

/// Permission to access the requested feature is granted by the user.
class GrantedLocationPermissionState extends LocationPermissionState {}

/// The user granted restricted access to the requested feature (only on iOS).
class RestrictedLocationPermissionState extends LocationPermissionState {}

/// Permission to access the requested feature is denied by the user and never show selected (only on Android).
class NeverAskAgainLocationPermissionState extends LocationPermissionState {}

/// Permission is in an unknown state
class UnknownLocationPermissionState extends LocationPermissionState {}
