import 'dart:async';

import 'package:flutter_app/weather/weather.dart';
import 'package:meta/meta.dart';

import 'meta_weather_api_client.dart';

class WeatherRepository {
  final MetaWeatherApiClient metaWeatherApiClient;

  WeatherRepository({
    @required this.metaWeatherApiClient,
  }) : assert(metaWeatherApiClient != null);

  Future<Weather> getWeather(String city) async {
    final int locationId = await metaWeatherApiClient.getLocationId(city);
    return metaWeatherApiClient.fetchWeather(locationId);
  }
}
