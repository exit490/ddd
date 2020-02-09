import 'package:flutter_app/weather/model/weather_model.dart';
import 'package:meta/meta.dart';

import '../../meta_weather/meta_weather_api_client.dart';

class WeatherRepository {
  final MetaWeatherApiClient clientApiMetaWeather;

  WeatherRepository({
    @required this.clientApiMetaWeather,
  }) : assert(clientApiMetaWeather != null);

  Future<Weather> getWeatherFromLocation(int locationId) async {
    return clientApiMetaWeather.fetchWeather(locationId);
  }

  Future<List<Weather>> fetchingWeatherForecastFromLocation(
      int locationId) async {
    final metaWeatherModel =
        await clientApiMetaWeather.fetchWeatherForecast(locationId);

    return metaWeatherModel.consolidatedWeather
        .map((consolidated) => Weather.fromMetaWeather(
              consolidated,
              metaWeatherModel.woeid,
              metaWeatherModel.title,
            ))
        .toList();
  }
}
