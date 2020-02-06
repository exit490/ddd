import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/weather/model/weather_model.dart';

abstract class StateWeatherToday extends Equatable {
  const StateWeatherToday();

  @override
  List<Object> get props => [];
}

class LoadedStateWeatherToday extends StateWeatherToday {
  final Weather weather;

  const LoadedStateWeatherToday({
    @required this.weather,
  }) : assert(weather != null);

  @override
  List<Object> get props => [weather];
}

class WeatherTodayLoading extends StateWeatherToday {}

class WeatherTodayError extends StateWeatherToday {}
