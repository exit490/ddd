import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class EventWeatherToday extends Equatable {
  const EventWeatherToday();
}

class FetchWeatherTodayEvent extends EventWeatherToday {
  final int locationId;

  const FetchWeatherTodayEvent({@required this.locationId})
      : assert(locationId != null);

  @override
  List<Object> get props => [locationId];
}

class RefreshWeather extends EventWeatherToday {
  final int locationId;

  const RefreshWeather({@required this.locationId})
      : assert(locationId != null);

  @override
  List<Object> get props => [locationId];
}
