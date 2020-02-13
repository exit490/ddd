import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_app/location/bloc/event/all_locations_from_cache_event.dart';
import 'package:flutter_app/location/bloc/event/location_event.dart';
import 'package:flutter_app/location/bloc/event/request_all_locations_event.dart';
import 'package:flutter_app/location/bloc/event/store_location_on_cache_event.dart';
import 'package:flutter_app/location/bloc/location_state.dart';
import 'package:flutter_app/location/model/location_model.dart';
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
    if (event is AllLocationsFromCacheEvent) {
      yield AllLocationsRestoredState(locations: event.locations);
    }

    if (event is RequestAllLocationsEvent) {
      buildAllLocations();
    }

    if (event is StoreLocationOnCacheEvent) {
      yield* storeLocationOnCache(event.location);
    }
  }

  buildAllLocations() async {
    locationRepository
        .attachDefaultLocationWithAllLocationsFromCache()
        .listen((locations) {
      add(AllLocationsFromCacheEvent(locations: locations));
    });
  }

  Stream<LocationState> storeLocationOnCache(location) async* {
    await locationRepository.toStoreLocationOnCache(location);
    final locations = await getAllLocations();
    yield AllLocationsRestoredState(locations: locations);
  }

  getAllLocations() async {
    final List<LocationModel> locations = List();
    final defaultLocation = await locationRepository.getDefaultLocation();
    locations.add(defaultLocation);

    final locationsRestoredFromCache =
        await locationRepository.restoreAllLocationsFromCache();

    locations.addAll(locationsRestoredFromCache);

    return locations;
  }
}
