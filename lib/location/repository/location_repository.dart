import 'package:flutter_app/location/geo_location/geo_location_client.dart';
import 'package:flutter_app/location/model/location_model.dart';
import 'package:flutter_app/location/no_sql/location_nosql_client.dart';
import 'package:flutter_app/meta_weather/meta_weather_api_client.dart';
import 'package:geolocator/geolocator.dart';

class LocationRepository {
  final GeoLocationApiClient geoLocationApiClient;
  final MetaWeatherApiClient metaWeatherApiClient;
  final LocationNoSqlClient locationNoSqlClient;

  LocationRepository(
    this.geoLocationApiClient,
    this.metaWeatherApiClient,
    this.locationNoSqlClient,
  ) : assert(
          geoLocationApiClient != null &&
              metaWeatherApiClient != null &&
              locationNoSqlClient != null,
        );

  getDefaultLocation() async {
    final Position myPosition = await geoLocationApiClient.getMyLocation();
    final locations = await metaWeatherApiClient.fetchLocationsByLatLong(
      myPosition.latitude,
      myPosition.longitude,
    );

    if (locations.isEmpty) {
      return LocationModel(
        'Rio de Janeiro',
        'City',
        455825,
        '-22.976730,-43.195080',
      );
    }

    return locations[0];
  }

  getAllLocationCached() {
    return locationNoSqlClient.restoreAll();
  }
}
