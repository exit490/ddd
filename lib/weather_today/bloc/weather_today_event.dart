import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class WeatherTodayEvent extends Equatable {
  const WeatherTodayEvent();
}

class FetchWeatherTodayEvent extends WeatherTodayEvent {
  final int locationId;

  const FetchWeatherTodayEvent({@required this.locationId})
      : assert(locationId != null);

  @override
  List<Object> get props => [locationId];
}

class RefreshWeather extends WeatherTodayEvent {
  final int locationId;

  const RefreshWeather({@required this.locationId})
      : assert(locationId != null);

  @override
  List<Object> get props => [locationId];
}
