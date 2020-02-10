import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_app/weather/model/weather_model.dart';
import 'package:flutter_app/weather/repository/weather_repository.dart';
import 'package:flutter_app/weather_forecast/bloc/weather_forecast_bloc.dart';
import 'package:flutter_app/weather_forecast/bloc/weather_forecast_event.dart';
import 'package:flutter_app/weather_forecast/bloc/weather_forecast_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class _WeatherRepository extends Mock implements WeatherRepository {}

void main() {
  _WeatherRepository _weatherRepository;

  setUp(() {
    _weatherRepository = _WeatherRepository();
  });

  blocTest(
    'if initial is expected ',
    build: () => WeatherForecastBloc(weatherRepository: _weatherRepository),
    expect: [InitialWeatherForecastState()],
  );

  test('if add FetchWeatherForecastEvent', () async {
    when(
      _weatherRepository.fetchingWeatherForecastFromLocation(0101),
    ).thenAnswer(
      (_) => Future.value(_mockedWeatherList()),
    );

    final bloc = WeatherForecastBloc(weatherRepository: _weatherRepository);
    bloc.add(FetchWeatherForecastEvent(locationId: 0101));
    await emitsExactly(bloc, [
      InitialWeatherForecastState(),
      LoadingWeatherForecastState(),
      LoadedWeatherForecastState(
        weatherForecast: _mockedWeatherList(),
      )
    ]);
  });

  test('if add RefreshWeatherForecastEvent', () async {
    when(
      _weatherRepository.fetchingWeatherForecastFromLocation(0101),
    ).thenAnswer(
      (_) => Future.value(_mockedWeatherList()),
    );

    final bloc = WeatherForecastBloc(weatherRepository: _weatherRepository);
    bloc.add(RefreshWeatherForecastEvent(locationId: 0101));
    await emitsExactly(bloc, [
      InitialWeatherForecastState(),
      LoadingWeatherForecastState(),
      LoadedWeatherForecastState(
        weatherForecast: _mockedWeatherList(),
      )
    ]);
  });
}

List<Weather> _mockedWeatherList() {
  List<Weather> mockedWeather = List();

  final weather = Weather();

  mockedWeather.add(weather);
  mockedWeather.add(weather);
  mockedWeather.add(weather);

  return mockedWeather;
}
