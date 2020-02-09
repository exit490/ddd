import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class WeatherForecastEvent extends Equatable {
  const WeatherForecastEvent();
}

class FetchWeatherForecastEvent extends WeatherForecastEvent {
  final int locationId;

  const FetchWeatherForecastEvent({@required this.locationId})
      : assert(locationId != null);

  @override
  List<Object> get props => [locationId];
}

class RefreshWeatherForecastEvent extends WeatherForecastEvent {
  final int locationId;

  const RefreshWeatherForecastEvent({@required this.locationId})
      : assert(locationId != null);

  @override
  List<Object> get props => [locationId];
}
