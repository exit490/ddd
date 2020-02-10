import 'package:flutter_app/meta_weather/meta_weather_api_client.dart';
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

  test('expected weather from weather repository ', () async {
    Weather weather = Weather(
      condition: WeatherCondition.clear,
      formattedCondition: 'Clear',
      minTemp: 15,
      maxTemp: 20,
      locationId: 0,
      location: 'Chicago',
      lastUpdated: DateTime(2019),
    );

    when(
      metaWeatherApiClientMocked.fetchWeather(2487956),
    ).thenAnswer(
      (_) => Future.value(weather),
    );

    var weatherFromRepository =
        await weatherRepository.getWeatherFromLocation(2487956);

    expect(weatherFromRepository, weather);
  });
}
