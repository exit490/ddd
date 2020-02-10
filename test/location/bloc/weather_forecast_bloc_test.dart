import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_app/location/bloc/location_bloc.dart';
import 'package:flutter_app/location/bloc/location_state.dart';
import 'package:flutter_app/location/repository/location_repository.dart';
import 'package:flutter_app/weather/model/weather_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class _LocationRepository extends Mock implements LocationRepository {}

void main() {
  _LocationRepository _locationRepository;

  setUp(() {
    _locationRepository = _LocationRepository();

//    when(
//      _weatherRepository.fetchingWeatherForecastFromLocation(0101),
//    ).thenAnswer(
//      (_) => Future.value(_mockedWeatherList()),
//    );
  });

  blocTest(
    'if initial location is expected ',
    build: () => LocationBloc(locationRepository: _locationRepository),
    expect: [InitialLocationState()],
  );

//  test('if add FetchWeatherForecastEvent', () async {
//    final bloc = WeatherForecastBloc(weatherRepository: _weatherRepository);
//    bloc.add(FetchWeatherForecastEvent(locationId: 0101));
//    await emitsExactly(bloc, [
//      InitialWeatherForecastState(),
//      LoadingWeatherForecastState(),
//      LoadedWeatherForecastState(
//        weatherForecast: _mockedWeatherList(),
//      )
//    ]);
//  });
//
//  test('if add RefreshWeatherForecastEvent', () async {
//    final bloc = WeatherForecastBloc(weatherRepository: _weatherRepository);
//    bloc.add(RefreshWeatherForecastEvent(locationId: 0101));
//    await emitsExactly(bloc, [
//      InitialWeatherForecastState(),
//      LoadingWeatherForecastState(),
//      LoadedWeatherForecastState(
//        weatherForecast: _mockedWeatherList(),
//      )
//    ]);
//  });
}

List<Weather> _mockedWeatherList() {
  List<Weather> mockedWeather = List();

  final weather = Weather();

  mockedWeather.add(weather);
  mockedWeather.add(weather);
  mockedWeather.add(weather);

  return mockedWeather;
}
