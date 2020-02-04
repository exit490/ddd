import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class WeatherTodayEvent extends Equatable {
  final int locationId;

  const WeatherTodayEvent({
    @required this.locationId,
  }) : assert(locationId != null);

  @override
  List<Object> get props => [locationId];
}

class FetchWeather extends WeatherTodayEvent {}

class RefreshWeather extends WeatherTodayEvent {}
