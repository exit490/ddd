import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_app/location/bloc/location_bloc.dart';
import 'package:flutter_app/location/bloc/location_event.dart';
import 'package:flutter_app/location/bloc/location_state.dart';
import 'package:flutter_app/location/repository/location_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../util_t.dart';

class _LocationRepository extends Mock implements LocationRepository {}

void main() {
  _LocationRepository _locationRepository;

  setUp(() {
    _locationRepository = _LocationRepository();

    when(
      _locationRepository.buildDefaultLocation(),
    ).thenAnswer(
      (_) => Future.value(mockedDefaultLocation()),
    );

    when(
      _locationRepository.restoreAllLocationsFromCache(),
    ).thenAnswer(
      (_) => Future.value(mockedRestoredListLocationList()),
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
      AllLocationsRestoredState(locations: mockedLocationList()),
    ]);
  });

  test('if add StoreLocationOnCacheEvent', () async {
    final bloc = LocationBloc(locationRepository: _locationRepository);
    bloc.add(StoreLocationOnCacheEvent(
      location: mockedDefaultLocation(),
    ));
    await emitsExactly(bloc, [
      InitialLocationState(),
      AllLocationsRestoredState(locations: mockedLocationList()),
    ]);

    verify(
      _locationRepository.toStoreLocationOnCache(mockedDefaultLocation()),
    ).called(1);
  });
}
