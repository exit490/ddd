import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_app/location/repository/location_repository.dart';
import 'package:flutter_app/search/bloc/search_location_bloc.dart';
import 'package:flutter_app/search/bloc/search_location_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class _LocationRepositoryMocked extends Mock implements LocationRepository {}

var _locationRepository = _LocationRepositoryMocked();

void main() {
  group('SearchLocationBloc', () {
    blocTest(
      'when instance search location bloc ',
      build: () => SearchLocationBloc(locationRepository: _locationRepository),
      expect: [InitialSearchLocationState()],
    );
  });
}
