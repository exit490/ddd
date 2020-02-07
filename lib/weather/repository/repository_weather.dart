import 'package:flutter_app/weather/model/model_weather.dart';
import 'package:meta/meta.dart';

import '../../meta_weather/api_client_meta_weather.dart';

class WeatherRepository {
  final MetaWeatherApiClient clientApiMetaWeather;

  WeatherRepository({
    @required this.clientApiMetaWeather,
  }) : assert(clientApiMetaWeather != null);

  Future<Weather> getWeatherFromLocation(int locationId) async {
    return clientApiMetaWeather.fetchWeather(locationId);
  }
}
