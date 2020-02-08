import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/weather/model/weather_model.dart';

abstract class WeatherTodayState extends Equatable {
  const WeatherTodayState();

  @override
  List<Object> get props => [];
}

class InitialWeatherTodayState extends WeatherTodayState {}

class LoadedWeatherTodayState extends WeatherTodayState {
  final Weather weather;

  const LoadedWeatherTodayState({
    @required this.weather,
  }) : assert(weather != null);

  @override
  List<Object> get props => [weather];
}

class WeatherTodayLoading extends WeatherTodayState {}

class WeatherTodayError extends WeatherTodayState {}
