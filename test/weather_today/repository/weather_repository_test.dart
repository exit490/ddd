import 'package:flutter_app/meta_weather/meta_weather_api_client.dart';
import 'package:flutter_app/meta_weather/model/meta_weather_model.dart';
import 'package:flutter_app/weather/model/weather_model.dart';
import 'package:flutter_app/weather/repository/weather_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class _MetaWeatherApiClientMocked extends Mock implements MetaWeatherApiClient {
}

main() {
  _MetaWeatherApiClientMocked metaWeatherApiClientMocked;
  WeatherRepository weatherRepository;

  setUp(() {
    metaWeatherApiClientMocked = _MetaWeatherApiClientMocked();
    weatherRepository = WeatherRepository(
      clientApiMetaWeather: metaWeatherApiClientMocked,
    );
  });

  test('expected weather forecast from weather repository ', () async {
    final mockedMetaWeatherModel = _mockedMetaWeatherModel();

    final mockedWeatherForecast = mockedMetaWeatherModel.consolidatedWeather
        .map((consolidated) => Weather.fromMetaWeather(
              consolidated,
              mockedMetaWeatherModel.woeid,
              mockedMetaWeatherModel.title,
            ))
        .toList();

    when(
      metaWeatherApiClientMocked.fetchWeatherForecast(1010),
    ).thenAnswer(
      (_) => Future.value(mockedMetaWeatherModel),
    );

    final weatherForecast =
        await weatherRepository.fetchingWeatherForecastFromLocation(1010);

    expect(weatherForecast[1].created, mockedWeatherForecast[1].created);
    expect(weatherForecast[2].applicableDate,
        mockedWeatherForecast[2].applicableDate);
    expect(weatherForecast[3].minTemp, mockedWeatherForecast[3].minTemp);
    expect(weatherForecast[4].location, mockedWeatherForecast[4].location);
    expect(weatherForecast[5].formattedCondition,
        mockedWeatherForecast[5].formattedCondition);
  });
}

MetaWeatherModel _mockedMetaWeatherModel() {
  return MetaWeatherModel.fromJson(_mockedJson);
}

final _mockedJson = {
  "consolidated_weather": [
    {
      "id": 5546054642565120,
      "weather_state_name": "Heavy Rain",
      "weather_state_abbr": "hr",
      "wind_direction_compass": "SW",
      "created": "2020-02-09T15:16:02.891955Z",
      "applicable_date": "2020-02-09",
      "min_temp": 8.26,
      "max_temp": 13.865,
      "the_temp": 12.68,
      "wind_speed": 19.31793867464938,
      "wind_direction": 222.667246271919,
      "air_pressure": 991.0,
      "humidity": 82,
      "visibility": 10.242993418436331,
      "predictability": 77
    },
    {
      "id": 4712651940691968,
      "weather_state_name": "Thunder",
      "weather_state_abbr": "t",
      "wind_direction_compass": "WSW",
      "created": "2020-02-09T15:16:02.896709Z",
      "applicable_date": "2020-02-10",
      "min_temp": 4.625,
      "max_temp": 8.61,
      "the_temp": 8.25,
      "wind_speed": 14.699829824154934,
      "wind_direction": 251.15531440626796,
      "air_pressure": 1000.5,
      "humidity": 62,
      "visibility": 11.137457249661974,
      "predictability": 80
    },
    {
      "id": 4940056366153728,
      "weather_state_name": "Heavy Rain",
      "weather_state_abbr": "hr",
      "wind_direction_compass": "W",
      "created": "2020-02-09T15:16:02.678856Z",
      "applicable_date": "2020-02-11",
      "min_temp": 3.965,
      "max_temp": 7.17,
      "the_temp": 6.24,
      "wind_speed": 14.33802406275617,
      "wind_direction": 258.8518016204599,
      "air_pressure": 1010.0,
      "humidity": 56,
      "visibility": 14.90700558736976,
      "predictability": 77
    },
    {
      "id": 6019575256711168,
      "weather_state_name": "Heavy Cloud",
      "weather_state_abbr": "hc",
      "wind_direction_compass": "WSW",
      "created": "2020-02-09T15:16:02.504127Z",
      "applicable_date": "2020-02-12",
      "min_temp": 3.875,
      "max_temp": 8.305,
      "the_temp": 7.415,
      "wind_speed": 9.82871954100586,
      "wind_direction": 251.16430919099713,
      "air_pressure": 1014.5,
      "humidity": 60,
      "visibility": 14.203613397757099,
      "predictability": 71
    },
    {
      "id": 5089673003139072,
      "weather_state_name": "Light Rain",
      "weather_state_abbr": "lr",
      "wind_direction_compass": "SW",
      "created": "2020-02-09T15:16:02.303239Z",
      "applicable_date": "2020-02-13",
      "min_temp": 4.31,
      "max_temp": 8.625,
      "the_temp": 8.59,
      "wind_speed": 10.854267952620695,
      "wind_direction": 235.30915374319116,
      "air_pressure": 997.0,
      "humidity": 71,
      "visibility": 8.866966913226756,
      "predictability": 75
    },
    {
      "id": 4575518038949888,
      "weather_state_name": "Heavy Rain",
      "weather_state_abbr": "hr",
      "wind_direction_compass": "SSW",
      "created": "2020-02-09T15:16:05.124395Z",
      "applicable_date": "2020-02-14",
      "min_temp": 4.055,
      "max_temp": 10.585,
      "the_temp": 7.96,
      "wind_speed": 8.334805336832895,
      "wind_direction": 192.5,
      "air_pressure": 1007.0,
      "humidity": 81,
      "visibility": 9.999726596675416,
      "predictability": 77
    }
  ],
  "time": "2020-02-09T15:49:20.606738Z",
  "sun_rise": "2020-02-09T07:26:31.649999Z",
  "sun_set": "2020-02-09T17:03:34.411788Z",
  "timezone_name": "LMT",
  "parent": {
    "title": "England",
    "location_type": "Region / State / Province",
    "woeid": 24554868,
    "latt_long": "52.883560,-1.974060"
  },
  "sources": [
    {
      "title": "BBC",
      "slug": "bbc",
      "url": "http://www.bbc.co.uk/weather/",
      "crawl_rate": 360
    },
    {
      "title": "Forecast.io",
      "slug": "forecast-io",
      "url": "http://forecast.io/",
      "crawl_rate": 480
    },
    {
      "title": "HAMweather",
      "slug": "hamweather",
      "url": "http://www.hamweather.com/",
      "crawl_rate": 360
    },
    {
      "title": "Met Office",
      "slug": "met-office",
      "url": "http://www.metoffice.gov.uk/",
      "crawl_rate": 180
    },
    {
      "title": "OpenWeatherMap",
      "slug": "openweathermap",
      "url": "http://openweathermap.org/",
      "crawl_rate": 360
    },
    {
      "title": "Weather Underground",
      "slug": "wunderground",
      "url": "https://www.wunderground.com/?apiref=fc30dc3cd224e19b",
      "crawl_rate": 720
    },
    {
      "title": "World Weather Online",
      "slug": "world-weather-online",
      "url": "http://www.worldweatheronline.com/",
      "crawl_rate": 360
    }
  ],
  "title": "London",
  "location_type": "City",
  "woeid": 44418,
  "latt_long": "51.506321,-0.12714",
  "timezone": "Europe/London"
};
