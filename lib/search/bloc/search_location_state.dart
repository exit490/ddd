import 'package:equatable/equatable.dart';

abstract class SearchLocationState extends Equatable {
  const SearchLocationState();

  @override
  List<Object> get props => [];
}

class InitialSearchLocationState extends SearchLocationState {}
