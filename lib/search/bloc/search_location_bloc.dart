import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/location/repository/location_repository.dart';
import 'package:flutter_app/search/bloc/search_location_state.dart';
import 'package:flutter_app/search/event/fetch_location_event.dart';
import 'package:flutter_app/search/event/search_location_event.dart';
import 'package:flutter_app/search/event/typing_city_name_event.dart';
import 'package:flutter_app/search/state/found_locations_state.dart';
import 'package:flutter_app/search/state/location_found_event.dart';

class SearchLocationBloc
    extends Bloc<SearchLocationEvent, SearchLocationState> {
  final LocationRepository locationRepository;
  StreamSubscription subscription;

  SearchLocationBloc({
    @required this.locationRepository,
  });

  @override
  SearchLocationState get initialState => InitialSearchLocationState();

  @override
  Stream<SearchLocationState> mapEventToState(
      SearchLocationEvent event) async* {
    if (event is TypingCityNameEvent) {
      _delaySearch(event);
    }

    if (event is FetchLocationEvent) {
      _mapSearchEventToState(event.cityName);
    }

    if (event is LocationsFoundEvent) {
      yield FoundLocationsState(locations: event.locations);
    }
  }

  _delaySearch(event) {
    subscription?.cancel();
    subscription = Stream<int>.periodic(Duration(seconds: 1), (x) => x)
        .take(1)
        .listen((x) => add(FetchLocationEvent(cityName: event.cityName)));
  }

  _mapSearchEventToState(location) {
    locationRepository
        .fetchLocationsByCityName(location)
        .listen((locations) => add(LocationsFoundEvent(locations: locations)));
  }
}
