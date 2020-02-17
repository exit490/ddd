import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/location/model/location_model.dart';
import 'package:flutter_app/location/repository/location_repository.dart';
import 'package:flutter_app/search/event/search_location_event.dart';
import 'package:flutter_app/search/bloc/search_location_state.dart';
import 'package:flutter_app/search/event/fetch_location_event.dart';
import 'package:flutter_app/search/event/typing_city_name_event.dart';

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
      delaySearch(event);
    }

    if (event is FetchLocationEvent) {
      yield* _mapSearchEventToState(event.cityName);
    }
  }

  delaySearch(event) {
    subscription?.cancel();
    subscription = Stream<int>.periodic(Duration(seconds: 1), (x) => x)
        .take(1)
        .listen((x) {
      add(FetchLocationEvent(cityName: event.cityName));
    });
  }

  Stream<SearchLocationState> _mapSearchEventToState(location) async* {
    final List<LocationModel> locations =
        await locationRepository.fetchLocationsByCityName(location);
    yield FoundLocationsState(locations: locations);
  }
}
