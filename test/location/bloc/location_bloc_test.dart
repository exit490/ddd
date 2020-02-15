import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_app/location/bloc/event/request_all_locations_event.dart';
import 'package:flutter_app/location/bloc/event/to_store_location_in_cache_event.dart';
import 'package:flutter_app/location/bloc/location_bloc.dart';
import 'package:flutter_app/location/bloc/state/all_locations_requested_state.dart';
import 'package:flutter_app/location/bloc/state/initial_location_state.dart';
import 'package:flutter_app/location/model/location_model.dart';
import 'package:flutter_app/location/repository/location_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../location_repository_mocked_util.dart';

class _LocationRepositoryMocked extends Mock implements LocationRepository {}

var _locationRepository = _LocationRepositoryMocked();

void main() {
  group('LocationBloc', () {
    blocTest(
      'when instance location bloc ',
      build: () => LocationBloc(locationRepository: _locationRepository),
      expect: [InitialLocationState()],
    );

    _mockingRequestAllLocations();

    blocTest(
      'when request all location event is throws',
      build: () {
        return LocationBloc(locationRepository: _locationRepository);
      },
      act: (bloc) => bloc.add(RequestAllLocationsEvent()),
      wait: Duration(seconds: 1),
      expect: [
        InitialLocationState(),
        AllLocationsRequestedState(locations: getAllLocationsMocked())
      ],
    );

    _mockingToStoreLocationOnCache();

    blocTest('when  event to store location in cache is throws',
        build: () {
          return LocationBloc(locationRepository: _locationRepository);
        },
        act: (bloc) =>
            bloc.add(ToStoreLocationInCacheEvent(location: LocationModel())),
        wait: Duration(seconds: 1),
        expect: [
          InitialLocationState(),
          AllLocationsRequestedState(locations: getAllLocationsMocked())
        ],
        verify: () async {
          verify(_locationRepository.toStoreLocationInCache(
            LocationModel(),
          )).called(1);
        });
  });
}

_mockingRequestAllLocations() {
  when(_locationRepository.requestAllLocations()).thenAnswer(
    (_) => Stream.value(getAllLocationsMocked()),
  );
}

_mockingToStoreLocationOnCache() {
  when(_locationRepository.toStoreLocationInCache(LocationModel())).thenAnswer(
    (_) => Stream.value(getAllLocationsMocked()),
  );
}
