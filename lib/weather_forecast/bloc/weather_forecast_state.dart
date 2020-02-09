import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/weather/model/weather_model.dart';

abstract class WeatherForecastState extends Equatable {
  const WeatherForecastState();

  @override
  List<Object> get props => [];
}

class InitialWeatherForecastState extends WeatherForecastState {}

class LoadedWeatherForecastState extends WeatherForecastState {
  final Weather weather;

  const LoadedWeatherForecastState({
    @required this.weather,
  }) : assert(weather != null);

  @override
  List<Object> get props => [weather];
}

class LoadingWeatherForecastState extends WeatherForecastState {}

class WeatherForecastErrorState extends WeatherForecastState {}
