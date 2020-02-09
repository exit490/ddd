import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_app/location/bloc/location_event.dart';
import 'package:flutter_app/location/bloc/location_state.dart';
import 'package:flutter_app/location/model/location_model.dart';
import 'package:flutter_app/location/repository/location_repository.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationRepository locationRepository;

  LocationBloc({
    this.locationRepository,
  }) : assert(locationRepository != null);

  @override
  LocationState get initialState => InitialLocationState();

  @override
  Stream<LocationState> mapEventToState(LocationEvent event) async* {
    if (event is DefaultLocationEvent) {
      yield* emitsLocationDefaultState();
    }

    if (event is BuildAllLocationEvent) {}
  }

//
//  Stream<WeatherTodayState> _mapRefreshWeatherToState(
//      RefreshWeatherEvent event) async* {
//    try {
//      final weather = await weatherRepository.getWeatherFromLocation(
//        event.locationId,
//      );
//
//      yield LoadedWeatherTodayState(weather: weather);
//    } catch (_) {
//      yield WeatherTodayError();
//    }
//  }

  Stream<LocationState> buildAllLocations() async* {
    final List<LocationModel> locations = List();
    final defaultLocation = await locationRepository.buildDefaultLocation();
    locations.add(defaultLocation);

    final locationsRestoredFromCache =
        await locationRepository.restoreAllLocationsFromCache();

    locations.addAll(locationsRestoredFromCache);
    yield AllLocationsRestoredState(locations: locations);
  }

  Stream<LocationState> emitsLocationDefaultState() async* {
    final defaultLocation = await locationRepository.buildDefaultLocation();
    yield DefaultLocationState(location: defaultLocation);
  }
}
