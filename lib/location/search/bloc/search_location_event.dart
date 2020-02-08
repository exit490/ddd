import 'package:equatable/equatable.dart';

class SearchLocationEvent extends Equatable {
  final String location;

  const SearchLocationEvent({
    this.location,
  }) : assert(location != null);

  @override
  List<Object> get props => [location];
}

class TypingLocationEvent extends SearchLocationEvent {
  final String location;

  const TypingLocationEvent({
    this.location,
  }) : assert(location != null);

  @override
  List<Object> get props => [location];
}
