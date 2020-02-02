import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class WeatherEvent extends Equatable {
  final int locationId;

  const WeatherEvent({
    @required this.locationId,
  }) : assert(locationId != null);

  @override
  List<Object> get props => [locationId];
}

class FetchWeather extends WeatherEvent {}

class RefreshWeather extends WeatherEvent {}
