import 'package:equatable/equatable.dart';

abstract class LocationPermissionEvent extends Equatable {
  const LocationPermissionEvent();

  @override
  List<Object> get props => [];
}

class RequestLocationPermissionEvent extends LocationPermissionEvent {}

class CheckLocationPermissionEvent extends LocationPermissionEvent {}
