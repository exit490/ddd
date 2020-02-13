import 'package:flutter/material.dart';
import 'package:flutter_app/location/bloc/state/location_state.dart';
import 'package:flutter_app/location/model/location_model.dart';

class LocationRestoredState extends LocationState {
  final LocationModel location;

  const LocationRestoredState({
    @required this.location,
  }) : assert(location != null);

  @override
  List<Object> get props => [location];
}
