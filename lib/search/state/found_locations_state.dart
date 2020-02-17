import 'package:flutter/material.dart';
import 'package:flutter_app/location/model/location_model.dart';
import 'package:flutter_app/search/bloc/search_location_state.dart';

class FoundLocationsState extends SearchLocationState {
  final List<LocationModel> locations;

  const FoundLocationsState({
    @required this.locations,
  });

  @override
  List<Object> get props => [locations];
}
