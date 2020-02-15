import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_app/location/bloc/event/request_all_locations_event.dart';
import 'package:flutter_app/location/bloc/location_bloc.dart';
import 'package:flutter_app/location/bloc/state/all_locations_requested_state.dart';
import 'package:flutter_app/location/bloc/state/initial_location_state.dart';
import 'package:flutter_app/location/repository/location_repository.dart';
import 'package:mockito/mockito.dart';

import '../location_repository_mocked_util.dart';

class _LocationRepositoryMocked extends Mock implements LocationRepository {}

void main() {
  blocTest(
    'if initial location is expected ',
    build: () => LocationBloc(locationRepository: _LocationRepositoryMocked()),
    expect: [InitialLocationState()],
  );

  blocTest(
    'when build all location event',
    build: () {
      return LocationBloc(locationRepository: _mockingRequestAllLocations());
    },
    act: (bloc) => bloc.add(RequestAllLocationsEvent()),
    wait: Duration(seconds: 1),
    expect: [
      InitialLocationState(),
      AllLocationsRequestedState(locations: getAllLocationsMocked())
    ],
  );
}

_mockingRequestAllLocations() {
  final _locationRepository = _LocationRepositoryMocked();
  when(_locationRepository.requestAllLocations()).thenAnswer(
    (_) => Stream.value(getAllLocationsMocked()),
  );
  return _locationRepository;
}
