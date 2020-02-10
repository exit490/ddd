import 'package:flutter_app/location/geo_location/geo_location_client.dart';
import 'package:flutter_app/location/model/location_model.dart';
import 'package:flutter_app/location/no_sql/location_nosql_client.dart';
import 'package:flutter_app/meta_weather/meta_weather_api_client.dart';
import 'package:geolocator/geolocator.dart';

class LocationRepository {
  final GeoLocationApiClient geoLocationApiClient;
  final MetaWeatherApiClient metaWeatherApiClient;
  final LocationNoSqlClient locationNoSqlClient;

  LocationRepository({
    this.geoLocationApiClient,
    this.metaWeatherApiClient,
    this.locationNoSqlClient,
  }) : assert(
          geoLocationApiClient != null &&
              metaWeatherApiClient != null &&
              locationNoSqlClient != null,
        );

  toStoreLocationOnCache(locationModel) {
    locationNoSqlClient.save(locationModel);
  }

  buildDefaultLocation() async {
    final defaultModel = LocationModel(
      title: 'Rio de Janeiro',
      locationType: 'City',
      woeid: 455825,
      latLong: '-22.976730,-43.195080',
    );

    final Position myPosition = await geoLocationApiClient.getMyLocation();

    if (myPosition == null) {
      return defaultModel;
    }

    final locations = await metaWeatherApiClient.fetchLocationsByLatLong(
      myPosition.latitude,
      myPosition.longitude,
    );

    if (locations.isEmpty) {
      return defaultModel;
    }

    return locations[0];
  }

  fetchLocationsByCityName(city) async {
    return await metaWeatherApiClient.fetchLocationsByCityName(city);
  }

  getLocation(int locationIndex) {
    return locationNoSqlClient.restore(locationIndex);
  }

  restoreAllLocationsFromCache() {
    return locationNoSqlClient.restoreAll();
  }
}
