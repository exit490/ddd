import 'package:flutter_app/meta_weather/api_client_meta_weather.dart';
import 'package:flutter_app/weather/model/model_weather.dart';
import 'package:flutter_app/weather/repository/repository_weather.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MetaWeatherApiClientMocked extends Mock implements MetaWeatherApiClient {}

main() {
  MetaWeatherApiClientMocked metaWeatherApiClientMocked;
  WeatherRepository weatherRepository;

  setUp(() {
    metaWeatherApiClientMocked = MetaWeatherApiClientMocked();
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
