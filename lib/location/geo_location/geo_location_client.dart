import 'package:geolocator/geolocator.dart';

class GeoLocationApiClient {
  getMyLocation() async {
    return await Geolocator().getLastKnownPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}
