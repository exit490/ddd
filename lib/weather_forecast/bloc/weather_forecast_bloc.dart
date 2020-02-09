import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_app/weather/repository/weather_repository.dart';
import 'package:flutter_app/weather_forecast/bloc/weather_forecast_event.dart';
import 'package:flutter_app/weather_forecast/bloc/weather_forecast_state.dart';
import 'package:meta/meta.dart';

class WeatherForecastBloc
    extends Bloc<WeatherForecastEvent, WeatherForecastState> {
  final WeatherRepository weatherRepository;

  WeatherForecastBloc({@required this.weatherRepository})
      : assert(weatherRepository != null);

  @override
  WeatherForecastState get initialState => InitialWeatherForecastState();

  @override
  Stream<WeatherForecastState> mapEventToState(
      WeatherForecastEvent event) async* {
    if (event is FetchWeatherForecastEvent) {
      yield* _mapFetchWeatherForecastToState(event);
    } else if (event is RefreshWeatherForecastEvent) {
      yield* _mapRefreshWeatherForecastToState(event);
    }
  }

  Stream<WeatherForecastState> _mapFetchWeatherForecastToState(
      FetchWeatherForecastEvent event) async* {
    yield LoadingWeatherForecastState();
    try {
      final weather = await weatherRepository.getWeatherFromLocation(
        event.locationId,
      );
      yield LoadedWeatherForecastState(weather: weather);
    } catch (_) {
      yield WeatherForecastErrorState();
    }
  }

  Stream<WeatherForecastState> _mapRefreshWeatherForecastToState(
      RefreshWeatherForecastEvent event) async* {
    try {
      final weather = await weatherRepository.getWeatherFromLocation(
        event.locationId,
      );

      yield LoadedWeatherForecastState(weather: weather);
    } catch (_) {
      yield WeatherForecastErrorState();
    }
  }
}
