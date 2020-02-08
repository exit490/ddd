import 'package:flutter_app/location/model/location_model.dart';
import 'package:hive/hive.dart';

class LocationNoSqlClient {
  Box<LocationModel> locationBox;

  LocationNoSqlClient(this.locationBox) : assert(locationBox != null);

  save(LocationModel locationModel) {
    locationBox.add(locationModel);
  }

  restoreAll() {
    List<LocationModel> locationModelList = [];

    for (var i = 0; i < locationBox.length; i++) {
      var locationModel = locationBox.getAt(i);
      locationModelList.add(locationModel);
    }

    return locationModelList;
  }
}
