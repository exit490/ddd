import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_app/location/repository/location_repository.dart';
import 'package:flutter_app/search/bloc/search_location_bloc.dart';
import 'package:flutter_app/search/bloc/search_location_state.dart';
import 'package:flutter_app/search/event/typing_city_name_event.dart';
import 'package:flutter_app/search/state/found_locations_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../location/location_repository_mocked_util.dart';

class _LocationRepositoryMocked extends Mock implements LocationRepository {}

var _locationRepository = _LocationRepositoryMocked();

void main() {
  group('SearchLocationBloc', () {
    blocTest(
      'when instance search location bloc',
      build: () => SearchLocationBloc(locationRepository: _locationRepository),
      expect: [InitialSearchLocationState()],
    );

    _mockingFetchLocationsByCityName();

    blocTest(
      'when throws once event of typing city name',
      build: () => SearchLocationBloc(locationRepository: _locationRepository),
      act: (bloc) => bloc.add(TypingCityNameEvent(cityName: 'a')),
      wait: Duration(seconds: 2),
      expect: [
        InitialSearchLocationState(),
        FoundLocationsState(locations: getAllLocationsMocked())
      ],
    );

    blocTest('when throws twice event of typing city name',
        build: () =>
            SearchLocationBloc(locationRepository: _locationRepository),
        act: (bloc) {
          bloc.add(TypingCityNameEvent(cityName: 'a'));
          bloc.add(TypingCityNameEvent(cityName: 'a'));
          return;
        },
        wait: Duration(seconds: 2),
        expect: [
          InitialSearchLocationState(),
          FoundLocationsState(locations: getAllLocationsMocked())
        ],
        verify: () async {
          verify(_locationRepository.fetchLocationsByCityName('a')).called(2);
        });
  });
}

_mockingFetchLocationsByCityName() {
  when(_locationRepository.fetchLocationsByCityName('a')).thenAnswer(
    (_) => Stream.value(getAllLocationsMocked()),
  );
}
