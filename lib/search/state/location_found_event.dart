import 'package:flutter_app/location/model/location_model.dart';
import 'package:flutter_app/search/event/search_location_event.dart';

class LocationsFoundEvent extends SearchLocationEvent {
  final List<LocationModel> locations;

  const LocationsFoundEvent({
    this.locations,
  });

  @override
  List<Object> get props => [locations];
}
