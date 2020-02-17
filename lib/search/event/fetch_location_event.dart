import 'package:flutter_app/search/event/search_location_event.dart';

class FetchLocationEvent extends SearchLocationEvent {
  final String cityName;

  const FetchLocationEvent({
    this.cityName,
  });

  @override
  List<Object> get props => [cityName];
}
