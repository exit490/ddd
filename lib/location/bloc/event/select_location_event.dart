import 'package:flutter/material.dart';

import 'location_event.dart';

class SelectLocationEvent extends LocationEvent {
  final int locationIndex;

  const SelectLocationEvent({
    @required this.locationIndex,
  });

  @override
  List<Object> get props => [locationIndex];
}
