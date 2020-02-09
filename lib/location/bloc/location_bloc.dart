import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_app/location/bloc/location_event.dart';
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
    if (event is BuildAllLocationEvent) {
      yield* buildAllLocations();
    }

    if (event is StoreLocationOnCacheEvent) {
      yield* storeLocationOnCache(event.location);
    }
  }

  Stream<LocationState> buildAllLocations() async* {
    final locations = await getAllLocations();
    yield AllLocationsRestoredState(locations: locations);
  }

  Stream<LocationState> storeLocationOnCache(location) async* {
    await locationRepository.toStoreLocationOnCache(location);
    final locations = await getAllLocations();
    yield AllLocationsRestoredState(locations: locations);
  }

  getAllLocations() async {
    final List<LocationModel> locations = List();
    final defaultLocation = await locationRepository.buildDefaultLocation();
    locations.add(defaultLocation);

    final locationsRestoredFromCache =
        await locationRepository.restoreAllLocationsFromCache();

    locations.addAll(locationsRestoredFromCache);

    return locations;
  }
}
