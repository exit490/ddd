import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/location/model/location_model.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

class SelectLocationEvent extends LocationEvent {
  final int locationIndex;

  const SelectLocationEvent({
    @required this.locationIndex,
  }) : assert(locationIndex != null);

  @override
  List<Object> get props => [locationIndex];
}

class StoreLocationOnCacheEvent extends LocationEvent {
  final LocationModel location;

  const StoreLocationOnCacheEvent({
    @required this.location,
  }) : assert(location != null);

  @override
  List<Object> get props => [location];
}

class BuildAllLocationEvent extends LocationEvent {}

class AllLocationsFromCacheEvent extends LocationEvent {
  final List<LocationModel> locations;

  const AllLocationsFromCacheEvent({
    @required this.locations,
  }) : assert(locations != null);

  @override
  List<Object> get props => [locations];
}
