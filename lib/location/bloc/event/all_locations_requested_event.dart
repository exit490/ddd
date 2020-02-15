import 'package:flutter/material.dart';
import 'package:flutter_app/location/bloc/event/location_event.dart';
import 'package:flutter_app/location/model/location_model.dart';

class AllLocationsRequestedEvent extends LocationEvent {
  final List<LocationModel> locations;

  const AllLocationsRequestedEvent({
    @required this.locations,
  });

  @override
  List<Object> get props => [locations];
}
