import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/location/model/location_model.dart';

abstract class SearchLocationState extends Equatable {
  const SearchLocationState();

  @override
  List<Object> get props => [];
}

class InitialSearchLocationState extends SearchLocationState {}

class FoundLocationsState extends SearchLocationState {
  final List<LocationModel> locations;

  const FoundLocationsState({
    @required this.locations,
  }) : assert(locations != null);

  @override
  List<Object> get props => [locations];
}
