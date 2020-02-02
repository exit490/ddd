import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/weather/model/weather_model.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherLoaded extends WeatherState {
  final Weather weather;

  const WeatherLoaded({
    @required this.weather,
  }) : assert(weather != null);

  @override
  List<Object> get props => [weather];
}

class WeatherLoading extends WeatherState {}

class WeatherEmpty extends WeatherState {}

class WeatherError extends WeatherState {}
