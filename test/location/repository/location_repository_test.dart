import 'package:flutter_test/flutter_test.dart';

//class _GeoLocationApiClientMocked extends Mock implements GeoLocationApiClient {
//}
//
//class _MetaWeatherApiClientMocked extends Mock implements MetaWeatherApiClient {
//}
//
//class _LocationNoSqlClientMocked extends Mock implements LocationNoSqlClient {}

main() {
//  _MetaWeatherApiClientMocked metaWeatherApiClientMocked;
//  _GeoLocationApiClientMocked geoLocationApiClientMocked;
//  _LocationNoSqlClientMocked locationNoSqlClientMocked;

  setUp(() {
//    metaWeatherApiClientMocked = _MetaWeatherApiClientMocked();
//    geoLocationApiClientMocked = _GeoLocationApiClientMocked();
//    locationNoSqlClientMocked = _LocationNoSqlClientMocked();
//    locationRepository = LocationRepository(
//      locationNoSqlClient: locationNoSqlClientMocked,
//      geoLocationApiClient: geoLocationApiClientMocked,
//      metaWeatherApiClient: metaWeatherApiClientMocked,
//    );
  });

  test('if location from my position is expected', () async {
//    when(
//      geoLocationApiClientMocked.getMyLocation(),
//    ).thenAnswer(
//      (_) => Position(latitude: 1, longitude: 2),
//    );
//
//    when(
//      metaWeatherApiClientMocked.fetchLocationsByLatLong(1, 2),
//    ).thenAnswer(
//      (_) => Future.value(mockedLocationList()),
//    );
//
//    final location = await locationRepository.getDefaultLocation();
//
//    expect(mockedLocationList()[0], location);
  });

  test('if locations is empty position is expected', () async {
//    when(
//      geoLocationApiClientMocked.getMyLocation(),
//    ).thenAnswer(
//      (_) => Position(latitude: 1, longitude: 2),
//    );
//
//    when(
//      metaWeatherApiClientMocked.fetchLocationsByLatLong(1, 2),
//    ).thenAnswer(
//      (_) => Future.value([]),
//    );
//
//    final location = await locationRepository.getDefaultLocation();
//    final locationModel = LocationModel(
//      title: 'Rio de Janeiro',
//      locationType: 'City',
//      woeid: 455825,
//      latLong: '-22.976730,-43.195080',
//    );
//
//    expect(locationModel, location);
  });

  test('if position is null', () async {
//    when(
//      geoLocationApiClientMocked.getMyLocation(),
//    ).thenAnswer(
//      (_) => null,
//    );
//
//    final location = await locationRepository.getDefaultLocation();
//    final locationModel = LocationModel(
//      title: 'Rio de Janeiro',
//      locationType: 'City',
//      woeid: 455825,
//      latLong: '-22.976730,-43.195080',
//    );
//
//    expect(locationModel, location);
  });
}
