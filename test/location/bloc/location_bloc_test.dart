import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_app/location/bloc/event/request_all_locations_event.dart';
import 'package:flutter_app/location/bloc/location_bloc.dart';
import 'package:flutter_app/location/bloc/state/all_locations_requested_state.dart';
import 'package:flutter_app/location/bloc/state/initial_location_state.dart';
import 'package:flutter_app/location/repository/location_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../util_t.dart';

class _LocationRepositoryMocked extends Mock implements LocationRepository {}

void main() {
  _LocationRepositoryMocked _locationRepository;

  setUp(() {
    _locationRepository = _LocationRepositoryMocked();

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
      _locationRepository = _LocationRepositoryMocked();
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
}
