import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/location/model/location_model.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();
}

class SelectLocationEvent extends LocationEvent {
  final int locationIndex;

  const SelectLocationEvent({
    @required this.locationIndex,
  }) : assert(locationIndex != null);

  @override
  List<Object> get props => [locationIndex];
}

class SaveLocationEvent extends LocationEvent {
  final LocationModel location;

  const SaveLocationEvent({
    @required this.location,
  }) : assert(location != null);

  @override
  List<Object> get props => [location];
}

class RestoreAllLocationEvent extends LocationEvent {
  final List<LocationModel> locations;

  const RestoreAllLocationEvent({
    @required this.locations,
  }) : assert(locations != null);

  @override
  List<Object> get props => [locations];
}
