import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/location/model/location_model.dart';

abstract class SearchLocationState extends Equatable {
  const SearchLocationState();

  @override
  List<Object> get props => [];
}

class InitialSearchLocationState extends SearchLocationState {}
