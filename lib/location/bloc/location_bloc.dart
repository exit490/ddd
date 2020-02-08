import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_app/location/bloc/location_event.dart';
import 'package:flutter_app/location/bloc/location_state.dart';
import 'package:flutter_app/location/repository/location_repository.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationRepository locationRepository;

  LocationBloc({
    this.locationRepository,
  }) : assert(locationRepository != null);

  @override
  LocationState get initialState => getLocationDefaultState();

  @override
  Stream<LocationState> mapEventToState(LocationEvent event) async* {
    if (event is LocationRestoredState) {
      // yield* _mapFetchWeatherToState(event);
    }
  }

//  Stream<WeatherTodayState> _mapFetchWeatherToState(
//      FetchWeatherTodayEvent event) async* {
//    yield WeatherTodayLoading();
//    try {
//      final weather = await weatherRepository.getWeatherFromLocation(
//        event.locationId,
//      );
//      yield LoadedWeatherTodayState(weather: weather);
//    } catch (_) {
//      yield WeatherTodayError();
//    }
//  }
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

  getLocationDefaultState() async {
    final defaultLocation = await locationRepository.getDefaultLocation();
    return DefaultLocationState(location: defaultLocation);
  }
}
