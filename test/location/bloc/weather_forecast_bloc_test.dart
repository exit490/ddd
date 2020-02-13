import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_app/location/bloc/event/request_all_locations_event.dart';
import 'package:flutter_app/location/bloc/event/store_location_on_cache_event.dart';
import 'package:flutter_app/location/bloc/location_bloc.dart';
import 'package:flutter_app/location/bloc/state/all_locations_restored_state.dart';
import 'package:flutter_app/location/bloc/state/initial_location_state.dart';
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
      _locationRepository.getDefaultLocation(),
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

  blocTest(
    'when build all location event',
    build: () {
      _locationRepository = _LocationRepository();
      when(
        _locationRepository.requestAllLocations(),
      ).thenAnswer(
        (_) => Stream.value(mockedRestoredListLocationList()),
      );
      return LocationBloc(locationRepository: _locationRepository);
    },
    act: (bloc) => bloc.add(RequestAllLocationsEvent()),
    wait: Duration(seconds: 1),
    expect: [
      InitialLocationState(),
      AllLocationsRequestedState(locations: mockedRestoredListLocationList())
    ],
  );

  test('if add StoreLocationOnCacheEvent', () async {
    final bloc = LocationBloc(locationRepository: _locationRepository);
    bloc.add(StoreLocationOnCacheEvent(
      location: mockedDefaultLocation(),
    ));
    await emitsExactly(bloc, [
      InitialLocationState(),
      AllLocationsRequestedState(locations: mockedLocationList()),
    ]);

    verify(
      _locationRepository.toStoreLocationOnCache(mockedDefaultLocation()),
    ).called(1);
  });
}
