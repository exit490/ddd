import 'package:flutter_app/location/geo_location/geo_location_client.dart';
import 'package:flutter_app/location/model/location_model.dart';
import 'package:flutter_app/location/no_sql/location_nosql_client.dart';
import 'package:flutter_app/location/repository/location_repository.dart';
import 'package:flutter_app/meta_weather/meta_weather_api_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class _GeoLocationApiClientMocked extends Mock implements GeoLocationApiClient {
}

class _MetaWeatherApiClientMocked extends Mock implements MetaWeatherApiClient {
}

class _LocationNoSqlClientMocked extends Mock implements LocationNoSqlClient {}

main() {
  _MetaWeatherApiClientMocked metaWeatherApiClientMocked;
  _GeoLocationApiClientMocked geoLocationApiClientMocked;
  _LocationNoSqlClientMocked locationNoSqlClientMocked;
  LocationRepository locationRepository;

  setUp(() {
    metaWeatherApiClientMocked = _MetaWeatherApiClientMocked();
    geoLocationApiClientMocked = _GeoLocationApiClientMocked();
    locationNoSqlClientMocked = _LocationNoSqlClientMocked();
    locationRepository = LocationRepository(
      locationNoSqlClient: locationNoSqlClientMocked,
      geoLocationApiClient: geoLocationApiClientMocked,
      metaWeatherApiClient: metaWeatherApiClientMocked,
    );
  });

  test('expected save method is called', () async {
    final localModel = LocationModel();
    await locationRepository.toStoreLocationOnCache(LocationModel());

    verify(
      locationNoSqlClientMocked.save(localModel),
    ).called(1);
  });
}
