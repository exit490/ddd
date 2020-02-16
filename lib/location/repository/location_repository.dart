import 'package:flutter/material.dart';
import 'package:flutter_app/location/geo_location/geo_location_client.dart';
import 'package:flutter_app/location/model/location_model.dart';
import 'package:flutter_app/location/no_sql/location_nosql_client.dart';
import 'package:flutter_app/meta_weather/meta_weather_api_client.dart';
import 'package:geolocator/geolocator.dart';

class LocationRepository {
  final GeoLocationApiClient geoLocationApiClient;
  final MetaWeatherApiClient metaWeatherApiClient;
  final LocationNoSqlClient locationNoSqlClient;

  final _defaultLocationModel = LocationModel(
    title: 'Rio de Janeiro',
    locationType: 'City',
    woeid: 455825,
    latLong: '-22.976730,-43.195080',
  );

  LocationRepository({
    @required this.geoLocationApiClient,
    @required this.metaWeatherApiClient,
    @required this.locationNoSqlClient,
  });

  Stream<List<LocationModel>> toStoreLocationInCache(locationModel) async* {
    locationNoSqlClient.save(locationModel);
    yield* _attachDefaultLocationWithAllLocationsFromCache();
  }

  fetchLocationsByCityName(city) async {
    if (city.isEmpty) {
      return Future.value([]);
    }

    return await metaWeatherApiClient.fetchLocationsByCityName(city);
  }

  getLocation(int locationIndex) {
    return locationNoSqlClient.restore(locationIndex);
  }

  Future<List<LocationModel>> restoreAllLocationsFromCache() {
    return locationNoSqlClient.restoreAll();
  }

  Stream<List<LocationModel>> requestAllLocations() async* {
    yield* _attachDefaultLocationWithAllLocationsFromCache();
  }

  Stream<List<LocationModel>>
      _attachDefaultLocationWithAllLocationsFromCache() async* {
    final locations = List<LocationModel>.from(
      locationNoSqlClient.restoreAll(),
    );

    locations.add(await _getDefaultLocation());

    yield locations;
  }

  Future<LocationModel> _getDefaultLocation() async {
    return await _whatDefaultLocation();
  }

  Future<LocationModel> _whatDefaultLocation() async {
    final Position myPosition = await geoLocationApiClient.getMyLocation();

    if (myPosition == null) {
      return _defaultLocationModel;
    }

    final locations = await metaWeatherApiClient.fetchLocationsByLatLong(
      myPosition.latitude,
      myPosition.longitude,
    );

    if (locations.isEmpty) {
      return _defaultLocationModel;
    }

    final myLocation = locations[0];

    return myLocation;
  }
}
