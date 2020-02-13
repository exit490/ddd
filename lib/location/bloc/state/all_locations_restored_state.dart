import 'package:flutter/material.dart';
import 'package:flutter_app/location/bloc/state/location_state.dart';
import 'package:flutter_app/location/model/location_model.dart';

class AllLocationsRequestedState extends LocationState {
  final List<LocationModel> locations;

  const AllLocationsRequestedState({
    @required this.locations,
  });

  @override
  List<Object> get props => [locations];
}
