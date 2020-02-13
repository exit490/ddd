import 'package:flutter/material.dart';
import 'package:flutter_app/location/model/location_model.dart';

import 'location_event.dart';

class StoreLocationOnCacheEvent extends LocationEvent {
  final LocationModel location;

  const StoreLocationOnCacheEvent({
    @required this.location,
  }) : assert(location != null);

  @override
  List<Object> get props => [location];
}
