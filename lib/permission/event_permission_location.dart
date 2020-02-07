import 'package:equatable/equatable.dart';

abstract class EventLocationPermission extends Equatable {
  const EventLocationPermission();

  @override
  List<Object> get props => [];
}

class EventRequestLocationPermission extends EventLocationPermission {}

class EventCheckLocationPermission extends EventLocationPermission {}
