import 'package:flutter_app/weather/weather.dart';
import 'package:meta/meta.dart';

import '../../meta_weather/meta_weather_api_client.dart';

class WeatherRepository {
  final MetaWeatherApiClient metaWeatherApiClient;

  WeatherRepository({
    @required this.metaWeatherApiClient,
  }) : assert(metaWeatherApiClient != null);

  Future<Weather> getWeatherFromLocation(int locationId) async {
    return metaWeatherApiClient.fetchWeather(locationId);
  }
}
