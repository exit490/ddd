import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_app/weather/repository/weather_repository.dart';
import 'package:flutter_app/weather_today/bloc/weather_today_event.dart';
import 'package:flutter_app/weather_today/bloc/weather_today_state.dart';
import 'package:meta/meta.dart';

class WeatherTodayBloc extends Bloc<WeatherTodayEvent, WeatherTodayState> {
  final WeatherRepository weatherRepository;

  WeatherTodayBloc({@required this.weatherRepository})
      : assert(weatherRepository != null);

  @override
  WeatherTodayState get initialState => WeatherTodayLoading();

  @override
  Stream<WeatherTodayState> mapEventToState(WeatherTodayEvent event) async* {
    if (event is FetchWeatherTodayEvent) {
      yield* _mapFetchWeatherToState(event);
    } else if (event is RefreshWeatherEvent) {
      yield* _mapRefreshWeatherToState(event);
    }
  }

  Stream<WeatherTodayState> _mapFetchWeatherToState(
      FetchWeatherTodayEvent event) async* {
    yield WeatherTodayLoading();
    try {
      final weather = await weatherRepository.getWeatherFromLocation(
        event.locationId,
      );
      yield LoadedWeatherTodayState(weather: weather);
    } catch (_) {
      yield WeatherTodayError();
    }
  }

  Stream<WeatherTodayState> _mapRefreshWeatherToState(
      RefreshWeatherEvent event) async* {
    try {
      final weather = await weatherRepository.getWeatherFromLocation(
        event.locationId,
      );

      yield LoadedWeatherTodayState(weather: weather);
    } catch (_) {
      yield WeatherTodayError();
    }
  }
}
