import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_app/location/model/location_model.dart';
import 'package:flutter_app/location/repository/location_repository.dart';
import 'package:flutter_app/location/search/bloc/search_location_event.dart';
import 'package:flutter_app/location/search/bloc/search_location_state.dart';

class SearchLocationBloc
    extends Bloc<SearchLocationEvent, SearchLocationState> {
  final LocationRepository locationRepository;
  StreamSubscription subscription;

  SearchLocationBloc({
    this.locationRepository,
  }) : assert(locationRepository != null);

  @override
  SearchLocationState get initialState => InitialSearchLocationState();

  @override
  Stream<SearchLocationState> mapEventToState(
      SearchLocationEvent event) async* {
    if (event is TypingLocationEvent) {
      delaySearch(event);
    }

    if (event is SearchLocationEvent) {
      yield* _mapSearchEventToState(event.location);
    }
  }

  delaySearch(event) {
    subscription?.cancel();
    subscription = halfSecondDelay(event.location);
  }

  halfSecondDelay(location) {
    return Stream.periodic(Duration(seconds: 1), (x) => x).take(1).listen(
          (tick) => add(SearchLocationEvent(
            location: location,
          )),
        );
  }

  Stream<SearchLocationState> _mapSearchEventToState(location) async* {
    final List<LocationModel> locations =
        await locationRepository.getLocationsByCityName(location);
    yield FoundLocationsState(locations: locations);
  }
}
