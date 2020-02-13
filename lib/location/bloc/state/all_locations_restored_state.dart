import 'package:flutter/material.dart';
import 'package:flutter_app/location/bloc/state/location_state.dart';
import 'package:flutter_app/location/model/location_model.dart';

class AllLocationsRestoredState extends LocationState {
  final List<LocationModel> locations;

  const AllLocationsRestoredState({
    @required this.locations,
  });

  @override
  List<Object> get props => [locations];
}
