import 'package:equatable/equatable.dart';

class SearchLocationEvent extends Equatable {
  const SearchLocationEvent();

  @override
  List<Object> get props => [];
}

class TypingLocationEvent extends SearchLocationEvent {
  final String location;

  const TypingLocationEvent({
    this.location,
  });

  @override
  List<Object> get props => [location];
}

class FetchLocationEvent extends SearchLocationEvent {
  final String location;

  const FetchLocationEvent({
    this.location,
  });

  @override
  List<Object> get props => [location];
}
