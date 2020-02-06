import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_app/weather/repository/weather_repository.dart';
import 'package:flutter_app/weather_today/bloc/event_weather_today.dart';
import 'package:flutter_app/weather_today/bloc/state_weather_today.dart';
import 'package:meta/meta.dart';

class BlocWeatherToday extends Bloc<EventWeatherToday, StateWeatherToday> {
  final WeatherRepository weatherRepository;

  BlocWeatherToday({@required this.weatherRepository})
      : assert(weatherRepository != null);

  @override
  StateWeatherToday get initialState => WeatherTodayLoading();

  @override
  Stream<StateWeatherToday> mapEventToState(EventWeatherToday event) async* {
    if (event is FetchWeatherTodayEvent) {
      yield* _mapFetchWeatherToState(event);
    } else if (event is RefreshWeather) {
      yield* _mapRefreshWeatherToState(event);
    }
  }

  Stream<StateWeatherToday> _mapFetchWeatherToState(
      FetchWeatherTodayEvent event) async* {
    yield WeatherTodayLoading();
    try {
      final weather = await weatherRepository.getWeatherFromLocation(
        event.locationId,
      );
      yield LoadedStateWeatherToday(weather: weather);
    } catch (_) {
      yield WeatherTodayError();
    }
  }

  Stream<StateWeatherToday> _mapRefreshWeatherToState(
      RefreshWeather event) async* {
    try {
      final weather = await weatherRepository.getWeatherFromLocation(
        event.locationId,
      );

      yield LoadedStateWeatherToday(weather: weather);
    } catch (_) {
      yield WeatherTodayError();
    }
  }
}
