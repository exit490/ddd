import 'package:flutter_app/location/model/location_model.dart';

List<LocationModel> mockedLocationList() {
  List<LocationModel> mockedLocationList = List();
  mockedLocationList.add(mockedDefaultLocation());
  mockedLocationList.addAll(getAllLocationsMocked());
  return mockedLocationList;
}

List<LocationModel> getAllLocationsMocked() {
  List<LocationModel> mockedLocationList = List();
  final mockedLocation = LocationModel(
    title: 'Rio de Janeiro',
    locationType: 'City',
    woeid: 455825,
    latLong: '-22.976730,-43.195080',
  );

  mockedLocationList.add(mockedLocation);
  mockedLocationList.add(mockedLocation);
  mockedLocationList.add(mockedLocation);

  return mockedLocationList;
}

LocationModel mockedDefaultLocation() {
  return LocationModel(
    title: 'New York',
    locationType: 'City',
    woeid: 455825,
    latLong: '-22.976730,-43.195080',
  );
}
