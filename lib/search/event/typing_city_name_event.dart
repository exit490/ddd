import 'package:flutter_app/search/event/search_location_event.dart';

class TypingCityNameEvent extends SearchLocationEvent {
  final String cityName;

  const TypingCityNameEvent({
    this.cityName,
  });

  @override
  List<Object> get props => [cityName];
}
