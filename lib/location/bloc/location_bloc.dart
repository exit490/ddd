import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_app/location/bloc/event/all_locations_requested_event.dart';
import 'package:flutter_app/location/bloc/event/location_event.dart';
import 'package:flutter_app/location/bloc/event/request_all_locations_event.dart';
import 'package:flutter_app/location/bloc/event/to_store_location_in_cache_event.dart';
import 'package:flutter_app/location/bloc/state/all_locations_requested_state.dart';
import 'package:flutter_app/location/bloc/state/initial_location_state.dart';
import 'package:flutter_app/location/bloc/state/location_state.dart';
import 'package:flutter_app/location/repository/location_repository.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationRepository locationRepository;

  LocationBloc({
    this.locationRepository,
  }) : assert(locationRepository != null);

  @override
  LocationState get initialState => InitialLocationState();

  @override
  Stream<LocationState> mapEventToState(LocationEvent event) async* {
    if (event is RequestAllLocationsEvent) {
      _requestAllLocationsFromLocalRepository();
    }

    if (event is ToStoreLocationInCacheEvent) {
      _storeLocationOnCache(event.location);
    }

    if (event is AllLocationsRequestedEvent) {
      yield AllLocationsRequestedState(locations: event.locations);
    }
  }

  _requestAllLocationsFromLocalRepository() {
    locationRepository.requestAllLocations().listen(
          (locations) => add(AllLocationsRequestedEvent(locations: locations)),
        );
  }

  _storeLocationOnCache(location) async {
    locationRepository.toStoreLocationInCache(location).listen(
          (locations) => add(AllLocationsRequestedEvent(locations: locations)),
        );
  }
}
