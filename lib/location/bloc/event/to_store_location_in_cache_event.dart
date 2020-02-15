import 'package:flutter/material.dart';
import 'package:flutter_app/location/model/location_model.dart';

import 'location_event.dart';

class ToStoreLocationInCacheEvent extends LocationEvent {
  final LocationModel location;

  const ToStoreLocationInCacheEvent({
    @required this.location,
  }) : assert(location != null);

  @override
  List<Object> get props => [location];
}
