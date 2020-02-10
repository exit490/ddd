import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_app/location/bloc/location_bloc.dart';
import 'package:flutter_app/location/bloc/location_event.dart';
import 'package:flutter_app/location/bloc/location_state.dart';
import 'package:flutter_app/location/model/location_model.dart';
import 'package:flutter_app/location/repository/location_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class _LocationRepository extends Mock implements LocationRepository {}

void main() {
  _LocationRepository _locationRepository;

  setUp(() {
    _locationRepository = _LocationRepository();

    when(
      _locationRepository.buildDefaultLocation(),
    ).thenAnswer(
      (_) => Future.value(_mockedDefaultLocation()),
    );

    when(
      _locationRepository.restoreAllLocationsFromCache(),
    ).thenAnswer(
      (_) => Future.value(_mockedRestoredListLocationList()),
    );
  });

  blocTest(
    'if initial location is expected ',
    build: () => LocationBloc(locationRepository: _locationRepository),
    expect: [InitialLocationState()],
  );

  test('if add BuildAllLocationEvent', () async {
    final bloc = LocationBloc(locationRepository: _locationRepository);
    bloc.add(BuildAllLocationEvent());
    await emitsExactly(bloc, [
      InitialLocationState(),
      AllLocationsRestoredState(locations: _mockedLocationList()),
    ]);
  });
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

List<LocationModel> _mockedLocationList() {
  List<LocationModel> mockedLocationList = List();
  mockedLocationList.add(_mockedDefaultLocation());
  mockedLocationList.addAll(_mockedRestoredListLocationList());
  return mockedLocationList;
}

List<LocationModel> _mockedRestoredListLocationList() {
  List<LocationModel> mockedLocationList = List();
  final mockedLocation = LocationModel(
    title: 'Rio de Janeiro',
    locationType: 'City',
    woeid: 455825,
    latLong: '-22.976730,-43.195080',
  );

  mockedLocationList.add(mockedLocation);
  mockedLocationList.add(mockedLocation);
  mockedLocationList.add(mockedLocation);

  return mockedLocationList;
}

LocationModel _mockedDefaultLocation() {
  return LocationModel(
    title: 'New York',
    locationType: 'City',
    woeid: 455825,
    latLong: '-22.976730,-43.195080',
  );
}
