import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/location/model/location_model.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class DefaultLocationState extends LocationState {
  final LocationModel location;

  const DefaultLocationState({
    @required this.location,
  }) : assert(location != null);

  @override
  List<Object> get props => [location];
}

class LocationRestoredState extends LocationState {
  final LocationModel location;

  const LocationRestoredState({
    @required this.location,
  }) : assert(location != null);

  @override
  List<Object> get props => [location];
}

class AllLocationsRestoredState extends LocationState {
  final List<LocationModel> locations;

  const AllLocationsRestoredState({
    @required this.locations,
  }) : assert(locations != null);

  @override
  List<Object> get props => [locations];
}
